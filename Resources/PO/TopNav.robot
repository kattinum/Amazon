*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${TopNav_SEARCH_SUBMIT} =  xpath://input[@type="submit"]
${TopNav_SEARCH_PROD} =  id:twotabsearchtextbox
${TopNav_SEARCH_TERM} =  Ferrari 458

*** Keywords ***
Search for Products
    Enter Search Term
    Submit Search

Enter Search Term
      click element  ${TopNav_SEARCH_PROD}
      input text  ${TopNav_SEARCH_PROD}  ${TopNav_SEARCH_TERM}
Submit Search
      click element  ${TopNav_SEARCH_SUBMIT}
