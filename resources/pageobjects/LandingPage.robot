*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGO}  //img[@alt='Bookdepository.com']

*** Keywords ***
Load URL
    Go To  ${URL}

Verify Page Loaded
    Wait Until Page Contains Element  ${LOGO}