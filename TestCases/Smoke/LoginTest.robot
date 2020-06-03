*** Settings ***
Resource    ../../Utility/Setup.robot
Resource    ../../Helper/LoginHelper.robot
Resource    ../../TestData/ApplicationProperties.robot
Suite Setup  Open the browser in
Test Setup  Go back to homepage
Test Teardown  Capture screenshot if test failed   Dummy
Suite Teardown  Close All Browser Window

*** Test Cases ***
Invalid Login
    [Tags]  Invalid
    Click on Login link
    Enter username  ${UserName}
    Enter password  ${InvalidPassword}
    Click on Login button
    Verify error message displayed
    Take screenshot     Default

Valid Login Test
    [Tags]  Valid
    Click on Login link
    Enter username  ${UserName}
    Enter password  ${Password}
    Click on Login button
    Verify User is at Home page

