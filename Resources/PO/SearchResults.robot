*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SELECT_PROD} =  xpath://*[@id="search"]/div[1]/div[2]/div/span[3]/div[1]/div[1]/div/div/div/div/div/div[2]/div[2]/div/div/h2/a/span

*** Keywords ***
Verify Search Completed
    wait until page contains  results for "${TopNav_SEARCH_TERM}"

Click Product link
    [Documentation]  Click on the 1st product in the search results
    click element  ${SELECT_PROD}