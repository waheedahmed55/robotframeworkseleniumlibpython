*** Settings ***
Resource    ../Utility/SeleniumKeywords.robot
Resource    ../TestData/ApplicationProperties.robot
Library     BuiltIn
Library     requests
*** Keywords ***
Login to the application
    [Arguments]     ${userNameField}    ${userName}     ${PasswordField}    ${Password}     ${LoginButton}
    Set Value For Input Field    ${userNameField}  ${userName}
    Set Value For Input Field     ${PasswordField}  ${Password}
    Click On Page Element     ${LoginButton}

Log out the application
    [Arguments]     ${LogoutLink}
    Click On Page Element  ${LogoutLink}

Navigate to the site
    [Arguments]     ${URL}
    Navigate to the page    ${URL}

Get status code from URLs
    ${elementCount}=    Get Element Count   xpath=//a[@href]
    log to console  \nTotal Element count : ${elementCount}
    log to console  \nstatus Code\tURL
    log to console  \t
    FOR     ${i}   IN RANGE    1   ${elementCount}+1
       ${hrefURL}=     Get Element Attribute    xpath=(//a[@href])[${i}]   href
       ${response}=    requests.Request    Get    ${hrefUrl}
       log to console   ${response.status_code}\t${hrefURL}
    END
