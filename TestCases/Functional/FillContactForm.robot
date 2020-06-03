*** Settings ***
Resource    ../../Utility/Setup.robot
Resource    ../../Helper/FormHelper.robot
Library     ExcelLibrary
Library     DataDriver  file=${EXECDIR}/TestData/TestSheet.xlsx     sheet_name=Contacts
Resource    ../../TestData/ApplicationProperties.robot
Suite Setup  Open the browser in
Test Setup  Go back to homepage
Test Teardown  Capture screenshot if test failed   Dummy
Suite Teardown  Close All Browser Window
Test Template   Fill Form by given data

*** Test Cases ***
Fill contact form for ${Name}

*** Keywords ***
Fill Form by given data
    [Arguments]     ${Name}     ${Email}    ${MobileNumber}     ${Subject}  ${Message}
    Navigate to the site    ${ContactFormURL}
    Click on Contact link
    Enter name  ${Name}
    Enter email    ${Email}
    Enter MobileNumber    ${MobileNumber}
    Enter Subject   ${Subject}
    Enter Message  ${Message}
    Click on submit button