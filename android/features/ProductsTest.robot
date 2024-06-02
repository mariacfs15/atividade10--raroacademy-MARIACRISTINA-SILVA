*** Settings ***
Resource    ../../base.robot

Test Setup       Abrir Aplicativo
Test Teardown    Teardown

*** Test Cases ***

CT001 - Deve ser possível cadastrar um produto com sucesso 
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Novo"
    E preencher o formulário de cadastro de produto    001    Caneta    unid.    30    3.5 
    Então o produto é cadastrado com sucesso

CT002 - Não deve ser possível cadastrar um produto sem preencher o campo "Descrição" 
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Novo"
    E preencher o formulário de cadastro de produto, deixando o campo - Descrição - em branco    001    unid.    30    3.5 
    Então o produto não é cadastrado com sucesso e exibe uma mensagem de erro

CT003 - Não deve ser possível cadastrar um produto sem preencher o campo "Quantidade"  
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Novo"
    E preencher o formulário de cadastro de produto, deixando o campo - Quantidade - em branco    001    Caneta    unid.    3.5 
    Então o produto não é cadastrado com sucesso 

CT004 - Não deve ser possível cadastrar um produto sem preencher o campo "Val. Unit."   
    Dado que o usuário acessou a página inicial do App
    Quando selecionar a opção "Novo"
    E preencher o formulário de cadastro de produto, deixando o campo - Val. Unit - em branco    001    Caneta    unid.    30
    Então o produto não é cadastrado 

CT005 - Deve ser possível aumentar a quantidade de um produto no sistema   
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5 
    Quando selecionar a opção "+ Entrada" do produto
    E preencher a quantidade de produto a ser adicionado 
    Então deve ser possível aumentar o estoque do produto  

CT006 - Deve ser possível diminuir a quantidade de um produto no sistema  
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5 
    Quando selecionar a opção "- Saída" do produto
    E preencher a quantidade de produto a ser subtraido 
    Então deve ser possível diminuir o estoque do produto  

CT007 - Não deve ser possível deixar o estoque de um produto negativo  
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5
    Quando selecionar a opção "- Saída" do produto
    E preencher a quantidade de produto a ser subtraído, deixando um número negativo disponível 
    Então não deve ser possível concluir a operação e o sistema exibe uma mensagem de erro 

CT008 - Deve ser possível editar as informações de um produto  
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5
    Quando selecionar a opção "Editar" de determinado produto
    Então deve ser possível alterar as informações já cadastradas   

CT009 - Deve ser possível excluir um produto do estoque  
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5
    Quando selecionar a opção "Excluir" de determinado produto
    Então deve ser possível retirar o produto do estoque  

CT010 - Deve ser possível procurar um produto do estoque  
    Dado que o usuário acessou a página inicial do App
    E que existe produto cadastrado no sistema    001    Caneta    unid.    30    3.5
    Quando selecionar a "Lupa"
    E digitar o nome de um produto cadastrado no estoque
    Então deve ser possível localizar o produto

CT011 - Deve ser possível cadastrar vários produtos no sistema
    [Template]    Cadastro de varios produtos
    FOR    ${counter}    IN RANGE    1
        001    Caneta        unid.    30    3.5
        002    Lápis         unid.    20    2.2
        002    Borracha      unid.    39    5.5
        003    Apontador     unid.    22    4.4
        004    Lapiseira     unid.    15    8.5
    END 