*** Settings ***
Library     DateTime

*** Keywords ***
Get Current Date with timestamp
    [Arguments]     ${timestamp}
    ${currentDate}=       Get Current Date        exclude_millis=False
    ${date}=              Convert Date      ${currentDate}      result_format=${timestamp}
    [return]        ${date}

Add Time To the given Date
    [Arguments]     ${date}     ${timeToAdd}    ${timestamp}
    ${date1}=       Get Current Date with timestamp     ${timestamp}
    ${val}=     Add Time To Date        	${date1}     ${timeToAdd}    result_format=${timestamp}      exclude_millis=False        date_format=${timestamp}
    [return]    ${val}

Subtract time From given Date
    [Arguments]     ${date}     ${date1}    ${timestamp}
    ${date}=              Convert Date      ${date}      result_format=${timestamp} %H:%M:%S.%f
    ${val}=         Subtract Time From Date     ${date}     ${date1}        result_format=${timestamp}      exclude_millis=False
    [return]        ${val}

#type = hours, day, month, year
Get particular section from date
    [Arguments]     ${type}
    ${date}=        Get Current Date with timestamp     datetime
    [return]        ${date.${type}}