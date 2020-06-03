*** Settings ***
Resource    ../../Utility/Setup.robot
Resource    ../../Helper/HomePageHelper.robot
Resource    ../../TestData/ApplicationProperties.robot
Suite Setup  Open the browser in
Test Setup  Go back to homepage
Test Teardown  Capture screenshot if test failed   Dummy
Suite Teardown  Close All Browser Window

*** Test Cases ***
Search and Add to cart
    Click on search link
    Enter value to search   ${SearchItem}
    Click on the Search button
    Sort item by    Price: High to Low
    Click Add to cart for first item
    Scroll the screen to top
    Take screenshot     AddedItem
    Item has added to cart sucessfully
    Verify Cart displayed item