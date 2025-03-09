*** Settings ***
Library    SeleniumLibrary
Resource    variables.robot
Resource    common_keywords.robot

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${LOGIN_USERNAME_INPUT}    ${username}
    Input Password    ${LOGIN_PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_SUBMIT_BUTTON}

Login Without Credentials
    Click Element    ${LOGIN_SUBMIT_BUTTON}
    
Verify Successful Login
    Wait Until Element Is Visible    css=.inventory_list    timeout=5s

Verify Login Failure With Invalid Credentials
    Wait Until Element Is Visible    ${LOGIN_ERROR_MESSAGE}    timeout=5s
    Element Text Should Be    ${LOGIN_ERROR_MESSAGE}    Epic sadface: Username and password do not match any user in this service

Verify Login Failure With Empty Credentials
    Wait Until Element Is Visible    ${LOGIN_ERROR_MESSAGE}    timeout=5s
    Element Text Should Be    ${LOGIN_ERROR_MESSAGE}    Epic sadface: Username is required

Logout
    Wait Until Element Is Visible And Click    ${MENU_BUTTON}
    Wait Until Element Is Visible And Click    ${LOGOUT_BUTTON}
    Wait Until Element Is Visible    ${LOGIN_USERNAME_INPUT}    timeout=5s
