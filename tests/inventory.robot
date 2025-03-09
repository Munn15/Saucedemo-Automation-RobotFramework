*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/variables.robot
Resource    ../resources/common_keywords.robot
Resource    ../resources/inventory_keywords.robot
Resource    ../resources/login_keywords.robot

Suite Setup    Open Browser To Page    ${LOGIN_URL}
Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Inventory Page Loads Successfully
    [Documentation]    User Access Inventory Page
    Login With Credentials    standard_user    secret_sauce
    Verify Inventory Page Loads Successfully

Verify Adding Item To Cart
    [Documentation]    User can add products to cart
    Add Item To Cart And Verify

Verify Removing Item From Cart
    [Documentation]    User can remove products to cart
    Remove Item From Cart And Verify

Verify Sorting Products By Name (A-Z)
    [Documentation]    Products are sorted by name A - Z
    Verify Sorting Products By Name (A-Z)

Verify Sorting Products By Name (Z-A)
    [Documentation]    Products are sorted by name Z - A
    Verify Sorting Products By Name (Z-A)

Verify Sorting Products By Price (Low to High)
    [Documentation]    Products are sorted by price low to high
    Verify Sorting Products By Price (Low to High)

Verify Sorting Products By Price (High to Low)
    [Documentation]    Products are sorted by price high to low
    Verify Sorting Products By Price (High to Low)