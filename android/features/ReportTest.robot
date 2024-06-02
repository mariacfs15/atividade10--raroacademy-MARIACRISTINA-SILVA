*** Settings ***
Resource    ../../base.robot

Test Setup       Abrir Aplicativo
Test Teardown    Teardown

*** Test Cases ***

CT001 - Deve ser possível gerar Inventário de estoque 
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5
    Quando selecionar a opção "Menu"
    E acessar a opção "Relatório"
    E acessar o "Inventário de estoque"
    Então deve ser possível gerar inventário em pdf, visualizar e enviar por e-mail 

CT002 - Deve ser possível gerar arquivo de Entradas no estoque 
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5
    Quando selecionar a opção "Menu"
    E acessar a opção "Relatório"
    E acessar "Entradas no estoque"
    E inserir "Data Inicial" e "Data Final"
    Então deve ser possível gerar o arquivo em pdf, visualizar e enviar por e-mail 

CT003 - Não deve ser possível gerar arquivo de Entradas no estoque sem informar um período
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5
    Quando selecionar a opção "Menu"
    E acessar a opção "Relatório"
    E acessar "Entradas no estoque"
    E não selecionar o período de consulta
    Então não deve ser possível gerar arquivo em pdf e o sistema vai retornar uma mensagem de erro

CT004 - Deve ser possível gerar arquivo de Saídas no estoque 
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Menu"
    E acessar a opção "Relatório"
    E acessar "Saídas no estoque"
    E inserir "Data Inicial" e "Data Final"
    Então deve ser possível gerar o arquivo em pdf, visualizar e enviar por e-mail 

CT005 - Não deve ser possível gerar arquivo de Saídas no estoque sem informar um período
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Menu"
    E acessar a opção "Relatório"
    E acessar "Saídas no estoque"
    E não selecionar o período de consulta
    Então não deve ser possível gerar arquivo em pdf e o sistema vai retornar uma mensagem de erro
