*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/variables.robot
Resource    ../resources/login_keywords.robot
Resource    ../resources/common_keywords.robot
Resource    ../resources/inventory_keywords.robot
Resource    ../resources/cart_keywords.robot

Suite Setup    Open Browser To Page    ${LOGIN_URL}
Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Cart Page Is Accessible
    [Documentation]    Ensure that the cart page is accessible after login
    Login With Credentials    standard_user    secret_sauce
    Verify Cart Page Is Displayed

Verify Adding Item To Cart
    [Documentation]    Verify that items can be added to the cart
    Go Back
    Verify Item Is Added To Cart

Verify Removing Item From cart
    [Documentation]    Ensure that items can be removed from the cart
    Remove All Items From Cart

Verify Functionality Of Continue Shopping Button
    [Documentation]    Verify that the "Continue Shopping" button works properly
    Click And Verify Continue Shopping Button

Verify Checkout Button Navigates To Checkout Page
    [Documentation]    Ensure that the "Checkout" button takes the user to the checkout page
    Verify Item Is Added To Cart
    Click Checkout Button And Verify Navigation

Verify Checkout Is Blocked When Cart Is Empty
    [Documentation]    Ensure that the checkout process cannot be completed if the cart is empty
    Go To    ${CART_URL}
    Remove All Items From Cart
    Verify Checkout Is Disabled When Cart Is Empty