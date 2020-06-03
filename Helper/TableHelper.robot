*** Settings ***
Resource    ../PageObjects/HandleObjects.robot
Resource    ../Utility/SeleniumKeywords.robot
Library     BuiltIn

*** Keywords ***
Navigate to the site
    [Arguments]     ${URL}
    Navigate to the page    ${URL}

Get Table Content
    ${rowCount}=    Get all element count    xpath=(//center/table)[1]//tr
    ${colCount}=    Get all element count    xpath=(//center/table)[1]//tr[2]/td
    log to console      \nTable rows ${rowCount}
    log to console      \nTable Column ${colCount}
    FOR    ${i}   IN RANGE    1    ${colCount}+1
        ${val}=    Get Text From element    xpath=(//center/table)[1]//tr[2]/td[${i}]
        log to console    ${val}
        exit for loop if    ${i}==${colCount}
    END

Get Table Content By Iterate
    ${rowCount}=    Get Element Count   xpath=(//center/table)[1]//tr
    log to console  ${rowCount}
    FOR     ${i}    IN RANGE    1   ${rowCount}+1
        log to console  \t
        ${colCount}=    Get Element Count   xpath=(//center/table)[1]//tr[${i}]/*
        Handle second loop  ${i}    ${colCount}+1
    END
    Close all Browsers

Handle second loop
    [Arguments]     ${i}    ${colCount}
    FOR     ${j}    IN RANGE    1   ${colCount}
        ${var}=     Get Text    xpath=(//center/table)[1]//tr[${i}]/*[${j}]
        log to console  ${var}\t
    END
