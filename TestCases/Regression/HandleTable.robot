*** Settings ***
Resource    ../../Utility/Setup.robot
Resource    ../../Helper/TableHelper.robot
Resource    ../../TestData/ApplicationProperties.robot
Suite Setup  Open the browser in
Test Setup  Go back to homepage
Test Teardown  Capture screenshot if test failed   Dummy
Suite Teardown  Close All Browser Window

*** Test Cases ***
Handle Table
    Navigate to the site    ${TableUrl}
    #Get Table Content
    Get Table Content By Iterate



