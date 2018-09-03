*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/pageobjects/LandingPage.robot
Resource  ../resources/pageobjects/Header.robot
Resource  ../resources/pageobjects/SearchResults.robot
Resource  ../resources/pageobjects/BookDetails.robot
Resource  ../resources/pageobjects/YourBasket.robot

*** Keywords ***
# User's actions
User navigates to website
    LandingPage.Load URL
    LandingPage.Verify Page Loaded

User enters the name of a book in search text field
    Header.Verify Search Text Field
    Header.Enter Book Name

User enters the name of a book that does not exist
    Header.Enter nonexistent book

User clicks on Search button
    Header.Submit Search

User clicks on book's image
    SearchResults.Click On Found Book

User clicks on Add to basket button
    BookDetails.Click On Add To Basket

User clicks on Add to wishlist button
    BookDetails.Click On Add To Wishlist

User clicks on Basket / Checkout button
    BookDetails.Click On Basket / Checkout button

# Results from system
System displays search results
    SearchResults.Verify Search Completed

System indicates that the search did not return any result
    SearchResults.No Results

System indicates to enter something to start a search
    SearchResults.Please Enter Something

System displays book's details
    BookDetails.Verify Book Details Page

System displays that item was added to basket
    BookDetails.Verify Added Item

System indicates that the user is not logged in
    BookDetails.Verify Message When User Is Not Logged In

System displays the basket and the book
    YourBasket.Verify Basket