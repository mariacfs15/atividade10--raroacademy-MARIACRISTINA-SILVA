*** Settings ***

Resource    ../../base.robot

*** Variables ***
${ANDROID_AUTOMATION_NAME}        UiAutomator2
${PLATFORM_NAME}                  Android
${ANDROID_PLATFORMVERSION}        10
${APP_ACTIVITY}                   .Inicio
${APP_PACKAGE}                    br.com.pztec.estoque
${APP_PERMISSION}                 true

*** Keywords ***
Abrir Aplicativo
    Open Application    http://127.0.0.1:4723    
    ...    automationName=${ANDROID_AUTOMATION_NAME}    platformName=${PLATFORM_NAME}    
    ...    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
    ...    platformVersion=${ANDROID_PLATFORMVERSION} 
    ...    autoGrantPermissions=${APP_PERMISSION}

Teardown
    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Applications
