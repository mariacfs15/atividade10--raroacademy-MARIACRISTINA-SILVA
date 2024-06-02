*** Settings ***

Resource    ../../base.robot
Resource    ../utils/commons.robot

*** Variables ***

${TELAINICIAL}           id=br.com.pztec.estoque:id/todoObjeto
${PAGINAINICIAL}         id=br.com.pztec.estoque:id/scrollView1

${NOVO}                  id=br.com.pztec.estoque:id/Button1

${CAMPO_CODIGO}          xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_codigo"]
${CAMPO_DESCRICAO}       id=br.com.pztec.estoque:id/txt_descricao
${CAMPO_UNIDADE}         id=br.com.pztec.estoque:id/txt_unidade
${CAMPO_QUANTIDADE}      id=br.com.pztec.estoque:id/txt_quantidade
${CAMPO_VALUNIT}         id=br.com.pztec.estoque:id/txt_valunit
${CAMPO_LOTE}            id=br.com.pztec.estoque:id/txt_lote
${SALVARPROD}            id=br.com.pztec.estoque:id/btn_gravar_assunto

${PRODUTOCRIADO}         id=br.com.pztec.estoque:id/linha_parte1

${ADDPRODUTO}            id=br.com.pztec.estoque:id/entrada
${SUBPRODUTO}            xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/saida"]
${EDITAR}                id=br.com.pztec.estoque:id/editar
${DELETAR}               id=br.com.pztec.estoque:id/deletar
${MENSAGEM}              id=android:id/message
${NAO}                   id=android:id/button2
${SIM}                   id=android:id/button1
${SALVAR}                id=br.com.pztec.estoque:id/btn_salvar                

${PESQUISAR}             id=android:id/search_button

${CAMPO_ADDPROD}         id=br.com.pztec.estoque:id/txt_qtdentrada
${CAMPO_SUBPROD}         id=br.com.pztec.estoque:id/txt_qtdsaida
${CAMPO_PROCURAR}        id=android:id/search_src_text
${TELA}                  xpath=//android.widget.ScrollView[@resource-id="br.com.pztec.estoque:id/scrollView1"]
${QUANTIDADEPROD}        id=br.com.pztec.estoque:id/txt_quantidade
${ERROMENSAGEM}          id=android:id/message

${DESCRICAO01}           xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_descricao"]
${VALOR}                 xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_valunit"]


*** Keywords ***

Dado que o usuário acessou a página inicial do App
    Wait Until Element Is Visible       ${TELAINICIAL}
    Wait Until Element Is Visible       ${PAGINAINICIAL}

Quando selecionar a opção "Novo"
    Espera o elemento e faz o clique    ${NOVO} 

E preencher o formulário de cadastro de produto
    [Arguments]      ${codigo}    ${descricao}    ${unid}    ${quant}    ${val}         
    Input Text    ${CAMPO_CODIGO}         ${codigo}
    Input Text    ${CAMPO_DESCRICAO}      ${descricao}
    Input Text    ${CAMPO_UNIDADE}        ${unid}
    Input Text    ${CAMPO_QUANTIDADE}     ${quant}
    Input Text    ${CAMPO_VALUNIT}        ${val}
    
    Press Keycode    4
    Swipe By Percent    50    50    50    10
    
    Input Text    ${CAMPO_LOTE}    A001
    
    Espera o elemento e faz o clique    ${SALVARPROD} 

Então o produto é cadastrado com sucesso
    Wait Until Element Is Visible    ${PRODUTOCRIADO}

E preencher o formulário de cadastro de produto, deixando o campo - Descrição - em branco 
    [Arguments]      ${codigo}    ${unid}    ${quant}    ${val}         
    Input Text    ${CAMPO_CODIGO}         ${codigo}
    Input Text    ${CAMPO_UNIDADE}        ${unid}
    Input Text    ${CAMPO_QUANTIDADE}     ${quant}
    Input Text    ${CAMPO_VALUNIT}        ${val}
    
    Press Keycode    4 
    Swipe By Percent    50    50    50    10
    
    Input Text    ${CAMPO_LOTE}    A001
    
    Espera o elemento e faz o clique    ${SALVARPROD} 

Então o produto não é cadastrado com sucesso e exibe uma mensagem de erro 
    Click Element                       ${CAMPO_DESCRICAO}
    Capture Page Screenshot
    Press Keycode    4
    Press Keycode    4
    Element Should Be Visible       ${PAGINAINICIAL}
    ...    
E preencher o formulário de cadastro de produto, deixando o campo - Quantidade - em branco
   [Arguments]      ${codigo}    ${descricao}    ${unid}    ${val}       
    Input Text    ${CAMPO_CODIGO}         ${codigo}
    Input Text    ${CAMPO_DESCRICAO}      ${descricao}
    Input Text    ${CAMPO_UNIDADE}        ${unid}
    Input Text    ${CAMPO_VALUNIT}        ${val}
    
    Press Keycode    4 
    Swipe By Percent    50    50    50    10
    
    Input Text    ${CAMPO_LOTE}    A001
    
    Espera o elemento e faz o clique    ${SALVARPROD} 

Então o produto não é cadastrado com sucesso 
    Click Element                       ${CAMPO_QUANTIDADE}
    Capture Page Screenshot
    Press Keycode    4
    Press Keycode    4
    Element Should Be Visible           ${PAGINAINICIAL}    

E preencher o formulário de cadastro de produto, deixando o campo - Val. Unit - em branco 
   [Arguments]      ${codigo}    ${descricao}    ${unid}    ${quant}    
    Input Text    ${CAMPO_CODIGO}         ${codigo}
    Input Text    ${CAMPO_DESCRICAO}      ${descricao}
    Input Text    ${CAMPO_UNIDADE}        ${unid}
    Input Text    ${CAMPO_QUANTIDADE}     ${quant}
    
    Press Keycode    4 
    Swipe By Percent    50    50    50    10
    
    Input Text    ${CAMPO_LOTE}    A001
    
    Espera o elemento e faz o clique    ${SALVARPROD}    

Então o produto não é cadastrado 
    Click Element                       ${CAMPO_VALUNIT}
    Capture Page Screenshot
    Press Keycode    4
    Press Keycode    4
    Element Should Be Visible           ${PAGINAINICIAL}   

Quando selecionar a opção "+ Entrada" do produto
    Espera o elemento e faz o clique    ${ADDPRODUTO} 
    Wait Until Page Contains            Adicionar estoque

E preencher a quantidade de produto a ser adicionado
    Input Text    ${CAMPO_ADDPROD}    30

Então deve ser possível aumentar o estoque do produto  
    Espera o elemento e faz o clique    ${SALVAR}
    Wait Until Element Is Visible       ${QUANTIDADEPROD}
    Element Should Contain Text         ${QUANTIDADEPROD}    60  

Quando selecionar a opção "- Saída" do produto
    Espera o elemento e faz o clique    ${SUBPRODUTO}
    Wait Until Page Contains            Diminuir estoque 

E preencher a quantidade de produto a ser subtraido 
    Input Text    ${CAMPO_SUBPROD}    15

Então deve ser possível diminuir o estoque do produto  
    Espera o elemento e faz o clique    ${SALVAR}
    Wait Until Element Is Visible       ${QUANTIDADEPROD}
    Element Should Contain Text         ${QUANTIDADEPROD}    15 

E preencher a quantidade de produto a ser subtraído, deixando um número negativo disponível 
    Input Text    ${CAMPO_SUBPROD}    60

Então não deve ser possível concluir a operação e o sistema exibe uma mensagem de erro 
    Espera o elemento e faz o clique    ${SALVAR}
    Element Attribute Should Match      ${ERROMENSAGEM}    resource-id    android:id/message    true
    Element Should Contain Text         ${ERROMENSAGEM}    Estoque insuficiente

Quando selecionar a opção "Editar" de determinado produto
    Espera o elemento e faz o clique    ${EDITAR} 
    Wait Until Page Contains            Produto

Então deve ser possível alterar as informações já cadastradas   
    Clear Text    ${CAMPO_DESCRICAO}
    Input Text    ${CAMPO_DESCRICAO}    Caneta Bic
    Clear Text    ${CAMPO_VALUNIT} 
    Input Text    ${CAMPO_VALUNIT}      4

    Espera o elemento e faz o clique    ${SALVARPROD}  

    Wait Until Element Is Visible     ${DESCRICAO01}
    Element Should Contain Text       ${DESCRICAO01}    Caneta Bic 

    Wait Until Element Is Visible     ${VALOR} 
    Element Should Contain Text       ${VALOR}    4 

Quando selecionar a opção "Excluir" de determinado produto
    Espera o elemento e faz o clique    ${DELETAR} 
    Wait Until Page Contains            Mensagem
    Element Should Be Visible           ${MENSAGEM}
    Element Should Be Enabled           ${NAO}
    Element Should Be Enabled           ${SIM}
    
Então deve ser possível retirar o produto do estoque  
    Espera o elemento e faz o clique        ${SIM}         
    Element Should Be Visible           ${PAGINAINICIAL}

Quando selecionar a "Lupa"
    Espera o elemento e faz o clique    ${PESQUISAR}

E digitar o nome de um produto cadastrado no estoque
    Input Text    ${CAMPO_PROCURAR}    Caneta

Então deve ser possível localizar o produto
    Wait Until Element Is Visible    ${PRODUTOCRIADO}
    
Cadastro de varios produtos
    [Arguments]      ${codigo}    ${descricao}    ${unid}    ${quant}    ${val}  
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Novo"
    E preencher o formulário de cadastro de produto    ${codigo}    ${descricao}    ${unid}    ${quant}    ${val}
    Então o produto é cadastrado com sucesso
    Close Application
    Abrir Aplicativo