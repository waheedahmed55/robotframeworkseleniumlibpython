*** Settings ***
Resource    ../PageObjects/HandleObjects.robot
Resource    ../Utility/SeleniumKeywords.robot
Library     BuiltIn

*** Keywords ***
Click on the alert button
    sleep   3s
    Click On Button   ${NormalAlert}
    sleep   3s
Accept the alert
    Handle the alert box    ACCEPT

Click on the alert with Cancel button
    sleep   3s
    Click On Button   ${AlertWithCancel}
    sleep   3s

Cllick on Alert with Cancel link
    Click On Page Element   ${AlertWithCancelLink}

Dismiss the alert
    Handle the alert box    DISMISS

Click on Alert with Textbox link
    Click On Page Element   ${AlertWithTextBoxLink}

Click on the alert with textbox button
    Click On Button   ${AlertWithTextbox}

Enter text in alert
    [Arguments]     ${text}
    Enter text in alert box     ${text}
    sleep   3s

Switch to the frame
    Select a Frame  ${SingleFrame}

Enter text in the field
    [Arguments]     ${text}
    Set Value For Input Field   ${InputText}    ${text}

Come out from frame
    UnSelect a Frame
