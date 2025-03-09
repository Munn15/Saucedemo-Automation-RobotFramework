*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/variables.robot
Resource    ../resources/common_keywords.robot
Resource    ../resources/login_keywords.robot

Suite Setup    Open Browser To Page    ${LOGIN_URL}
Suite Teardown    Close Browser Session

*** Test Cases ***
User Can Login With Valid Credentials
    [Documentation]    Verify that a user can log in using valid username and password.
    Login With Credentials    standard_user    secret_sauce
    Verify Successful Login

User Cannot Login With Invalid Credentials
    [Documentation]    Verify that login fails when using incorrect username and password.
    Logout
    Login With Credentials    invalid_user    wrong_password
    Verify Login Failure With Invalid Credentials

User Cannot Login With Empty Credentials
    [Documentation]    Verify that login fails when both username and password fields are left blank.
    Reload Page
    Login Without Credentials
    Verify Login Failure With Empty Credentials