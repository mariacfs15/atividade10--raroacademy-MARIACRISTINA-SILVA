*** Settings ***

Resource    ../../base.robot
Resource    ../utils/commons.robot

*** Variables ***

${RELATÓRIO}                id=br.com.pztec.estoque:id/btn_relatorios
${INVENTARIOESTOQUE}        id=br.com.pztec.estoque:id/inventario
${ENTRADAESTOQUE}           id=br.com.pztec.estoque:id/relentrada
${SAIDAESTOQUE}             id=br.com.pztec.estoque:id/relsaida

${GERARPDF}                 id=br.com.pztec.estoque:id/btn_gerar
${ABRIRPDF}                 id=br.com.pztec.estoque:id/btn_abrir
${ENVIARPDF}                id=br.com.pztec.estoque:id/btn_abrir

${DATAINICIAL}              id=br.com.pztec.estoque:id/data1
${DATAFINAL}                id=br.com.pztec.estoque:id/data2

${DATA01}                   xpath=//android.view.View[@content-desc="02 junho 2024"]
${DATA02}                   xpath=//android.view.View[@content-desc="03 junho 2024"]
${OKDATA}                   id=android:id/button1

*** Keywords ***

E acessar a opção "Relatório"
    Espera o elemento e faz o clique    ${RELATÓRIO}
    Wait Until Page Contains            Relatórios

E acessar o "Inventário de estoque"
    Espera o elemento e faz o clique    ${INVENTARIOESTOQUE} 
    Wait Until Page Contains            Inventário de estoque

Então deve ser possível gerar inventário em pdf, visualizar e enviar por e-mail 
    Espera o elemento e faz o clique    ${GERARPDF} 
    Element Should Be Enabled           ${ABRIRPDF}
    Element Should Be Enabled           ${ENVIARPDF}

E acessar "Entradas no estoque"
    Espera o elemento e faz o clique    ${ENTRADAESTOQUE} 
    Wait Until Page Contains            Entradas no estoque

E inserir "Data Inicial" e "Data Final"
    Espera o elemento e faz o clique    ${DATAINICIAL}
    Espera o elemento e faz o clique    ${DATA01}
    Espera o elemento e faz o clique    ${OKDATA}

    Espera o elemento e faz o clique    ${DATAFINAL}
    Espera o elemento e faz o clique    ${DATA02}
    Espera o elemento e faz o clique    ${OKDATA}

Então deve ser possível gerar o arquivo em pdf, visualizar e enviar por e-mail 
    Espera o elemento e faz o clique    ${GERARPDF} 
    Element Should Be Enabled           ${ABRIRPDF}
    Element Should Be Enabled           ${ENVIARPDF}

E não selecionar o período de consulta
    Espera o elemento e faz o clique    ${GERARPDF} 

Então não deve ser possível gerar arquivo em pdf e o sistema vai retornar uma mensagem de erro
    Element Attribute Should Match      ${ERROMENSAGEM}    resource-id    android:id/message    true
    Element Should Contain Text         ${ERROMENSAGEM}    Por favor selecione um período de datas.

E acessar "Saídas no estoque"
    Espera o elemento e faz o clique    ${SAIDAESTOQUE}  
    Wait Until Page Contains            Saídas do estoque