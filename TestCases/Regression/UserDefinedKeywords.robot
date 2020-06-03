*** Settings ***
Resource    ../../Utility/Setup.robot
Resource    ../../Helper/CommonHelper.robot
Resource    ../../TestData/ApplicationProperties.robot
Resource    ../../PageObjects/CommonObjects.robot
Suite Setup  Launch browser and navigate to   ${NewURL}
Test Setup  Login to the application    ${EmailField}   ${UserName}     ${PasswordField}    ${NewPass}  ${LoginButton}
Test Teardown  Log out the application  ${LogoutLink}
Suite Teardown  Close All Browser Window

*** Test Cases ***
Login Keyword
    log to console  Login Keyword

Logout Keyword
    log to console  Logout Keyword