# 🚀 Login System using Swift and Firebase

This is a login system built using Swift and Firebase to fulfill duties in the recruitment process as an iOS Developer at FAN IT. This system includes user registration, login, forgotten password and email verification features. In addition, the main page displays a list of registered users, displays their email verification status, logged in user profiles. there is a feature to search using name and email, then there is a filter feature based on email verification.


### 🌟 MAIN FITUR
**1. USER REGISTRATION:**
  * Users can create a new account by providing their full name, email address, and password.

**2. EMAIL VERIFICATION:**
  * After registration, the system will send a verification email to the user. Users must verify their email address before they can log in.

**3. LOGIN:**
  * Users who have registered and verified can log in with their email address and password.

**4. FORGOT PASSWORD:**
  * Users can reset their password if they forget it by sending a password reset email.
  
     https://github.com/aliffarisqi/learn-swift-ui-1/assets/48192376/01e9d456-45ac-4fc8-905a-ab326220eb79

**5. USER LIST:**
  * The main page displays their accounts and a list of registered users, displaying their email verification status.

**6. SEARCHING USERS:**
  * This feature can be used to search for registered users via full name and email.

**7. USER FILTERS:**
  *This feature can be used to filter the list of users according to their email verification status.

**8. USER SIGN OUT:**
 * This feature can be used to signout from the aplication
   
    https://github.com/aliffarisqi/learn-swift-ui-1/assets/48192376/10f4735d-4daf-47e4-8d19-7b8ebb1ec6fa




### 🛠️ INSTALATION

1. To running this project in the xcode, ensure that you have at least
the following software:
* Xcode 15.2 (or later).
2. Clone this repository to your Xcode project.
3. After you have finished cloning this repository, enter Xcode and wait a few moments until the Firebase SDK installation process is complete
4. To run this application on the simulator, make sure your simulator has at least iOS 16.0. run the simulator and the application is ready to use

### 📲 USSAGE

**1. User Registration**
 * To register a new user, you can use the registration form and enter your full name, email address and password and confirm the password, the minimum password is 6 characters. After completing the form, the system will send a verification email to the email address provided.


   ![Group 2 (2)](https://github.com/aliffarisqi/swift-basic/assets/48192376/65546b27-8335-4bed-8c59-3ccc1cfc4e8d)

**2. Email Verification**
 * After registration, you must verify their email address before you can log in, otherwise you will not be able to log in. The system will send a verification email containing a link to verify the email address. Click the link provided and wait until a web page appears stating successful verification

   
   ![Group 3 (2)](https://github.com/aliffarisqi/swift-basic/assets/48192376/de139ead-a199-41da-ab47-5cc6b53027a3)

**3. Login**
 * After registering and verifying their email, registered users can log in using their email address and password. The system will check the credential match and allow access if the data is correct. jika password atau email salah maka sistem akan menampilkan warning
   
   ![Group 7 (1)](https://github.com/aliffarisqi/swift-basic/assets/48192376/ebb82b01-2fc1-432c-a24f-a09572b171ee)

**4. Forgot Password**
 * If a user forgets their password, you can use the "Forgot Password" option to reset their password. The system will send a password reset email to the user's email address. To reset the password, click the link provided and a form will appear to enter a new password, type the new password and save, wait until a notification appears that the password has been successfully updated
   
   ![Group 4 (2)](https://github.com/aliffarisqi/swift-basic/assets/48192376/05ba89a7-a208-4067-ad69-c6ebda639101)

**5.Home Page**
 * On this page there are 2 sections, the first is a section that provides information about your account, or the account that is currently logged in 

   * a. Profile image created from the initials of the full name

   * b. User's full name

   * c. User email

   * d. Email verification status

   * e. SignOut button

 * then the second section is the section which contains information on all the lists of users registered in the system, the cards in this section display some of the data there is a profile image created from the initials of the full name.
   
   * a. user's full name

   * c. user email

   * d. email verification status
  
   * ![Group 10](https://github.com/aliffarisqi/swift-basic/assets/48192376/cae59d47-9957-4e58-8cb1-c9cbdcb86c92)

**6. Searching images**
 * There is a search form that can be used to search a list of users, this search can use full names or email.
   
   ![Group 6 (4)](https://github.com/aliffarisqi/swift-basic/assets/48192376/72794a85-e328-4dcb-876b-275ffd117bdc)

**7. Filter**
 * in the second section, there is a filter with a tab view segmentation style, this tab will automatically filter according to the user's email verification status, there are 3 options, namely all users, users who have verified, and users who have not verified

   
   ![Group 9](https://github.com/aliffarisqi/swift-basic/assets/48192376/f46ebd84-b4e2-4b3d-8e2e-5a31edf5e1c8)

**8. Sign Out**
 * On the first home section page there is a button to sign out, click the button to sign out
