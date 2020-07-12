*** Settings ***
Documentation  Amazon Top Navigation
Library  SeleniumLibrary
Resource  LandingPage.robot

*** Variables ***
@{USR_NAME}  id:ap_email  teammy1980@gmail.com
@{PASSWD}  id:ap_password  team123
${USR_SUBMIT}  id:continue
${SIGNIN_SUBMIT}  id:signInSubmit
${GREETING_MSG}  Hello, kattinum

*** Keywords ***
Verify Page Loaded
    wait until page contains  Sign-In
    sleep  3s

#Login before check out product
#
#    [Arguments]  @{USR_NAME}  @{PASSWD}
#    click link  ${USER_STATUS}
#    Sleep  3s
#    input text   ${USR_NAME}[0]  ${USR_NAME}[1]
#    click button  ${USR_SUBMIT}
#    input text  ${PASSWD}[0]  ${PASSWD}[1]
#    click button  ${SIGNIN_SUBMIT}
#    page should contain  ${GREETING_MSG}

Login after check out product
    input text  ${USR_NAME}[0]  ${USR_NAME}[1]
    #input text  id:ap_email  teammy1980@gmail.com
    Sleep  2s
    click button  ${USR_SUBMIT}
    #input text  id:ap_password  team123
    input text  ${PASSWD}[0]  ${PASSWD}[1]
    click button  ${SIGNIN_SUBMIT}

Verify Page Loaded for Log In user
    wait until page contains  Select a shipping address


#Fill in "Email" field
#    [Arguments]  @{USR_NAME}
#    input text      ${USR_NAME}[0]  ${USR_NAME}[1]
#    Log  Fill in Email field with  ${USR_NAME}[1]
#
#Fill in "PASSWORD" field
#    [Arguments]  ${PASSWD}
#     Log  Fill in Password field with  ${PASSWD}
#
#click "SIGN IN" button
#    [Arguments]   ${SIGNIN_SUBMIT}
#    Log  Click Sign in button

