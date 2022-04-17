#SingleInstance, Force

contatos := []

Gui, Font, s12 Bold
Gui, Add, Text, x165 y19 h20 , Agenda Telefonica

Gui, Font, s10 Bold
Gui, Add, Text, x170 y59 h20 , Adicionar Contato
Gui, Font
Gui, Add, Text, x32 y99 w30 h20 , Nome:
Gui, Add, Text, x272 y99 w60 h20 , Sobrenome
Gui, Add, Text, x32 y139 w80 h20 , N de Telefone:
Gui, Add, Edit, x72 y99 w100 h20 vNome
Gui, Add, Edit, x332 y99 w130 h20 vSobrenome
Gui, Add, Edit, x112 y139 w110 h20 vTelefone

Gui, Font, s10 Bold
Gui, Add, Text, x170 y199 h20 , Pesquisar Contato
Gui, Font
Gui, Add, ListView, AltSubmit x12 y269 w460 h140, Nome completo|Telefone
Gui, Add, Button, x272 y139 w120 h20 gAddFone, Adicionar
Gui, Add, Edit, x142 y239 w100 h20 vNomePesquisar, 
Gui, Add, Text, x102 y239 w40 h20 , Nome:
Gui, Add, Button, x262 y239 w70 h20 gPesquisarContato, Pesquisar

Gui, Show, w484 h419, Agenda Telefonica
return

AddFone:
    Gui, Submit, NoHide
    contatos.Push([nome,sobrenome,telefone]) ; add no vetor
    addOnList(contatos[contatos.Length()]) ; adiciona o ultimo na lista
    Return
PesquisarContato:
    Gui, Submit, NoHide
    len := contatos.Length()
    Loop %len% {
        contato := % contatos[A_Index]
        fullNome := % contato[1] . " " . contato[2]

        if(isSubString(fullNome,nomePesquisar)){
            fone := % contato[3]
            MsgBox, % "Nome: " . fullNome . "`rFone: " . fone 
        }
    }
    Return
GuiClose:
    ExitApp

addOnList(contato){
    fullNome := % contato[1] . " " . contato[2]
    LV_Add("",fullNome,contato[3])
}

isSubString(str,substr){
    delim := " "
    Loop, Parse, str, % `delim
    {
        if(A_LoopField=substr)
            return True
    }
    Return False
}