*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ADD_TO_CART} =  //*[@title='Add to List']

*** Keywords ***
Verify Page Loaded
    wait until element is visible  ${ADD_TO_CART}    10
