*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/myFirstRobotKeyword.robot
Resource         ../Resources/myFirstRobotVariable.robot
Library          FakerLibrary

*** Test Cases ***
Go to Home page and login user
   Given Navigate to login page
   And I enter valid credentials   ${USERNAME}  ${PASSWORD}
   When I Click login Button
   Then My login should be successful

Go to Automation Practice home page
   Go to home page
    


*** Keywords ***
Provided precondition
    Setup system under test