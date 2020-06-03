*** Settings ***
Resource    ../../Utility/Setup.robot
Resource    ../../Helper/CommonHelper.robot
Resource    ../../TestData/ApplicationProperties.robot
Suite Setup  Open the browser in
Test Setup  Go back to homepage
Test Teardown  Capture screenshot if test failed   Dummy
Suite Teardown  Close All Browser Window

*** Test Cases ***
Check All URL Statuse on webpage
    Navigate to the site    ${RegisterURL}
    Get status code from URLs
