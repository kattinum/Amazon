*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ADD_PROD} =  //*[@title='Add to List']
${CHECK_OUT} =  xpath://*[@id="hlb-ptc-btn-native"]

*** Keywords ***
Add to Cart
        click element    ${ADD_PROD}
#Verify Product Added
#        wait until page contains  Cart subtotal
#
#Proceed to Checkout
#        click element  ${CHECK_OUT}
