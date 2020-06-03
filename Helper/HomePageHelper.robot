*** Settings ***
Resource    ../PageObjects/HomePageObjects.robot
Resource    ../Utility/SeleniumKeywords.robot
Library     BuiltIn

*** Keywords ***
Click on search link
    Scroll for element  ${SearchLink}
    Click On Page Element   ${SearchLink}

Enter value to search
    [Arguments]     ${inputText}
    Set Value For Input Field   ${SearchField}  ${inputText}

Click on the Search button
    Click On Page Element   ${SearchButton}

Scroll the screen to top
    Scroll at the top of the page
    sleep   2s

Click Add to cart for first item
    Scroll for element  ${AddToCart}
    Click On Page Element   ${AddToCart}

Item has added to cart sucessfully
    Wait For Element Present    ${AddedToCart}  10  Item not added to cart
    Click On Page Element   ${CloseNotification}

Verify Cart displayed item
    Mouse Over on the element   ${ShoppingCartLink}
    Verify Element Present  ${AddedItemCount}

Sort item by
    [Arguments]     ${visibleText}
    Select List Option By visible Text  ${SortBy_Dropdown}  ${visibleText}