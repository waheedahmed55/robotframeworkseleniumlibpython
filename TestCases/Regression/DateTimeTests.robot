*** Settings ***
Resource        ../../Utility/DateTimeKeywords.robot
Library     DateTime

#ABV
    #%Y YEAR
    #%m MONTH
    #%d DAY
    #%H HOUR
    #%M MINUTE
    #%S SECOND
    #%f MILLI_SECCOND

#CUSTOM TIME FORMAT
    #%Y-%m-%d %H:%M:%S.%f
    #%Y/%m/%d
    #%Y_%m_%d %H_%M_%S/%f

*** Test Cases ***
Get current date with given timestamp
    ${val}=      Get Current Date with timestamp    %m/%d/%y %H:%M
    log to console      ${val}
    ${val}=      Get Current Date with timestamp    %m-%d/%y %H:%M
    log to console      ${val}
    ${val}=      Get Current Date with timestamp    %m %d %y %H:%M
    log to console      ${val}
    ${val}=      Get Current Date with timestamp    %m_%d_%y %H:%M
    log to console      ${val}

#Time to add    n hours, n days
Add time to given date
    ${val}=      Get Current Date with timestamp    %d-%m-%Y
    ${val1}=     Add Time To the given Date      ${val}      7 hours     %H-%d-%m-%y
    log to console      ${val1}
    ${val1}=     Add Time To the given Date      ${val}      3 days     %d-%m-%y
    log to console      ${val1}

#Time to subtract    n hours, n days
Subtract time from current date
    ${currentDate}=       Get Current Date with timestamp   %Y-%m-%d
    ${date}=            Subtract time From given Date       ${currentDate}      1 days       %Y-%m-%d
    log to console      ${date}
    ${date}=            Subtract time From given Date       ${currentDate}      46 hours       %Y-%m-%d
    log to console      ${date}

Subtract time from given static date
    ${date}=            Subtract time From given Date       2020-12-02      1 days       %Y-%m-%d
    log to console      ${date}
    ${date}=            Subtract time From given Date       2017-01-21      46 hours       %Y-%m-%d
    log to console      ${date}

Get particular type from date
    ${date}=        Get particular section from date       year
    log to console      ${date}
    ${date}=        Get particular section from date       month
    log to console      ${date}
    ${date}=        Get particular section from date       day
    log to console      ${date}
    ${date}=        Get particular section from date       hour
    log to console      ${date}
    ${date}=        Get particular section from date       second
    log to console      ${date}

Sub Date from Date
    ${date1}=       Convert date            07/09/20 13:35      result_format=%Y-%m-%d %H:%M      date_format=%d/%m/%y %H:%M
    log to console      ${date1}
    ${date2}=       Convert date            07/08/20 12:25      result_format=%Y-%m-%d %H:%M      date_format=%d/%m/%y %H:%M
    log to console      ${date2}
    ${time} =       Subtract Date From Date     ${date1}     ${date2}       compact
    log to console      ${time}

Extract type from date
    [Tags]  test
    ${date1}=       Convert date            07/09/20 13:35      result_format=datetime      date_format=%d/%m/%y %H:%M
    log to console      ${date1}
    log to console      None
    log to console      ${date1.year}
    log to console      ${date1.month}
    log to console      ${date1.day}
    log to console      ${date1.hour}
    log to console      ${date1.minute}
    log to console      ${date1.second}
    log to console      ${date1.microsecond}