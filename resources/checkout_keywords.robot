*** Settings ***
Library     SeleniumLibrary
Resource    variables.robot
Resource    common_keywords.robot
Resource    login_keywords.robot
Resource    inventory_keywords.robot
Resource    cart_keywords.robot

*** Keywords ***
Open Checkout Page
    Click Element    ${CART_ICON_BADGE}
    Wait Until Element Is Visible    ${CART_PRODUCT_LIST}    timeout=5s
    
    Click Element    ${CART_CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${CHECKOUT_FORM_CONTAINER}    timeout=5s
    Location Should Be    ${CHECKOUT_STEP_ONE_URL}

Enter Checkout Details
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Input Text    ${LAST_NAME_FIELD}    ${last_name}
    Input Text    ${POSTAL_CODE_FIELD}    ${postal_code}

Successfully Checkout Item
    Click Element    ${CONTINUE_CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${CHECKOUT_OVERVIEW_CONTAINER}    timeout=5s
    Location Should Be    ${CHECKOUT_STEP_TWO_URL}
    
    Click Element    ${FINISH_CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${COMPLETE_CONTAINER}    timeout=5s
    Location Should Be    ${CHECKOUT_COMPLETE_URL}

Checkout Failure Due To Empty Cart
    Click Element    ${CONTINUE_CHECKOUT_BUTTON}
    Location Should Be    ${CHECKOUT_STEP_ONE_URL}
    Page Should Contain    "No Item In Cart"

Checkout With Empty Fields
    Click Element    ${CONTINUE_CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${CHECKOUT_ERROR_MESSAGE}    timeout=5s

Checkout With Empty Last Name Field
    [Arguments]    ${first_name}    ${postal_code}
    Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Input Text    ${POSTAL_CODE_FIELD}    ${postal_code}

    Click Element    ${CONTINUE_CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${CHECKOUT_ERROR_MESSAGE}    timeout=5s

Checkout With Empty Postal Code Field
    Reload Page
    [Arguments]    ${first_name}    ${last_name}
    Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Input Text    ${LAST_NAME_FIELD}    ${last_name}

    Click Element    ${CONTINUE_CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${CHECKOUT_ERROR_MESSAGE}    timeout=5s

Cancel Checkout at Information Step
    Click Element    ${CHECKOUT_STEP_ONE_CANCEL_BUTTON}
    Location Should Be    ${CART_URL}

Cancel Checkout at Overview Step
    Click Element    ${CART_CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${CHECKOUT_FORM_CONTAINER}    timeout=5s
    Location Should Be    ${CHECKOUT_STEP_ONE_URL}

    Enter Checkout Details    Imron    Taufiq    12345

    Click Element    ${CONTINUE_CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${CHECKOUT_OVERVIEW_CONTAINER}    timeout=0.5s
    Location Should Be    ${CHECKOUT_STEP_TWO_URL}

    Click Element    ${CHECKOUT_STEP_TWO_CANCEL_BUTTON}
    Wait Until Element Is Visible    ${INVENTORY_PRODUCT_LIST}    timeout=5s
    Location Should Be    ${INVENTORY_URL}