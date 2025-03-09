*** Variables ***
# URLs
${LOGIN_URL}                https://www.saucedemo.com/v1/
${INVENTORY_URL}            https://www.saucedemo.com/v1/inventory.html
${CART_URL}                 https://www.saucedemo.com/v1/cart.html
${CHECKOUT_STEP_ONE_URL}    https://www.saucedemo.com/v1/checkout-step-one.html
${CHECKOUT_STEP_TWO_URL}    https://www.saucedemo.com/v1/checkout-step-two.html
${CHECKOUT_COMPLETE_URL}    https://www.saucedemo.com/v1/checkout-complete.html

# Browser Configuration
${BROWSER}    chrome

# Locators Login
${LOGIN_USERNAME_INPUT}         css=#user-name
${LOGIN_PASSWORD_INPUT}         css=#password
${LOGIN_SUBMIT_BUTTON}          css=#login-button
${LOGIN_ERROR_MESSAGE}          xpath=//h3[@data-test="error"]

# Locators Logout
${MENU_BUTTON}       css=.bm-burger-button
${LOGOUT_BUTTON}     css=#logout_sidebar_link

# Locators Inventory
${INVENTORY_PRODUCT_LIST}        css=.inventory_list
${INVENTORY_ITEM_LIST}           css=.inventory_item
${INVENTORY_FIRST_ADD_BUTTON}    xpath=//button[contains(text(), 'ADD TO CART')]
${FIRST_PRODUCT_REMOVE}          xpath=//button[contains(text(), 'REMOVE')]
${CART_ICON_BADGE}               xpath=//*[@id="shopping_cart_container"]/a
${SORT_CONTAINER}                css=.product_sort_container

# Locator Cart
${CART_PRODUCT_LIST}           css=.cart_list
${ITEM_NAME}                   css=.inventory_item_name
${ITEM_PRICE}                  css=.inventory_item_price
${REMOVE_ITEM_BUTTON}          css=button.btn_secondary.cart_button
${CART_CHECKOUT_BUTTON}        css=.btn_action.checkout_button
${CONTINUE_SHOPPING_BUTTON}    css=a.btn_secondary

# Locator Checkout Step One
${CHECKOUT_FORM_CONTAINER}            css=.checkout_info_wrapper
${FIRST_NAME_FIELD}                   css=#first-name
${LAST_NAME_FIELD}                    css=#last-name
${POSTAL_CODE_FIELD}                  css=#postal-code
${CHECKOUT_STEP_ONE_CANCEL_BUTTON}    css=a.cart_cancel_link.btn_secondary
${CONTINUE_CHECKOUT_BUTTON}           css=input.btn_primary.cart_button
${CHECKOUT_ERROR_MESSAGE}             xpath=//h3[@data-test="error"]

# Locator Checkout Step Two
${CHECKOUT_OVERVIEW_CONTAINER}        css=.summary_info
${CHECKOUT_STEP_TWO_CANCEL_BUTTON}    css=a.cart_cancel_link.btn_secondary
${FINISH_CHECKOUT_BUTTON}             css=a.btn_action.cart_button

# Locator Checkout Complete
${COMPLETE_CONTAINER}    css=#checkout_complete_container