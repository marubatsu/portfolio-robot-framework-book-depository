*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PRODUCT_DETAILS_ELEMENT}  xpath=//h2[@class='biblio-title']
${PRODUCT_DETAILS_TEXT}  Product details
${PRICE_ELEMENT}  xpath=//div[@class='item-info-wrap']/div/span[@class='sale-price']
${DESCRIPTION_ELEMENT}  xpath=//div[@class='item-info']/div[@itemprop='description']
${ADD_TO_BASKET_ELEMENT}  xpath=//div[@class='checkout-tools']/div[@class='btn-wrap']/a[contains(text(),'Add to basket')]
${ADD_TO_BASKET_TEXT}  Add to basket
${ADD_TO_WISHLIST_ELEMENT}  xpath=//div[@class='checkout-tools']/div[@class='btn-wrap']/a[contains(text(),'Add to wishlist')]
${ADD_TO_WISHLIST_TEXT}  Add to wishlist
${ITEM_WAS_ADDED_ELEMENT}  xpath=//div[@class='modal-header']/h3
${ITEM_WAS_ADDED_MSG}  Item added to your basket
${NOT_LOGGED_ELEMENT}  xpath=//div[@class='modal-header']/h3
${NOT_LOGGED_MSG}  Not logged in
${BASKET_CHECKOUT_BUTTON}  xpath=//a[contains(text(),'Basket / Checkout')]

*** Keywords ***
Verify Book Details Page
    [Documentation]  Verify if product details, price and description are in the page
    Wait Until Element Contains  ${PRODUCT_DETAILS_ELEMENT}  ${PRODUCT_DETAILS_TEXT}
    Page Should Contain Element  ${PRICE_ELEMENT}
    Page Should Contain Element  ${DESCRIPTION_ELEMENT}

Click On Add To Basket
    [Documentation]  Verify if add to basket button is displayed and clicks on it
    Wait Until Page Contains Element  ${ADD_TO_BASKET_ELEMENT}  5
    Click Link  ${ADD_TO_BASKET_TEXT}

Click On Add To Wishlist
    [Documentation]  Verify if add to wishlist button is displayed and clicks on it
    Wait Until Page Contains Element  ${ADD_TO_WISHLIST_ELEMENT}  5
    Click Link  ${ADD_TO_WISHLIST_TEXT}

Click On Basket / Checkout button
    [Documentation]  Verify if Basket / Checkout button is displayed and clicks on it
    Wait Until Page Contains Element  ${BASKET_CHECKOUT_BUTTON}  5  Basket/Checkout button was not found
    Wait Until Element Is Visible  ${BASKET_CHECKOUT_BUTTON}  5  Basket/Checkout button is not visible
    Click Element  ${BASKET_CHECKOUT_BUTTON}

Verify Added Item
    [Documentation]  Verify confirmation message in the pop-up when book is added to basket
    Wait Until Element Is Visible  ${ITEM_WAS_ADDED_ELEMENT}
    Wait Until Element Contains  ${ITEM_WAS_ADDED_ELEMENT}  ${ITEM_WAS_ADDED_MSG}  5  ERROR: Message was not found

Verify Message When User Is Not Logged In
    [Documentation]  Verify error message when user is not logged in and wants to add a book to wishlist
    Wait Until Element Is Visible  ${NOT_LOGGED_ELEMENT}
    Wait Until Element Contains  ${NOT_LOGGED_ELEMENT}  ${NOT_LOGGED_MSG}  5  ERROR: Message was not found