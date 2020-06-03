*** Settings ***
Resource    ../PageObjects/FormObjects.robot
Resource    ../Utility/SeleniumKeywords.robot
Library     BuiltIn

*** Keywords ***
Navigate to the site
    [Arguments]     ${URL}
    Navigate to the page    ${URL}

Click on Contact link
    #Click On Page Element   ${ContactLink}
    #Click On Page Element by JavaScript   ${ContactLink}
    Perform JavaScript Action   document.querySelector("a[href='/contact']").click()

Enter name
    [Arguments]     ${text}
    Set Value For Input Field   ${Name}     ${text}

Enter email
    [Arguments]     ${text}
    Set Value For Input Field   ${Email}    ${text}

Enter MobileNumber
    [Arguments]     ${text}
    Set Value For Input Field   ${MobileNumber}     ${text}

Enter Subject
    [Arguments]     ${text}
    Set Value For Input Field   ${Subject}      ${text}

Enter Message
    [Arguments]     ${text}
    Set Value For Input Field   ${Message}      ${text}

Click on submit button
    Click On Button     ${SubmitButton}

