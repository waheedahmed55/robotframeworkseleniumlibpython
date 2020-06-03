*** Settings ***
#Resource    ../../Utility/Setup.robot
#Resource    ../../Helper/TableHelper.robot
Library     ExcelLibrary
Library     DataDriver  file=${EXECDIR}/TestData/TestSheet.xlsx     sheet_name=Sheet1
Resource    ../../TestData/ApplicationProperties.robot
#Suite Setup  Open the browser in
#Test Setup  Go back to homepage
#Test Teardown  Capture screenshot if test failed   Dummy
#Suite Teardown  Close All Browser Window
Test Template   DataDriven Test cases

*** Test Cases ***
Perform action on ${TestData}


*** Keywords ***
DataDriven Test cases
    [Arguments]     ${TestData}
    log to console  ${TestData}
