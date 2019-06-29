*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ADD_PROD} =  id:add-to-cart-button
${CHECK_OUT} =  xpath://*[@id="hlb-ptc-btn-native"]

*** Keywords ***
Add to Cart
        click button  ${ADD_PROD}
Verify Product Added
        wait until page contains  Cart subtotal (1 item):

Proceed to Checkout
        click element  ${CHECK_OUT}
