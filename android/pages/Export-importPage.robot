*** Settings ***

Resource    ../../base.robot
Resource    ../utils/commons.robot

*** Variables ***

${EXPORT}                  id=br.com.pztec.estoque:id/btn_exportar
${GERAREXPORT}             id=br.com.pztec.estoque:id/btn_gerar
${IMPORTARDADOS}           id=br.com.pztec.estoque:id/btn_importar

${RESTAURARPRODUTOS}       id=br.com.pztec.estoque:id/btn_produtos
${RESTAURARENTRADAS}       id=br.com.pztec.estoque:id/btn_entradas
${RESTAURARSAÍDAS}         id=br.com.pztec.estoque:id/btn_saidas
${GRUPODEPRODUTOS}         id=br.com.pztec.estoque:id/btn_grupos

${PRODUTOS}               id=br.com.pztec.estoque:id/datafileprod
${ENTRADAS}               id=br.com.pztec.estoque:id/datafileent
${SAÍDAS}                 id=br.com.pztec.estoque:id/datafilesai
${GRUPOS}                 id=br.com.pztec.estoque:id/datafilegrupo

${ENVPROD}                id=br.com.pztec.estoque:id/btn_prod
${ENVENTRADAS}            id=br.com.pztec.estoque:id/btn_ent
${ENVSAÍDAS}              id=br.com.pztec.estoque:id/btn_sai
${ENVGRUPOS}              id=br.com.pztec.estoque:id/btn_grupo

*** Keywords ***

E acessar a opção "Exportar dados"
    Espera o elemento e faz o clique    ${EXPORT}
    Wait Until Page Contains    Exportar dados

Então deve ser possível gerar um arquivo .csv e o sistema exibe uma mensagem 
    Espera o elemento e faz o clique    ${GERAREXPORT}
    Element Attribute Should Match      ${OPCONCLUIDA}    resource-id    android:id/alertTitle    true   
    Element Should Contain Text         ${OPCONCLUIDA}    Operação concluída!
    Espera o elemento e faz o clique    ${OK}

Então deve ser possível visualizar os arquivos e enviá-los 
    Element Should Be Visible    ${PRODUTOS} 
    Element Should Be Visible    ${ENTRADAS} 
    Element Should Be Visible    ${SAÍDAS} 
    Element Should Be Visible    ${GRUPOS} 

    Element Should Be Enabled    ${ENVPROD} 
    Element Should Be Enabled    ${ENVENTRADAS}
    Element Should Be Enabled    ${ENVSAÍDAS} 
    Element Should Be Enabled    ${ENVGRUPOS}  

E acessar a opção "Importar dados"
    Espera o elemento e faz o clique    ${IMPORTARDADOS}
    Wait Until Page Contains            Importar dados

Então deve ser possível selecionar quais tipos de dados o usuário quer importar
    Element Should Be Enabled    ${RESTAURARPRODUTOS}
    Element Should Be Enabled    ${RESTAURARENTRADAS} 
    Element Should Be Enabled    ${RESTAURARSAÍDAS} 
    Element Should Be Enabled    ${GRUPODEPRODUTOS}  

Então deve ser possível restaurar produtos 
    Element Should Be Enabled    ${RESTAURARPRODUTOS}

Então deve ser possível restaurar entradas 
    Element Should Be Enabled    ${RESTAURARENTRADAS}

Então deve ser possível restaurar saídas
    Element Should Be Enabled    ${RESTAURARSAÍDAS}

Então deve ser possível restaurar grupo de produtos
    Element Should Be Enabled    ${GRUPODEPRODUTOS} 