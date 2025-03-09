*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/variables.robot
Resource    ../resources/common_keywords.robot
Resource    ../resources/login_keywords.robot
Resource    ../resources/inventory_keywords.robot
Resource    ../resources/cart_keywords.robot
Resource    ../resources/checkout_keywords.robot

Suite Setup    Open Browser To Page    ${LOGIN_URL}
Suite Teardown    Close Browser Session

*** Test Cases ***
Checkout Successfully With Valid Information
    [Documentation]    User Checkout With Valid Data
    Login With Credentials    standard_user    secret_sauce
    Add Item To Cart And Verify
    Open Checkout Page
    Enter Checkout Details    Imron    Taufiq    12345
    Successfully Checkout Item
    
Checkout Fail When Empty Item In Cart
    [Documentation]    User Checkout With Empty Item In Cart
    Open Checkout Page
    Enter Checkout Details    Imron    Taufiq    12345
    Checkout Failure Due To Empty Cart

Checkout Fails When Checkout Information Is Incomplete
    [Documentation]    User Checkout With Incomplete Data
    Go To    ${INVENTORY_URL}
    Add Item To Cart And Verify
    Open Checkout Page
    Checkout With Empty Fields
    Checkout With Empty Last Name Field    Imron    12345
    Checkout With Empty Postal Code Field    Imron    Taufiq

Cancel Checkout at Information Step Redirects to Cart
    [Documentation]    User Cancel Checkout In Checkout Information
    Cancel Checkout at Information Step

Cancel Checkout at Overview Step Redirects to Inventory
    [Documentation]    User Cancel Checkout In Checkout Overview
    Cancel Checkout at Overview Step