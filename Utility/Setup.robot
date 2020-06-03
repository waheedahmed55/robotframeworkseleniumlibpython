*** Settings ***
Library     SeleniumLibrary
Resource    ../TestData/ApplicationProperties.robot
Library  OperatingSystem
Library  BuiltIn
Library  String

*** Keywords ***
Launch browser and navigate to
    [Arguments]     ${appURL}
    Open Browser    ${appURL}  Chrome
    log to console  headless
    Maximize Browser Window
    Set Selenium Timeout    10s

Open the browser in
    #Open Browser    ${URL}  headLessChrome
    Open Browser    ${URL}  Chrome
    log to console  headless
    Maximize Browser Window
    Set Selenium Timeout    10s

Close All Browser Window
        Close All Browsers

Go back to homepage
    Go To   ${URL}

Capture screenshot if test failed
    [Arguments]  ${FileName}
    ${now}    Evaluate  '{dt.second}{dt.minute}{dt.hour}{dt.day}{dt.month}{dt.year}'.format(dt=datetime.datetime.now())    modules=datetime
    Run Keyword If Test Failed      Capture Page Screenshot    ${OUTPUTDIR}/ScreenShot/${FileName}_${now}.png

Take screenshot
    [Arguments]  ${FileName}
    ${now}    Evaluate  '{dt.second}{dt.minute}{dt.hour}{dt.day}{dt.month}{dt.year}'.format(dt=datetime.datetime.now())    modules=datetime
    Capture Page Screenshot    ${OUTPUTDIR}/ScreenShot/${FileName}_${now}.png