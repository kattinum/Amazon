*** Settings ***

Resource  ../Resources/PO/LandingPage.robot
Resource  ../Resources/PO/TopNav.robot
Resource  ../Resources/PO/SearchResults.robot
Resource  ../Resources/PO/Product.robot
Resource  ../Resources/PO/Cart.robot
Resource  ../Resources/PO/SignIn.robot

*** Variables ***
@{USR_NAME}  id:ap_email  teammy1980@gmail.com
@{PASSWD}  id:ap_password  team123

*** Keywords ***

#Log in
#        [Arguments]  @{USR_NAME}  @{PASSWD}
#        SignIn.Login after check out product  @{USR_NAME}  @{PASSWD}

Search for products
        TopNav.Search for Products
       # LandingPage.Verify Page Loaded
        SearchResults.Verify Search Completed

Select Product from Search Results
        SearchResults.Click Product link
        Product.Verify Page Loaded

Add Product to Cart
        Cart.Add to Cart
#        Cart.Verify Product Added
        #element text should be  xpath://*[@id="hlb-subcart"]/div[1]/span/span[1]  Cart subtotal (1 item):  ignore_case=True

Begin Checkout for Log out user
        Cart.Proceed to Checkout
        SignIn.Verify Page Loaded
        SignIn.Login after check out product
        SignIn.Verify Page Loaded for Log In user

Begin Checkout for Log in user
        Proceed to Checkout
        SignIn.Verify Page Loaded for Log In user
