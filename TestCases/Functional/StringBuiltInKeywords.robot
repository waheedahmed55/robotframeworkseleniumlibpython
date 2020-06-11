*** Settings ***
Library     String
Library     BuiltIn
Documentation   In this suite we are using various BuiltIn keywords and String keywords.
...             Convert To Lower Case is String keyword which converts string to lower case.
...             log to console is BuiltIn keyword it Logs the given message to the console.
...             Convert to Upper Case is String keyword which converts string to upper case.
...             Should Be Uppercase is String keyword it fails if the given string is not in uppercase.
...             Should Be Lowercase is string keyword it fails if the given string is not in lowercase.
...             Length Should Be is BuiltIn keyword it verifies that the length of the given item is correct.
...             Should Be Equal is BuiltIn keyword it fails if the given objects are unequal.
...             Should Not Be Equal is BuiltIn keywordit it fails if the given objects are equal.
...             Should Be Equal As Integers is BuiltIn keyword it fails if objects are unequal after converting them to integers.
...             Should Be Equal As Strings is BuiltIn keyword it fails if objects are unequal after converting them to strings.
...             Should Contain is BuiltIn keyword it fails if container does not contain item one or more times.
...             Should Not Contain is BuiltIn keyword it fails if container contains item one or more times.
...             Should Contain X Times is Builtin keyword it fails if container does not contain item count times.
...             Should End With is BuiltIn keyword it fails if the string str1 does not end with the string str2.
...             Should Not End With is BuiltIn keyword it fails if the string str1 ends with the string str2.
...             Should Start With is BuiltIn keyword it fails if the string str1 does not start with the string str2.
...             Should Not Start With is BuiltIn keyword it fails if the string str1 starts with the string str2.
...             Should Be Empty is BuiltIn keyword it verifies that the given item is empty.
...             Should Not Be Empty is BuiltIn keyword it verifies that the given item is not empty.
...             Should be true is BuiltIn keyword it fails if the given condition is not true.
...             Should Not be true BuiltIn keyword it fails if the given condition is true.
...             String String is String keyword it remove leading and/or trailing whitespaces from the given string.

*** Variables ***
${upperCase}   ABCDEFGHIJKLMNOPQRSTUVWXYZ
${blank}
${Line}     This is new line

*** Test Cases ***
Testcase1
    ${a}=    Convert To Lower Case   ${upperCase}
    log to console  ${a}
    ${b}=    Convert To Upper Case   ${a}
    log to console  ${b}
    Should Be Uppercase     ${b}
    Should Be Lowercase     ${a}

Testcase2
     ${count}=  Get Length  ${upperCase}
     log to console     ${count}
     Length Should Be   ${upperCase}    26
     Should Be Equal    ${upperCase}    ABCDEFGHIJKLMNOPQRSTUVWXYZ
     Should Be Equal    ${upperCase}    abcdefghijklmnopqrstuvwxyz  ignore_case=true
     Should Not Be Equal    ${upperCase}    abcdefghijklmnopqrstuvwxyz
     Should Be Equal As Integers    ${count}    26
     Should Be Equal As Strings    ${count}    26
     Should Contain    ${upperCase}     ABCDEF
     Should Not Contain    ${upperCase}     abcDEF
     Should Contain X Times    ${Line}     line   1
     Should Contain X Times    ${Line}     LINE   0
     Should Contain X Times    ${Line}     e   2
     Should End With    ${Line}     line
     Should End With    ${upperCase}     XYZ
     Should Not End With    ${upperCase}     xyz
     Should Start With    ${upperCase}     ABCD
     Should Start With    ${upperCase}     abcd     ignore_case=true
     Should Not Start With    ${upperCase}     abcd
     Should Be Empty    ${blank}
     Should Not Be Empty    ${upperCase}
     Should be true     30>${count}>2
     Should Not be true     ${count}==2
     ${val}=    Strip String    ${Line}    characters=line
     log to console     ${val}
     ${val}=    Strip String    ${Line}    characters=This
     log to console     ${val}