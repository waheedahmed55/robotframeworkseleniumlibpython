*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Clear Input Field
    [Arguments]    ${locator}
    Wait For Element Present    ${locator}  5    Element not found in 5 seconds
    Clear Element Text    ${locator}
    ${value}=     Get Element Attribute   ${locator}      value
    ${backspaces count}=    Get Length      ${value}
    Run Keyword If    """${value}""" != ''
    ...     Repeat Keyword  ${backspaces count +1}  Press Key  ${locator}   \\08

Set Value For Input Field
    [Arguments]    ${locator}    ${inputval}
    sleep   2s
    Clear Input Field   ${locator}
    Input Text    ${locator}    ${inputval}

Click On Page Element
    [Arguments]    ${locator}
    Wait For Element Present    ${locator}  5    Element not found in 5 seconds
    Click Element    ${locator}

Click On Button
    [Arguments]    ${locator}
    Wait For Element Present    ${locator}  5    Element not found in 5 seconds
    Click Button    ${locator}

Wait For Page Load
    [Arguments]    ${pgloadlocator}
    Wait Until Page Contains Element    ${pgloadlocator}
    Sleep    5s

Wait For Element Present
    [Arguments]    ${locator}    ${timeout}    ${err_msg}
    #Wait For Element Present    ${locator}  5    Element not found in 5 seconds
    Wait Until Page Contains Element    ${locator}    ${timeout}    ${err_msg}

Get Attribute Value
    [Arguments]    ${locator}    ${attribute}
    #Wait For Element Present    ${locator}  5    Element not found in 5 seconds
    ${string}=    Get Element Attribute    ${locator}    ${attribute}
    log to console    \n get attribute ${string}.\n
    [Return]    ${string}

Back On Screen
    Go Back

Wait For Text Present
    [Arguments]    ${text}    ${seconds}    ${message}
    Wait Until Page Contains    ${text}    ${seconds}    ${message}

Verify Text Present
    [Arguments]    ${text}
    Page Should Contain    ${text}

Verify Element Present
    [Arguments]    ${locator}
    #Wait For Element Present    ${locator}  5    Element not found in 5 seconds
    Page Should Contain Element    ${locator}

Generate Random String With Defined Size
    [Arguments]    ${size}    ${type}
    ${str}=    Generate Random String    ${size}    ${type}
    [Return]    ${str}

Generate Random Number With Defined Size
    [Arguments]    ${size}    ${type}
    ${num}=    Generate Random String    ${size}    ${type}
    [Return]    ${num}

Match Value
    [Arguments]    ${locator}    ${attr_name}    ${match_pattern}
    #Wait For Element Present    ${locator}  5    Element not found in 5 seconds
    Element Attribute Should Match    ${locator}    ${attr_name}    ${match_pattern}

Verify Text Not Present
    [Arguments]    ${text}
    Page Should Not Contain    ${text}

Select List Option By visible Text
    [Arguments]    ${locator}    ${value}
    Wait For Element Present    ${locator}  5    Element not found in 5 seconds
    Select From List By Label    ${locator}    ${value}

Verify Page title
    [Arguments]     ${title}
    Title Should Be     ${title}

Navigate to the page
    [Arguments]     ${URL}
    Go To   ${URL}

Verify Element Displayed
    [Arguments]    ${locator}
    Wait For Element Present    ${locator}  5    Element not found in 5 seconds
    Element Should Be Visible    ${locator}

Verify Element not displayed
    [Arguments]    ${locator}
    Element Should Not Be Visible    ${locator}

Verify Current URL should contains
    [Arguments]     ${URL}
    Location Should Contain     ${URL}

Static wait for
    [Arguments]     ${Second}
    Sleep    ${Second}s

Get all element count
    [Arguments]    ${locator}
    ${num}=    Get Element Count    ${locator}
    [Return]    ${num}

Verify both values are equal
    [Arguments]    ${val1}  ${val2}
    Should Be Equal     ${val1}     ${val2}

Switch to window
    [Arguments]    ${type}
    Switch Window  ${type}

Close current window
    Close Window

Get Current URL
    return from keyword     Get Location

Press keyboard key
    [Arguments]    ${locator}   ${Key}
    Wait For Element Present    ${locator}  5    Element not found in 5 seconds
    Press Key  ${locator}   \\08

Mouse Over on the element
    [Arguments]    ${locator}
    Wait For Element Present    ${locator}  5    Element not found in 5 seconds
    Mouse Over  ${locator}

URL Should Contain
    [Arguments]    ${expected}
    Location Should Contain     ${expected}

Scroll for element
    [Arguments]     ${locator}
    Scroll Element Into View    ${locator}

Scroll at the bottom of the page
    Execute Javascript      window.scrollTo(0,document.body.scrollHeight)

Scroll at the top of the page
    Execute Javascript      window.scrollTo(0,0)

Handle the alert box
    [Arguments]     ${action}
    Handle Alert    ${action}

Enter text in alert box
    [Arguments]     ${text}
    Input text into Alert   ${text}

Select a Frame
    [Arguments]  ${locator}
    Select Frame    ${locator}

UnSelect a Frame
    Unselect Frame

Get Text From element
    [Arguments]  ${locator}
    ${val}=     Get Text    ${locator}
    [return]    ${val}

Title of the window
    ${val}=     Get Title
    [return]    ${val}

Perform JavaScript Action
    [Arguments]    ${script}
    Execute Javascript    ${script}