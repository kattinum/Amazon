*** Settings ***
Documentation  This is some basic info about the whole suit
Resource  ../Resources/AmazonApp.robot
Resource  ../Resources/Common.robot
Suite Setup  Insert Testig Data
Test Setup  Begin Web Test
Test Teardown  End Web Test
Suite Teardown  Cleanup Testing Data

*** Variables ***
@{USR_NAME}  id:ap_email  teammy1980@gmail.com
@{PASSWD}  id:ap_password  team123

*** Test Cases ***
User can search for products
    [Documentation]  This is some basic info about test
    [Tags]  Smoke1
    AmazonApp.Search for products

User must sign in to check out
    [Documentation]  This is some basic info about test
    [Tags]  Smoke2
    AmazonApp.Search for products
    AmazonApp.Select Product from Search Results
    AmazonApp.Add Product to Cart
    AmazonApp.Begin Checkout for Log out user

#Log out user must log in to check out
#    [Tags]  current
#
#    Given AmazonApp.User must log in
#    And AmazonApp.Search for products
#    And Select Product from Search Results
#    When Add Product to Cart
#    Then Begin Checkout for Log in user
