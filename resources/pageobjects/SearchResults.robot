*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${IMAGE_ELEMENT}  //div[@class='tab search']/div[1]/div/a/img
${SEARCH_RESULTS_ELEMENT}  xpath=//h1
${ADVANCED_SEARCH_ELEMENT}  xpath=//div/h1
${NOT_FOUND_MSG}  Your search did not return any results.
${START_SEARCH_MSG}  Please enter something into the fields below to start a search.

*** Keywords ***
Verify Search Completed
    Wait Until Element Is Visible  ${SEARCH_RESULTS_ELEMENT}
    Wait Until Element Contains  ${SEARCH_RESULTS_ELEMENT}  Search results for ${BOOK}  5  ERROR: Message was not found

Click On Found Book
    [Documentation]  Clicks on the first image from search results
    Wait Until Element Is Visible  ${IMAGE_ELEMENT}
    Click Image  ${IMAGE_ELEMENT}

No Results
    [Documentation]  Message in the system when a book is not found
    Wait Until Element Is Visible  ${ADVANCED_SEARCH_ELEMENT}
    Wait Until Page Contains  ${NOT_FOUND_MSG}

Please Enter Something
    [Documentation]  Message in the system when user does not enter book's name
    Wait Until Element Is Visible  ${ADVANCED_SEARCH_ELEMENT}
    Wait Until Page Contains  ${START_SEARCH_MSG}