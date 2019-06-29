*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ADD_PROD} =  id:add-to-cart-button
${CHECK_OUT} =  xpath://*[@id="attach-sidesheet-checkout-button"]/span/input

*** Keywords ***
Add to Cart
        click button  ${ADD_PROD}
Verify Product Added
        wait until page contains  Cart subtotal

Proceed to Checkout
        click element  ${CHECK_OUT}
