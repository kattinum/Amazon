*** Settings ***
Documentation  Amazon Top Navigation
Library  SeleniumLibrary

*** Variables ***
@{USR_NAME} =  id:ap_email  teammy1980@gmail.com
@{PASSWD} =  id:ap_password  team123

*** Keywords ***
Verify Page Loaded
    wait until page contains  Select a shipping address

Login With Valid Credentials
    [Arguments]  ${USR_NAME}  ${PASSWD}
    click element  ${USER_STATUS}
    input text   ${USR_NAME}[0]  ${USR_NAME}[1]
    input text  ${PASSWD}[0]  ${PASSWD}[1]
    click button  id:signInSubmit
    page should contain  Hello, kattinum
