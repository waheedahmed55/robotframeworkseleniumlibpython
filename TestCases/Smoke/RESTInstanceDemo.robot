*** Settings ***
Library     REST    https://waheedahmed55.testrail.io/
Library     OperatingSystem
Library     JSONLibrary
Library     String

*** Variables ***
${headers}     {"Content-Type":"application/json","Authorization":"Basic d2FoZWVkYWhtZWQ1NUBnbWFpbC5jb206VUhnRFdmVlhkczRFSnRMNVZsUVg="}
${SuiteJson}    {"name":"This is a new test suite","description": "Use the description to add additional context details"}
${SectionJson}  {"name":"Automated Section"}
${CaseJson}     {"title": "This is a test case","type_id": 1,"priority_id": 3,"estimate": "3m","custom_steps_separated": [{"content": "Step 1","expected": "Expected Result 1"},{"content": "Step 2","expected": "Expected Result 2"}]}
${UpdateCaseJson}     {"title": "This is a updated test case","type_id": 2,"priority_id": 2,"estimate": "15s","custom_steps_separated": [{"content": "Step 1","expected": "Expected Result 1"},{"content": "Step 2","expected": "Expected Result 2"}]}

*** Test Cases ***
GET PROJECT
    &{resp}=    GET         index.php?/api/v2/get_project/1     headers=${headers}
    Output schema   response body
    Output   response body
    Should Contain      ${resp.body}.name   Demo
    Integer     response body id          1
    String      response body name          DemoAutomation
    Integer     response status     200
    Output  response body   ${EXECDIR}/Reports/temp.json

ADD SECTION
    POST    index.php?/api/v2/add_section/1     body=${SectionJson}     headers=${headers}
    Output	response body	${CURDIR}/temp.json
    ${json_object}=     Load JSON From File     ${CURDIR}/temp.json
    Remove File     ${CURDIR}/temp.json
    ${values}=     Get Value From Json     ${json_object}      $.id
    Set Suite Variable  ${Section_id}   ${values[0]}
    Integer     response status           200
    Integer     response body id           ${Section_id}

ADD CASE
    POST    index.php?/api/v2/add_case/${Section_id}       body=${CaseJson}    headers=${headers}
    Output	response body	${CURDIR}/temp.json
    ${json_object}=     Load JSON From File     ${CURDIR}/temp.json
    Remove File     ${CURDIR}/temp.json
    ${values}=     Get Value From Json     ${json_object}      $.id
    Set Suite Variable  ${Case_id}   ${values[0]}
    Integer     response status           200
    Integer     response body id           ${Case_id}

UPDATE CASE
    POST    index.php?/api/v2/update_case/${Case_id}       body=${UpdateCaseJson}    headers=${headers}
    Integer     response status           200

DELETE CASE
    POST    index.php?/api/v2/delete_case/${Case_id}       body=${UpdateCaseJson}    headers=${headers}
    Integer     response status           200

DELETE SECTION
    POST    index.php?/api/v2/delete_section/${Section_id}     headers=${headers}
    Integer     response status           200