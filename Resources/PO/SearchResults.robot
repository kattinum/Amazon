*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SELECT_PROD} =  //span[starts-with(text(),'Thrustmaster Ferrari 458 Spider Racing Wheel')]

*** Keywords ***
Verify Search Completed
    wait until page contains  results for "${TopNav_SEARCH_TERM}"

Click Product link
    [Documentation]  Click on the 1st product in the search results
    click element  ${SELECT_PROD}