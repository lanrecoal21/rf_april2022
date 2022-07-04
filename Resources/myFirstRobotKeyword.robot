*** Settings ***
Documentation   Keywords for april 2022 project
Library         SeleniumLibrary
Resource        myFirstRobotVariable.robot
Library         FakerLibrary


*** Keywords ***
Navigate to login page
   Open Browser  ${URL}  ${BROWSER}
   Maximize Browser Window
   Element Should Be Visible  ${HOMEPAGE_LOGO}
   Wait Until Element is Visible   ${HOMEPAGE_SIGNIN_LINK}  10s
   Click Element   ${HOMEPAGE_SIGNIN_LINK}

Customer login
   [Arguments]  ${username}  ${password}
   Wait Until Element is Visible   ${LOGIN_USERNAME_FIELD}  10s
   Input Text  ${LOGIN_USERNAME_FIELD}  ${username}
   Wait Until Element is Visible  ${LOGIN_PASSWD_FIELD}
   Input Text  ${LOGIN_PASSWD_FIELD}  ${password}
   Wait Until Element is Visible  ${LOGIN_BTN}
   Click Button   ${LOGIN_BTN}
   Wait Until Page Contains  Sign out
   Click Element  class:logout

Customer login 2
   [Arguments]  ${username}  ${password}
   Wait Until Element is Visible   ${LOGIN_USERNAME_FIELD}  10s
   Input Text  ${LOGIN_USERNAME_FIELD}  ${username}
   Wait Until Element is Visible  ${LOGIN_PASSWD_FIELD}
   Input Text  ${LOGIN_PASSWD_FIELD}  ${password}
   Wait Until Element is Visible  ${LOGIN_BTN}
   Click Button   ${LOGIN_BTN}
   Wait Until Page Contains  Sign out

I enter valid credentials
   [Arguments]  ${username}  ${password}
   Wait Until Element is Visible   ${LOGIN_USERNAME_FIELD}  10s
   Input Text  ${LOGIN_USERNAME_FIELD}  ${username}
   Wait Until Element is Visible  ${LOGIN_PASSWD_FIELD}
   Input Text  ${LOGIN_PASSWD_FIELD}  ${password}

I Click login Button
  Wait Until Element is Visible  ${LOGIN_BTN}
  Click Button   ${LOGIN_BTN}

My login should be successful
   Wait Until Page Contains  Sign out

Retrieve User Password
   [Arguments]  ${user_email}
   Wait and Click Element  ${FORGOT_PASSWORD_LINK}
   Wait Until Element is Visible   ${LOGIN_USERNAME_FIELD}
   Input Text  ${LOGIN_USERNAME_FIELD}   ${user_email}
   Wait Until Element is Visible   ${RETRIEVE_PASSWD_BTN}
   Click Element  ${RETRIEVE_PASSWD_BTN}
   Wait Until Page Contains  ${FORGOT_PASSWD_SUCCESS}
   Wait and Click Element  xpath://*[@id="center_column"]/ul/li/a/span


Enter email for new account and navigate to information page
   ${email}=  FakerLibrary.email
   log  ${email}
   Set Test Variable  ${email}
   Wait Until Element is Visible  ${CREATENEWUSER_EMAILFIELD}
   Input Text   ${CREATENEWUSER_EMAILFIELD}   ${email}
   Wait and Click Element  ${CREATENEWUSER_CREATEACC_BTN}

Select user gender
   sleep  5
   Wait and Click Element  ${CREATENEWUSER_GENDERBTN}

Go to home page
  Given Navigate to login page

Enter user firstname
   ${firstname}=  FakerLibrary.firstname
   log  ${firstname}
   Set Test Variable  ${firstname}
   Wait Until Element is Visible  ${CREATENEWUSER_FIRSTNAME}
   Input Text   ${CREATENEWUSER_FIRSTNAME}   ${firstname}

Enter user lastname
   ${lastname}=  FakerLibrary.lastname
   log  ${lastname}
   Set Test Variable  ${lastname}
   Wait Until Element is Visible  ${CREATENEWUSER_LASTNAME}
   Input Text   ${CREATENEWUSER_LASTNAME}   ${lastname}

Enter User Password
   [Arguments]  ${password}
   Wait Until Element is Visible  ${CREATENEWUSER_PASSWORD}
   Input Text   ${CREATENEWUSER_PASSWORD}   ${password}

Enter date of birth in days, months and years
   Sleep  5
   #Wait until Element is Visible  ${CREATENEWUSER_DOB_DAY}
   #Click Element  ${CREATENEWUSER_DOB_DAY}
   Select From List By Index    ${CREATENEWUSER_DOB_DAY}  10
   Sleep  5
   #Wait until Element is Visible  ${CREATENEWUSER_DOB_MONTH}
   Select From List By Index    ${CREATENEWUSER_DOB_MONTH}  9
   Sleep  5
   #Wait until Element is Visible  ${CREATENEWUSER_DOB_YEAR}
   Select From List By Value   ${CREATENEWUSER_DOB_YEAR}  1990


Select news letter and option checkboxes
   #Wait until Element is Visible   ${CREATENEWUSER_NEWSLETTER}
   Select Checkbox  ${CREATENEWUSER_NEWSLETTER}
   #Wait until Element is Visible   ${CREATENEWUSER_SOP}
   Select Checkbox  ${CREATENEWUSER_SOP}

Enter User Address and City
   Wait and Input Text  ${CREATENEWUSER_ADDRESS}  1 fake street
   Wait and Input Text  ${CREATENEWUSER_CITY}  Chicago

Select State and Enter Postal Code
   #Wait Until Element is Visible  ${CREATENEWUSER_STATE}
   Select From List By Label   ${CREATENEWUSER_STATE}  Illinois
   Wait and Input Text  ${CREATENEWUSER_POSTCODE}  00000

Enter user phone number, Address Alias and click on the register and assert account is created
   Wait and Input Text  ${CREATENEWUSER_PHONE}  123456789
   Wait and Input Text  ${CREATENEWUSER_ADD_ALIAS}  QA House
   Wait and Click Element  ${CREATENEWUSER_REG_BTN}
   Wait Until Page Contains  Sign out

Sign out and close all browsers
     Wait and Click Element  class:logout
     Close All Browsers

Select My Addresses
   [Arguments]  ${my_addressesbutton}
   Wait and Click Element   ${my_addressesbutton}

Select Add a new address
   [Arguments]  ${new_addressbutton}
   Wait and Click Element   ${new_addressbutton}


Enter new address and city for the user
   [Arguments]  ${user_new_address}
   Wait and Input Text  ${CREATENEWUSER_ADDRESS}  ${user_new_address}
   Wait and Input Text  ${CREATENEWUSER_CITY}  Chicago

Enter user phone number, Address Alias and click the save button
   Wait and Input Text  ${CREATENEWUSER_PHONE}  123456789
   Wait and Input Text  ${CREATENEWUSER_ADD_ALIAS}  QA House
   Wait and Click Element  ${USER_INFO_SAVE_BTN}
   Page Should Contain  QA House

Delete Address and Close Browser
    Wait and Click Element  ${DELETE_NEW_ADDRESS_BTN}
    Handle Alert  Accept
    Wait Until Page Does Not Contain  QA House
    Close Browser

Wait and Input Text
  [Documentation]  Wait for element to be visible and enabled before interaction
  [Arguments]  ${selector}  ${text}  ${timeouts}=10s
  Wait Until Element is Enabled  ${selector}
  Input Text  ${selector}  ${text}


Wait and Click Element
  [Documentation]  Wait for element to be visible and enabled before interaction
  [Arguments]  ${selector}  ${timeouts}=10s
  Wait Until Element is Enabled  ${selector}
  Click Element  ${selector}






