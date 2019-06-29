*** Settings ***
Documentation  Test click image
Library  SeleniumLibrary


*** Variables ***



*** Test Cases ***
User seachs for products

    open browser  http://amazon.com  ie
    click image  Shop Deals & Promotions
    close browser