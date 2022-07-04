*** Settings ***
Documentation  variables for april 2022 project


*** Variables ***
${URL}  http://automationpractice.com/index.php
${BROWSER}  chrome
${HOMEPAGE_LOGO}  id:header_logo
${HOMEPAGE_SIGNIN_LINK}  class:login
${LOGIN_USERNAME_FIELD}  name:email
${LOGIN_PASSWD_FIELD}  id:passwd
${LOGIN_BTN}  id:SubmitLogin
${FORGOT_PASSWORD_LINK}  xpath://*[@id="login_form"]/div/p[1]/a
${RETRIEVE_PASSWD_BTN}  xpath://*[@id="form_forgotpassword"]/fieldset/p/button/span
${FORGOT_PASSWD_SUCCESS}  A confirmation email has been sent to your address: lanre.ikuesan@gmail.com
${USERNAME}  ${EMPTY}
${PASSWORD}  ${EMPTY}
${CREATENEWUSER_EMAILFIELD}  id:email_create
${CREATENEWUSER_CREATEACC_BTN}  css:#SubmitCreate > span
${CREATENEWUSER_GENDERBTN}  id:id_gender2
${CREATENEWUSER_FIRSTNAME}  name:customer_firstname
${CREATENEWUSER_LASTNAME}   name:customer_lastname
${CREATENEWUSER_PASSWORD}  id:passwd
${CREATENEWUSER_DOB_DAY}  id:days
${CREATENEWUSER_DOB_MONTH}  id:months
${CREATENEWUSER_DOB_YEAR}  id:years
${CREATENEWUSER_NEWSLETTER}  name:newsletter
${CREATENEWUSER_SOP}  id:optin
${CREATENEWUSER_ADDRESS}  id:address1
${CREATENEWUSER_CITY}  id:city
${CREATENEWUSER_STATE}  id:id_state
${CREATENEWUSER_POSTCODE}  id:postcode
${CREATENEWUSER_PHONE}  id:phone_mobile
${CREATENEWUSER_ADD_ALIAS}  id:alias
${CREATENEWUSER_REG_BTN}  xpath://*[@id="submitAccount"]/span
${MY_ADDRESSES}  xpath://span[text() = 'My addresses']
${MY_PERSONAL_INFO}  xpath://span[text() = 'My personal information']
${ADD_ADDRESS_BTN}  xpath://span[text() = 'Add a new address']
${USER_INFO_SAVE_BTN}  xpath://*[contains(text(),"Save")]
${DELETE_NEW_ADDRESS_BTN}  xpath://*[@id="center_column"]/div[1]/div/div[2]/ul/li[9]/a[2]/span

