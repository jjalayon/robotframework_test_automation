*** Settings ***
Library    Selenium2Library


*** Variables ***
${EMAIL_INPUT}      //*[@id="user-name"]
${PASSWORD_INPUT}   //*[@id="password"]
${LOGIN_BUTTON}     //*[@id="login-button"]
${LANDINGPAGE_TITLE}   //span[@data-test="title"]



*** Keywords ***

Login with Credentials
   [Arguments]    ${email}    ${password}
    Wait Until Element Is Visible    ${EMAIL_INPUT}
    Input Text    ${EMAIL_INPUT}    ${email}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Element   ${LOGIN_BUTTON}


LandingPage Title Should Be Visible
   [Arguments]    ${EXPECTED_TITLE}
    Element Text Should Be    ${LANDINGPAGE_TITLE}   ${EXPECTED_TITLE}