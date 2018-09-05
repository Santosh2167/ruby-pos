# Get Me the Money!!! POS MVP
User friendly, light weight, and offline POS for small businesses with reporting and on the fly data entry. 

### Purpose of the Project 
To develop a functioning Point of Sales software that allows users to record POS transactions. This is the first version of the "Get Me The Money POS System" built with the core features in mind.

#### Functionality of the Software 
1. Password protected - User has to key an authorized username and password to log in. After 3 failed attempts, the system shuts down.

2. Items - User can add and look up the items

3. Transactions - User can record point of sales transactions. Each transaction has its unique ID (time stamped). User can look up for a transaction using its transaction ID

4. Reporting - Software presents 2 key reports in the first version 
               1. View all items in the database
               2. View all transactions
               
<p align="center">
  <img src="https://github.com/TheodoreChuang/ruby-pos/blob/master/docs/Flow_Chart-Get_Me_Money.jpg" alt="screenshot of the app's flow chart"/>
</p>

### System Password
UserName: admin
password: pass

#### Instruction for use: 
NB: please open yml file when running the software to see changes in the data

1. Run the software

2. Enter your username and password. Both username and password must match the database to proceed further. You have 3 attempts to get your username and password to authenticate. (username: admin, password: pass)

3. Once you get username and password right, you are presented with a list of menu. Please enter number to make your selection. For example: Enter 2 to lookup an item

<p align="center">
  <img src="https://github.com/TheodoreChuang/ruby-pos/blob/master/docs/menu_options_screenshot.png" alt="screenshot of menu options"/>
</p>

#### Menu Options  

1. Adding an Item to the Database:
    1. Get the following information ready on a item you are about to enter
        - Item code
        - Cost Price Per Item ($)
        - Margin on the product ($)
        - Total quantity on hand
    2. Carefully key the information otherwise you have to modify items from Modify section 

    3. You will be asked to either you want to continue with adding more items or would like to go to the main menu. Make your selection 

2. Looking up an Item Details: 
You may want to look up detailed information on a single item. For example, you may want to view product price or items on hand etc
You can search an item by putting the item code

3. Creating a New Transaction:
    - Enter Item Code (first two letter - beer is be)
    - Enter quantities sold

4. Looking up a Transaction by TransactionID:
    - expected format will be: txnDD/MM/YYYYHH:MM

5. Listing All Items
    - lists all items from the database and their details

6. Listing All Transaction
    - lists all transactions with txnID, username, items sold


#### User Stories:
* As a employee, I want to be able to view the item database so that I can look up item information
* As a employee, I want to be able to create new transaction so that the business can track sales
* As a employee, I want to be able to view transaction history so that I can cross references any customer concerns
* As a employee, I want to be able to login into app so that I can interactive with the data files
* As a employee, I want to be able to create new transaction so that I can generate customer receipts
* As a employee, I want to be able to generate reports so that the business can track KPIs


#### App Structure:
* Main App - main.rb
* Additional Methods - login_helper.rb
* User Class - user_profiles.rb
* Item Class - items.rb
* Transaction Class - transaction.rb
* User Data - user_profile.yml
* Item Data - items.yml
* Transaction History Data - transaction.yml


#### Gems:
* Data Parsing: yaml
* Terminal: io/console
* Presentation: terminal-table


#### Testing:
* Manual Testing: lots of manual testing with 'puts' and '.inspect'


#### Collaboration Tools:
* In-person paired programming / Slack
* Github for version control (fork, branching, pulling, merging)
* Trello for planning


#### Project Planning and Timeline
* Day 0.1:
    * Brainstorm and App Proposal
    * High-level plan and architecture
* Day 1:
    * In-depth plan, architecture, data structures
    * Development
    * Continous Testing
* Day 2:
    * Morning/Afternoon:
        * Development
        * Continous Testing
    * Late Afternoon:
        * Docmentation
        * Flow Chart
        * Slide Deck
* Day 3:
    * Presentation


### Links:
* Source Files @ https://github.com/Santosh2167/ruby-pos
* Source Files @ https://github.com/TheodoreChuang/ruby-pos

* Full User Stories planning @ https://trello.com/b/CaJG38zd/get-me-the-money-pos-mvp

<p align="center">
  <img src="https://github.com/TheodoreChuang/ruby-pos/blob/master/docs/trello_user_stories_screenshot.png" alt="trello board used for planning"/>
</p>

###Fix me section
Presently when user processes the transaction, the system updates the inventory in hand from item table and data is up to date. But when updating the Item file, the system adds couple of cahracters at the end and the file gets busy. This needs to be fixed. This has been commented in the source code to make the system work.  

####System limitation 
We have not validated the data due to time constrain. For example user can enter alphabets in quantity field, system does not check for duplicate Item ID when recording the new item are two limitations 

### Future Features:

####  App Features:
* Better Error Handling
* One time, manually adding an item during a transaction
* Export Transaction History & Reports to other file types
* Email customer receipts
* Terminal to printer
* Encrypt/Decrypt data files

#### Manager User Features:
* Additional Writing (create, delete, update) Permission for:
    * User Profiles
    * Transaction History
    * Item Database
* Client Company Info for Menus-Write
