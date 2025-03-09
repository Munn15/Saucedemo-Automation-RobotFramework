*** Settings ***
Library    SeleniumLibrary
Resource    variables.robot

*** Keywords ***
Open Browser To Page
    [Arguments]    ${url}    ${browser}=${BROWSER}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    
Close Browser Session
    Close Browser

Wait Until Element Is Visible And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=5s
    Click Element    ${locator}