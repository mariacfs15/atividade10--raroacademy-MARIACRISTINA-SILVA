*** Settings ***

Resource    ../../base.robot
Resource    ../utils/commons.robot

*** Variables ***

${MENU}               id=br.com.pztec.estoque:id/Button3
${BACKUP}             id=br.com.pztec.estoque:id/btn_backup
${GERARBACKUP}        id=br.com.pztec.estoque:id/btn_gerar
${ARQBACKUP}          id=br.com.pztec.estoque:id/datafile
${ENVARQ}             id=br.com.pztec.estoque:id/btn_send
${OPCONCLUIDA}        xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]
${OK}                 id=android:id/button1
${RESTORE}            id=br.com.pztec.estoque:id/btn_restore
${PROCURARARQ}        id=br.com.pztec.estoque:id/btn_procurar

*** Keywords ***

E que existe produto cadastrado no sistema 
    Espera o elemento e faz o clique    ${NOVO}
    
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

Quando selecionar a opção "Menu"
    Espera o elemento e faz o clique    ${MENU}

E acessar a opção "Backup"
    Espera o elemento e faz o clique    ${BACKUP}   

Então deve ser possível "Gerar Backup" dos dados do sistema
    Espera o elemento e faz o clique    ${GERARBACKUP}
    Element Attribute Should Match      ${OPCONCLUIDA}    resource-id    android:id/alertTitle    true
    Element Should Contain Text         ${OPCONCLUIDA}    Operação concluída!
    Espera o elemento e faz o clique    ${OK}
    Element Should Be Visible           ${ARQBACKUP}

E "Gerar Backup" dos dados do sistema
    Espera o elemento e faz o clique    ${GERARBACKUP}
    Espera o elemento e faz o clique    ${OK}

Então deve ser possível compartilhar o arquivo de Backup
    Element Should Be Visible    ${ENVARQ}    
    Element Should Be Enabled    ${ENVARQ}
    
E acessar a opção "Restore"
    Espera o elemento e faz o clique    ${RESTORE}

Então deve ser possível restaurar os dados do sistema
    Element Should Be Enabled    ${PROCURARARQ}