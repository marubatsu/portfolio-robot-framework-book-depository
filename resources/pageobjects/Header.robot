*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SEARCH_FIELD_ELEMENT}  name=searchTerm
${SEARCH_BUTTON}  xpath=//button[@class='header-search-btn']
${NONEXISTENT_BOOK}  zxcvbnm

*** Keywords ***
Verify Search Text Field
    Wait Until Page Contains Element  ${SEARCH_FIELD_ELEMENT}

Enter Book Name
    Wait Until Page Contains Element  ${SEARCH_FIELD_ELEMENT}
    Input Text  name=searchTerm  ${BOOK}

Enter nonexistent book
    Wait Until Page Contains Element  ${SEARCH_FIELD_ELEMENT}
    Input Text  name=searchTerm  ${NONEXISTENT_BOOK}

Submit Search
    Click Button  ${SEARCH_BUTTON}