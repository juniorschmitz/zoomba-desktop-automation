*** Settings ***
Documentation     Launch de testes Desktop utilizando Zoomba+Desktop Library
...   Para pegar o nome da aplicação correta e setar em App, pode-se utilizar o seguinte comando (substituindo Skype pelo App desejado):
...   get-StartApps | Where-Object {$_.Name -like '*Skype*'}
Library           Zoomba.DesktopLibrary
Suite Setup       Start App
Test Setup        Launch Application
Test Teardown     Quit Application
Suite Teardown    Driver Teardown
Force Tags        Windows

*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${APP}                  Skype

*** Keywords ***
Start App
    [Documentation]     Lança a aplicação utilizando WinAppDriver
    Driver Setup
    Open Application    ${REMOTE_URL}     platformName=Windows    deviceName=Windows   app=${APP}
    Sleep   5

*** Test Cases ***

Enviar mensagem no Skype
    Wait For And Click Element      xpath=//Button[contains(@Name, "lalala")]
    Wait For And Click Element      name=Digite aqui
    Wait For And Input Text         name=Digite aqui      text=Hi there
    Wait For And Click Element      name=Enviar mensagem
    Sleep   5
