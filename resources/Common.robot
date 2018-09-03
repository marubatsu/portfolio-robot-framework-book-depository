*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
User opens the browser
    Open Browser  about:blank  ${BROWSER}

User closes the browser
    Close browser