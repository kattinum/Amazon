*** Settings ***

Resource  ../Resources/PO/LandingPage.robot
Resource  ../Resources/PO/TopNav.robot
Resource  ../Resources/PO/SearchResults.robot
Resource  ../Resources/PO/Product.robot
Resource  ../Resources/PO/Cart.robot
Resource  ../Resources/PO/SignIn.robot


*** Keywords ***

User must log in
        Load
        LandingPage.Verify Page Loaded
        Login With Valid Credentials

Search for products
        TopNav.Search for Products
        Verify Search Completed

Select Product from Search Results
        Click Product link
        Product.Verify Page Loaded

Add Product to Cart
        Add to Cart
        Verify Product Added
        #element text should be  xpath://*[@id="hlb-subcart"]/div[1]/span/span[1]  Cart subtotal (1 item):  ignore_case=True

Begin Checkout
        Proceed to Checkout
        SignIn.Verify Page Loaded