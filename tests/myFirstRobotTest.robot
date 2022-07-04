*** Settings ***
Documentation    test suite for april 2022 testers
Library          SeleniumLibrary
Resource         ../Resources/myFirstRobotKeyword.robot
Resource         ../Resources/myFirstRobotVariable.robot
Suite Setup      Navigate to login page
Suite Teardown   Close All Browsers

*** Test Cases ***
User should be able to login with valid credentials
   [Tags]  lanre
   Customer login  ${USERNAME}  ${PASSWORD}

User Should be able to Retrieve Password
   [Tags]  lanre1
   Retrieve User Password  ${USERNAME}


Invalid Login
    [Tags]  Invalid
    [Template]  Login with Invalid credentials should return the correct message
    #Username                    Password                      ErrorMessage
    Lanreikue@gmail.com          testing                       Authentication failed.
    lanre.ikuesan@gmail.com      test                          Invalid password
    ${EMPTY}                     testing                       An email address required
    lanre.ikuesan@gmail.com      ${EMPTY}                      Password is required
    ${EMPTY}                     ${EMPTY}                      An email address required

*** Keywords ***
Login with Invalid credentials should return the correct message
  [Arguments]  ${username}  ${password}  ${errormessage}
  Input Text  ${LOGIN_USERNAME_FIELD}  ${username}
  Input Text  ${LOGIN_PASSWD_FIELD}    ${password}
  Click Button  ${LOGIN_BTN}
  Page Should Contain  ${errormessage}


