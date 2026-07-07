*** Settings ***
Resource       ../resources/pages/common_page.robot
Resource       ../resources/data/common_data.robot
Resource       ../resources/pages/login_page.robot
Test Setup     Open Browser and Navigate to Page
Test Teardown  Close Browser


*** Test Cases ***
TC01 - Login Test With Valid Data
    [Tags]    smoke
    Login with Credentials   ${VALID_EMAIL}    ${VALID_PASSWORD}
    LandingPage Title Should Be Visible   ${LANDING_PAGE_EXPECTED_TITLE} 