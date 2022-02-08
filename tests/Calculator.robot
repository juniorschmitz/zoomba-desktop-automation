*** Settings ***
Documentation     Launch de testes Desktop utilizando Zoomba+Desktop Library
...   Para pegar o nome da aplicação correta e setar em App, pode-se utilizar o seguinte comando (substituindo Calculadora pelo App desejado):
...   get-StartApps | Where-Object {$_.Name -like '*Calculadora*'}
Library           Zoomba.DesktopLibrary
Suite Setup       Start App
Test Setup        Launch Application
Test Teardown     Quit Application
Suite Teardown    Driver Teardown
Force Tags        Windows

*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${APP}                  Microsoft.WindowsCalculator_8wekyb3d8bbwe!App

*** Keywords ***
Start App
    [Documentation]     Lança a aplicação utilizando WinAppDriver
    Driver Setup
    Open Application    ${REMOTE_URL}     platformName=Windows    deviceName=Windows   app=${APP}
    Maximize Window
    Quit Application

*** Test Cases ***
Dois mais Dois é igual a Quatro
    Wait For And Click Element        name=Dois
    Wait For And Click Element        name=Mais
    Wait For And Click Element        name=Dois
    Wait For And Click Element        name=Igual a
    Wait Until Element Contains       accessibility_id=CalculatorResults      4