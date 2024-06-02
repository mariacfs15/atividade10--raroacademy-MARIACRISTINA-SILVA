*** Settings ***
Resource    ../../base.robot

Test Setup       Abrir Aplicativo
Test Teardown    Teardown

*** Test Cases ***

CT001 - Deve ser possível exportar dados do sistema 
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5 
    Quando selecionar a opção "Menu"
    E acessar a opção "Exportar dados"
    Então deve ser possível gerar um arquivo .csv e o sistema exibe uma mensagem 

CT002 - Deve ser possível enviar os dados a serem exportador pelo sistema 
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5
    Quando selecionar a opção "Menu"
    E acessar a opção "Exportar dados"
    Então deve ser possível visualizar os arquivos e enviá-los  

CT003 - Deve ser possível importar dados para o sistema 
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Menu"
    E acessar a opção "Importar dados"
    Então deve ser possível selecionar quais tipos de dados o usuário quer importar 

CT004 - Deve ser possível restaurar produtos
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Menu"
    E acessar a opção "Importar dados"
    Então deve ser possível restaurar produtos 

CT005 - Deve ser possível restaurar entradas
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Menu"
    E acessar a opção "Importar dados"
    Então deve ser possível restaurar entradas 

CT006 - Deve ser possível restaurar saídas
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Menu"
    E acessar a opção "Importar dados"
    Então deve ser possível restaurar saídas 

CT007 - Deve ser possível restaurar grupo de produtos
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Menu"
    E acessar a opção "Importar dados"
    Então deve ser possível restaurar grupo de produtos