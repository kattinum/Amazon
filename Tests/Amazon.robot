*** Settings ***
Documentation  This is some basic info about the whole suit
Resource  ../Resources/AmazonApp.robot
Resource  ../Resources/Common.robot
Suite Setup  Insert Testig Data
Test Setup  Begin Web Test
Test Teardown  End Web Test
Suite Teardown  Cleanup Testing Data

*** Variables ***


*** Test Cases ***
User can search for products
    [Documentation]  This is some basic info about test
    [Tags]  Smoke
    AmazonApp.Search for products

User must sign in to check out

    AmazonApp.Search for products
    Select Product from Search Results
    Add Product to Cart
    Begin Checkout

Log out user must log in to check out
    [Tags]  current

    Given AmazonApp.User must log in
    And AmazonApp.Search for products
    And Select Product from Search Results
    When Add Product to Cart
    Then Begin Checkout

