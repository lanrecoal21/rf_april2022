*** Settings ***
Documentation  API Testing in Robot Framework
#Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  BuiltIn
Library  Collections

*** Test Cases ***
Get Pet with status available
    [documentation]  This test case verifies that the response code for pet status available is 200
    #[Tags]  Get1
    Create Session  Mysession  https://petstore.swagger.io  verify=true
    ${reponse}=  GET On Session  Mysession   /v2/pet/findByStatus?  params=status=available
    Status Should Be  200   ${reponse}

Get Pet with status pending
    [documentation]  This test case verifies that the response code for pet status available is 200
    #[Tags]  Get1
    Create Session  Mysession  https://petstore.swagger.io  verify=true
    ${reponse}=  GET On Session  Mysession   /v2/pet/findByStatus?  params=status=pending
    Status Should Be  200   ${reponse}

Get Pet with status sold
    [documentation]  This test case verifies that the response code for pet status available is 200
    #[Tags]  Get1
    Create Session  Mysession  https://petstore.swagger.io  verify=true
    ${reponse}=  GET On Session  Mysession   /v2/pet/findByStatus?  params=status=sold
    Status Should Be  200   ${reponse}

Get Pet with by ID
    [documentation]  This test case verifies that the response code for pet status available is 200
    [Tags]  Get1
    Create Session  Mysession  https://petstore.swagger.io  verify=true
    ${reponse}=  GET On Session  Mysession   /v2/pet/9223372036854775807
    Status Should Be  200   ${reponse}

Create a new pet in pet store
    [documentation]  This test case verifies that the response code for creating pet is 200
    [Tags]  post
    ${body}=  Create Dictionary  id=0  name=cat  status=available
    ${resp}=  POST  https://petstore.swagger.io/v2/pet  json=${body}
    Status Should Be  200  ${resp}



*** Keywords ***
Provided precondition
    Setup system under test