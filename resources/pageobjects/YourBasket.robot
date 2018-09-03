*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${YOUR_BASKET_ELEMENT}  xpath=//h1
${YOUR_BASKET_TEXT}  Your basket
${ITEM_INFO_AREA}  xpath=//div[@class='item-info']
${ITEM_PRICE_AREA}  xpath=//p[@class='item-total']

*** Keywords ***
Verify Basket
    [Documentation]  Verify elements in the basket
    Wait Until Page Contains Element  ${YOUR_BASKET_ELEMENT}
    Wait Until Element Contains  ${YOUR_BASKET_ELEMENT}  ${YOUR_BASKET_TEXT}  5  Your Basket was not found
    Page Should Contain Element  ${ITEM_INFO_AREA}  Item info was not found
    Page Should Contain Element  ${ITEM_PRICE_AREA}  Item Price info was not found