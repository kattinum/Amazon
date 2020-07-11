*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SELECT_PROD} =  xpath://span[contains(text(),"Ferrari 458 Italia Red 1/24 by Bburago 26003")]

*** Keywords ***
Verify Search Completed
    wait until page contains  results for "${TopNav_SEARCH_TERM}"

Click Product link
    [Documentation]  Click on the 1st product in the search results
    click element  ${SELECT_PROD}