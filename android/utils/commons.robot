*** Settings ***

Resource    ../../base.robot

*** Keywords ***

Espera o elemento e faz o clique
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}
    Click Element                    ${elemento}

    
    