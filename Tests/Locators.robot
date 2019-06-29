*** Settings ***
Documentation  Locator testing
Library  SeleniumLibrary

*** Variables ***



*** Test Cases ***
Should be able to search for product

        # Begin Web Test
        open browser  about:blank  chrome
        go to  http://www.amazon.com

        # Search for products
        input text  id:twotabsearchtextbox  Ferari 458
        click element  xpath://input[@value="Go"]

        #Select Product from Search Results
        click element  xpath://div[@class ='a-section a-spacing-none a-spacing-top-small']/h2/a[contains(@href,'Id=A0733753F69F62SDLA9E')]

        #Add Product to Cart
        click button  id:add-to-cart-button
        wait until page contains  Cart subtotal (1 item):
        #element text should be  xpath://*[@id="hlb-subcart"]/div[1]/span/span[1]  Cart subtotal (1 item):  ignore_case=True


        sleep  3s
        close browser




*** Keywords ***
