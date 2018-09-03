*** Settings ***
Documentation  Testing some flows as a user in Book Depository
Resource  ../resources/BookDepository.robot
Resource  ../resources/Common.robot
Suite Setup  User opens the browser
Suite Teardown  User closes the browser

*** Variables ***
${BROWSER} =  chrome
${BOOK} =  Harry Potter and the philosopher's stone
${URL} =  https://www.bookdepository.com

*** Test Cases ***
Test Case 1 - Logged off user searches for a book by its name
    [Documentation]  A user looks for a book in the website without being logged in
    [Tags]  Smoke
    User navigates to website
    User enters the name of a book in search text field
    User clicks on Search button
    System displays search results

Test Case 2 - Logged off user looks for a book that does not exist
    [Documentation]  A user looks for a book that does not exist in the database
    [Tags]  Regression
    User navigates to website
    User enters the name of a book that does not exist
    User clicks on Search button
    System indicates that the search did not return any result

Test Case 3 - Logged off user does not enter book's name
    [Documentation]  A user clicks on find button without entering a book's name
    [Tags]  Regression
    User navigates to website
    User clicks on Search button
    System indicates to enter something to start a search

Test Case 4 - Logged off user checks the details of a book
    [Documentation]  A user clicks on the first book to check its details
    [Tags]  Smoke
    User navigates to website
    User enters the name of a book in search text field
    User clicks on Search button
    User clicks on book's image
    System displays book's details

Test Case 5 - Logged off user adds a book to the basket
    [Documentation]  A logged off user clicks on Add to basket button
    [Tags]  Smoke
    User navigates to website
    User enters the name of a book in search text field
    User clicks on Search button
    User clicks on book's image
    User clicks on Add to basket button
    System displays that item was added to basket

Test Case 6 - Logged off user wants to adds a book to wishlist
    [Documentation]  A logged off user tries to add a book to the wishlist
    [Tags]  Regression
    User navigates to website
    User enters the name of a book in search text field
    User clicks on Search button
    User clicks on book's image
    User clicks on Add to wishlist button
    System indicates that the user is not logged in

Test Case 7 - Logged off user checks the book in the basket
    [Documentation]  A logged off user checks the basket after adding a book
    [Tags]  Smoke
    User navigates to website
    User enters the name of a book in search text field
    User clicks on Search button
    User clicks on book's image
    User clicks on Add to basket button
    User clicks on Basket / Checkout button
    System displays the basket and the book