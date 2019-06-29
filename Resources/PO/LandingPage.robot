*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${USER_STATUS} =  xpath://*[@id="nav-link-accountList"]
${PAGE_LOAD} =   Hello, Sign in

*** Keywords ***
Load
    #go to  http://www.amazon.com
    go to  ${START_URL}

Verify Page Loaded
    wait until page contains  ${PAGE_LOAD}
