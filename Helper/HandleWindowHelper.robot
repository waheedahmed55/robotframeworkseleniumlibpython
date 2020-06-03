*** Settings ***
Resource    ../PageObjects/HandleWIndowObjects.robot
Resource    ../Utility/SeleniumKeywords.robot
Library     BuiltIn

*** Keywords ***
Navigate to the site
    [Arguments]     ${URL}
    Navigate to the page    ${URL}

Click on tab button
    Click On Page Element   ${TabWindowButton}

Switch to new window
    [Arguments]     ${type}
    Switch to window    ${type}

Print title of window
    ${val}=  Title of the window
    log to console  ${val}

Click on seprate tab
    Click On Page Element   ${SaprateWindowLink}

Click on new window button
    Click On Button     ${NewWindowButton}

Click on multiple tab
    Click On Page Element   ${MultipleWindowLink}

Click on multiple window button
        Click On Button     ${MultipleWindowButton}