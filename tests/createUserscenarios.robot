*** Settings ***
Documentation    test suite for april 2022 testers
Library          SeleniumLibrary
Resource         ../Resources/myFirstRobotKeyword.robot
Resource         ../Resources/myFirstRobotVariable.robot
Suite Setup      Navigate to login page
Library          FakerLibrary
#Suite Teardown   Close All Browsers

*** Test Cases ***
User should be able to create account
    Enter email for new account and navigate to information page
    Select user gender
    Enter user firstname
    Enter user lastname
    Enter User Password  testing
    Enter date of birth in days, months and years
    Select news letter and option checkboxes
    Enter User Address and City
    Select State and Enter Postal Code
    Enter user phone number, Address Alias and click on the register and assert account is created
    [Teardown]  Sign out and close all browsers

Add new address for users
    [Tags]  data
    Customer login 2  ${USERNAME}  ${PASSWORD}
    Select My Addresses  ${MY_ADDRESSES}
    Select Add a new address   ${ADD_ADDRESS_BTN}
    Enter new address and city for the user  1 testing boulevard
    Select State and Enter Postal Code
    Enter user phone number, Address Alias and click the save button
    [Teardown]  Delete Address and Close Browser


*** Keywords ***
Provided precondition
    Setup system under test