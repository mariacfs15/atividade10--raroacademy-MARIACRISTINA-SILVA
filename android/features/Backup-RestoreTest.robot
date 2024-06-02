*** Settings ***
Resource    ../../base.robot

Test Setup       Abrir Aplicativo
Test Teardown    Teardown

*** Test Cases ***

CT001 - Deve ser possível realizar um Backup do sistema 
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5        
    Quando selecionar a opção "Menu"
    E acessar a opção "Backup"
    Então deve ser possível "Gerar Backup" dos dados do sistema 

CT002 - Deve ser possível compartilhar um Backup do sistema 
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5  
    Quando selecionar a opção "Menu"
    E acessar a opção "Backup"
    E "Gerar Backup" dos dados do sistema
    Então deve ser possível compartilhar o arquivo de Backup       

CT003 - Deve ser possível realizar um Restore do sistema 
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Menu"
    E acessar a opção "Restore"
    Então deve ser possível restaurar os dados do sistema 