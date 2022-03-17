*** Settings ***
Documentation    Basic robotfarmework tests
Library          SeleniumLibrary
Suite Teardown   Close All Browsers


*** Test Cases ***
Valid login test
    [Tags]    Ola
   Open Browser  http://automationpractice.com/index.php?  chrome
   Click Element  class:login
   Input Text  id:email  arabataofikolasile@gmail.com
   Input Text  id:passwd  Farayola
   Click Element  xpath://*[@id="SubmitLogin"]/span
   Page Should Contain  Taofik Araba
   #[Teardown]  Close Browser


Invalid login test
    [Tags]    DEBUG
   Open Browser  http://automationpractice.com/index.php?  chrome
   Click Element  class:login
   Input Text  id:email  arabataofikolasile@gmail.com
   Input Text  id:passwd  Farayol
   Click Element  xpath://*[@id="SubmitLogin"]/span
   Page Should Contain  Authentication failed
   #[Teardown]  Close Browser


Invalid login test2
    [Tags]    DEBUG
   Open Browser  http://automationpractice.com/index.php?  chrome
   Click Element  class:login
   Input Text  id:email  arabataofikolasi@gmail.com
   Input Text  id:passwd  Farayola
   Click Element  xpath://*[@id="SubmitLogin"]/span
   Page Should Contain  Authentication failed
   #[Teardown]  Close Browser


Invalid login test3
    [Tags]    DEBUG
   Open Browser  http://automationpractice.com/index.php?  chrome
   Click Element  class:login
   Input Text  id:email  arabataofikolasilegmail.com
   Input Text  id:passwd  Farayola
   Click Element  xpath://*[@id="SubmitLogin"]/span
   Page Should Contain  Invalid email address
   #[Teardown]  Close Browser


Invalid login test4
    [Tags]    DEBUG
   Open Browser  http://automationpractice.com/index.php?  chrome
   Click Element  class:login
   Input Text  id:email  ${EMPTY}
   Input Text  id:passwd  Farayola
   Click Element  xpath://*[@id="SubmitLogin"]/span
   Page Should Contain  An email address required.
   #[Teardown]  Close Browser

Invalid login scenarios
    [Tags]     Data_Set
    [Template]  Invalid login credentials should return the right error message
    #username                         #Password                             #Error Message
    arabataofikolasile@gmail.com      Farayol                               Authentication failed
    arabataofikolasi@gmail.com        Farayola                              Authentication failed
    arabataofikolasilegmail.com       Farayola                              Invalid email address
    ${EMPTY}                          Farayola                              An email address required.
    ${EMPTY}                          ${EMPTY}                              An email address required.


*** Keywords ***
Invalid login credentials should return the right error message
  [Arguments]  ${username_email}  ${password}  ${error_message}
    Open Browser  http://automationpractice.com/index.php?  chrome
   Click Element  class:login
   Input Text  id:email  ${username_email}
   Input Text  id:passwd  ${password}
   Click Element  xpath://*[@id="SubmitLogin"]/span
   Page Should Contain  ${error_message}