*** Settings ***
Library    Selenium2Library


*** Variables ***
${BROWSER}    Chrome
${URL}        https://www.saucedemo.com/



*** Keywords ***
Open Browser and Navigate to Page
    # Create a Chrome WebDriver instance with default options
    #${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    #Call Method    ${options}    add_argument    --start-maximized
    #Call Method    ${options}    add_argument    --disable-notifications
    # Create WebDriver (browser instance)
    Create WebDriver    ${BROWSER}    #options=${options}
    Go To    ${URL}

Close Browser
   Close All Browsers