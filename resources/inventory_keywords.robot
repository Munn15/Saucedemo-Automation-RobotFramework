*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    common_keywords.robot
Resource    variables.robot

*** Keywords ***
Verify Inventory Page Loads Successfully
    Wait Until Element Is Visible    ${INVENTORY_PRODUCT_LIST}    timeout=5s
    Wait Until Element Is Visible    ${INVENTORY_ITEM_LIST}    timeout=5s
    ${item_count}=    Get Element Count    ${INVENTORY_ITEM_LIST}    
    Should Be True    ${item_count} > 0

Add Item To Cart And Verify
    @{buttons}    Get WebElements    ${INVENTORY_FIRST_ADD_BUTTON}
    FOR    ${button}    IN    @{buttons}
        Click Element    ${button}
        
    END
    Wait Until Element Is Visible    ${FIRST_PRODUCT_REMOVE}    timeout=5s

Remove Item From Cart And Verify
    @{buttons}    Get WebElements    ${FIRST_PRODUCT_REMOVE}
    FOR    ${button}    IN    @{buttons}
        Click Element    ${button}
        
    END
    Wait Until Element Is Visible    ${INVENTORY_FIRST_ADD_BUTTON}    timeout=5s

Verify Sorting Products By Name (A-Z)
    Select From List By Label    ${SORT_CONTAINER}    Name (A to Z)
    ${sorted_names}    Get List Of Product Names
    ${expected_names}    Copy List    ${sorted_names}
    ${expected_names}    Evaluate    sorted(${expected_names})
    Lists Should Be Equal    ${sorted_names}    ${expected_names}

Verify Sorting Products By Name (Z-A)
    Select From List By Label    ${SORT_CONTAINER}    Name (Z to A)
    ${sorted_names}    Get List Of Product Names
    ${expected_names}    Copy List    ${sorted_names}
    ${expected_names}    Evaluate    sorted(${expected_names}, reverse=True)
    Lists Should Be Equal    ${sorted_names}    ${expected_names}

Verify Sorting Products By Price (Low to High)
    Select From List By Label    ${SORT_CONTAINER}    Price (low to high)
    ${sorted_prices}    Get List Of Product Prices
    ${expected_prices}    Copy List    ${sorted_prices}
    ${expected_prices}    Evaluate    sorted(${expected_prices})
    Lists Should Be Equal    ${sorted_prices}    ${expected_prices}

Verify Sorting Products By Price (High to Low)
    Select From List By Label    ${SORT_CONTAINER}    Price (high to low)
    ${sorted_prices}    Get List Of Product Prices
    ${expected_prices}    Copy List    ${sorted_prices}
    ${expected_prices}    Evaluate    sorted(${expected_prices}, reverse=True)
    Lists Should Be Equal    ${sorted_prices}    ${expected_prices}

Get List Of Product Names
    ${names}    Create List
    @{elements}    Get WebElements    css=.inventory_item_name
    FOR    ${element}    IN    @{elements}
        ${text}    Get Text    ${element}
        Append To List    ${names}    ${text}
    END
    RETURN    ${names}

Get List Of Product Prices
    ${prices}    Create List
    ${elements}    Get WebElements    css=.inventory_item_price
    FOR    ${element}    IN    @{elements}
        ${text}    Get Text    ${element}
        ${price}    Convert To Number    ${text.strip('$')}
        Append To List    ${prices}    ${price}
    END
    RETURN    ${prices}