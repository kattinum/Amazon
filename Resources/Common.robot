*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://www.amazon.com

*** Keywords ***
Begin Web Test
        open browser  about:blank  ${BROWSER}
        #go to  http://www.amazon.com


End Web Test
        close browser

Insert Testig Data
        Custom Keyword 1
        Custom Keyword 2

Cleanup Testing Data
        Log  I'm cleaning up the test data

Custom Keyword 1
        Log  Doing keyword 1

Custom Keyword 2
        Log  Doing keyword 2