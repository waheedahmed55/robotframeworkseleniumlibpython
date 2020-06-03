*** Settings ***
Resource    ../../Utility/Setup.robot
Resource    ../../Helper/HandleWindowHelper.robot
Resource    ../../TestData/ApplicationProperties.robot
Suite Setup  Open the browser in
Test Setup  Go back to homepage
Test Teardown  Capture screenshot if test failed   Dummy
Suite Teardown  Close All Browser Window

*** Test Cases ***
Manage Tabbed window
    Navigate to the site    ${WindowURL}
    Print title of window
    Click on tab button
    Switch to new window    NEW
    Print title of window
    Switch to new window    MAIN
    Print title of window

Manage Browser
    Navigate to the site    ${WindowURL}
    Click on seprate tab
    Print title of window
    Click on new window button
    Switch to new window    NEW
    Print title of window
    Switch to new window    MAIN
    Print title of window

Manage Multiple window
    Navigate to the site    ${WindowURL}
    Click on multiple tab
    Print title of window
    Click on multiple window button
    Switch to new window    NEW
    Take screenshot     NewWindow
    Print title of window
    Switch to new window    MAIN
    Print title of window