# Testing Book Depository with Robot Framework

This project is just for learning and practice Robot Framework. It tests some flows in Book Depository: https://www.bookdepository.com/.

## Tools
* Robot Framework
* PyCharm as IDE
* selenium (```pip install -U selenium```)
* robotframework (```pip install robotframework```)
* robotframework-seleniumlibrary (```pip install --upgrade robotframework-seleniumlibrary```)

## Project Folder Structure
```
portfolio-robot-framework-book-depository/
+--resources        (common actions)
|  +--pageobjects   (objects from pages used for test cases)
+--results          (reports with test results)
+--tests            (script with test cases)
```

## Tests Execution
### Option 1:
In the terminal, go to the project's folder and enter the following command:
```
robot -d results tests/tests.robot
```
Browser by default is Chrome, and book by default is 'Harry Potter and the philosopher's stone'

### Option 2: 
In the terminal, go to the project's folder and add some parameters to the following command:
```
robot -v BROWSER:{browser} -v BOOK:'{book_name}' -d results tests/tests.robot
```
* {browser} = firefox, chrome, safari
* {book_name} = book to be searched

Examples:
```
robot -v BROWSER:firefox -v BOOK:'Alice in Wonderland' -d results tests/tests.robot
robot -v BROWSER:safari -v BOOK:'Five weeks in a balloon' -d results tests/tests.robot
```

## Coverage
* Test Case 1 - Logged off user searches for a book by its name
* Test Case 2 - Logged off user looks for a book that does not exist
* Test Case 3 - Logged off user does not enter book's name
* Test Case 4 - Logged off user checks the details of a book
* Test Case 5 - Logged off user adds a book to the basket
* Test Case 6 - Logged off user wants to adds a book to wishlist
* Test Case 7 - Logged off user checks the book in the basket


## Notes
As I am a Mac user, I installed the drivers with homebrew:
* ```brew install geckodriver```
* ```brew cask install chromedriver```
