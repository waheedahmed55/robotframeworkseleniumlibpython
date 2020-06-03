*** Settings ***
Resource    ../../Utility/Setup.robot
Resource    ../../Helper/HandleHelper.robot
Resource    ../../Helper/CommonHelper.robot
Resource    ../../TestData/ApplicationProperties.robot
Suite Setup  Open the browser in
Test Setup  Go back to homepage
Test Teardown  Capture screenshot if test failed   Dummy
Suite Teardown  Close All Browser Window

*** Test Cases ***
Verify Alert
    Navigate to the site    ${AlertPageUrl}
    Click on the alert button
    Accept the alert

Verify Alert with cancel
    Navigate to the site    ${AlertPageUrl}
    Cllick on Alert with Cancel link
    Click on the alert with Cancel button
    Accept the alert
    Click on the alert with Cancel button
    Dismiss the alert

Verify Alert with Textbox
    Navigate to the site    ${AlertPageUrl}
    Click on Alert with Textbox link
    Click on the alert with textbox button
    Enter text in alert     Dummy Alert Text

Verify Frame
    Navigate to the site    ${FrameUrl}
    Switch to the frame
    Enter text in the field     Dummy Alert Text
    Come out from frame
