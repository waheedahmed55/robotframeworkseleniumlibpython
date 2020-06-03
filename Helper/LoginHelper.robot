*** Settings ***
Resource    ../PageObjects/LoginObjetcs.robot
Resource    ../Utility/SeleniumKeywords.robot
Library     BuiltIn

*** Keywords ***
Click on Login link
    Click On Page Element    ${LoginLink}

Enter username
    [Arguments]     ${value}
    Sleep   2s
    Set Value For Input Field  ${EmailField}   ${value}

Enter password
    [Arguments]     ${value}
    Set Value For Input Field  ${PasswordField}    ${value}

Click on Login button
    Click On Page Element    ${LoginButton}

Verify error message displayed
    Wait For Element Present    ${InvalidLoginError}    5   Error message not displayed
    Verify Text Present     ${InvaliLoginText}

Verify User is at Home page
    Verify Element Displayed    ${LogOut}
    URL Should Contain  demo.nopcommerce.com