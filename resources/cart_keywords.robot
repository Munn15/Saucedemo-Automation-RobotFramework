*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/variables.robot
Resource    ../resources/login_keywords.robot
Resource    ../resources/common_keywords.robot
Resource    ../resources/inventory_keywords.robot

*** Keywords ***
Verify Cart Page Is Displayed
    Wait Until Element Is Visible And Click    ${CART_ICON_BADGE}
    Wait Until Element Is Visible    ${CART_PRODUCT_LIST}    timeout=5s

Verify Item Is Added To Cart
    Add Item To Cart And Verify
    Click Element    ${CART_ICON_BADGE}
    Wait Until Element Is Visible    ${ITEM_NAME}    timeout=5s

Remove All Items From Cart 
    @{remove_buttons}    Get WebElements    ${REMOVE_ITEM_BUTTON}
    FOR    ${button}    IN    @{remove_buttons}
        Click Element    ${button}
        
    END
    Wait Until Element Is Visible    ${CART_PRODUCT_LIST}    timeout=5s

Click And Verify Continue Shopping Button
    Click Element    ${CONTINUE_SHOPPING_BUTTON}
    Wait Until Element Is Visible    ${INVENTORY_PRODUCT_LIST}    timeout=5s

Click Checkout Button And Verify Navigation
    Click Element    ${CART_CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${CHECKOUT_FORM_CONTAINER}    timeout=5s

# Bug: Empty cart allows checkout
Verify Checkout Is Disabled When Cart Is Empty
    Click Element    ${CART_CHECKOUT_BUTTON}
    Location Should Be    ${CART_URL}
    Page Should Contain    "Cart is empty! Unable to check out"