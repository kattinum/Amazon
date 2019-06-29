*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ADD_TO_CART} =  xpath://*[@id="submit.add-to-cart"]

*** Keywords ***
Verify Page Loaded
    wait until element is visible  ${ADD_TO_CART}
