# NBA Highlights App

## **Overview**

The NBA Highlights App is a cross-platform mobile application designed to display the highlights of NBA. The app uses Firebase for data storage and retrieval and implements state management using Provider. It adheres to clean architecture principles, making it scalable and maintainable.

## **Features**

	•	Splash Screen: Displays the app logo.
	•	Landing Page: Shows a grid of categories fetched from Firebase.
	•	Category Details Page: Displays images, descriptions, and text-to-speech support for each category.
	•	About Us Page: Provides information about the NBA.
	•	Bottom Navigation Bar: Allows navigation between different sections of the app.

## **Project Structure**

* **models/**
  * **category_model.dart**: Represents the data for each category.
* **providers/**
  * **category_provider.dart**: Manages the state for categories.
* **services/**
  * **database_service.dart**: Handles interactions with Firebase Realtime Database.
* **UI/**
  * **pages**/: Contains the screens of the app:
    * **about_us.dart**: Displays information about the NBA.
    * **category_details_page.dart**: Shows detailed information for a selected category.
    * **landing_page.dart**: Displays a grid of categories.
    * **splash_screen.dart**: Initial splash screen displayed at startup.
  * **widgets**/: Contains reusable components:
    * **bottom_nav_bar.dart**: Custom bottom navigation bar for navigation.
    * **category_card.dart**: Displays category information.
* **firebase_options.dart**
  * Configures Firebase for different platforms.
* **main.dart**
  * The main entry point for the app. Initializes Firebase and starts the app.

## **Setup Process**

### 1. Prerequisites

Ensure you have the following installed:
* Flutter: Version 3.5.4 or higher
* Dart: Version compatible with Flutter 3.5.4
* Firebase CLI: For Firebase setup
* Android Studio or Xcode: For running the app on Android or iOS

### 2. Clone the Repository

`git clone <repository_url>
cd nba_highlights_app`

### 3. Install Dependencies
Run the following command to install the required dependencies:

`flutter pub get`

### 4. Firebase Setup

1. Go to Firebase Console([https://console.firebase.google.com/]) and create a new project.
2. Add Android and iOS apps to the project.
3. Download the google-services.json file (for Android) and GoogleService-Info.plist file (for iOS).
4. Place the files in the appropriate directories:
   5. android/app/google-services.json
   6. ios/Runner/GoogleService-Info.plist
7. Run the Firebase CLI to configure the project:
   8. `flutterfire configure`

### 5. Run the App

`flutter run`

## **Libraries Used**

### Core Dependencies

* flutter	[Latest] [Core framework for building the app]
* firebase_core	[^3.8.1]	[Initializes Firebase]
* firebase_database	[^11.2.0]	[Realtime database for category data]
* firebase_storage	[^12.3.7]	[Manages image assets in Firebase Storage]
* provider	[^6.0.5]	[State management for categories]
* cached_network_image	[^3.2.3]	[Efficiently loads and caches images]
* flutter_tts	[^4.2.0]	[Text-to-speech functionality]

### **Dev Dependencies**

* flutter_launcher_icons	[^0.14.2]	[Generates app icons for Android and iOS]
* flutter_test	[Latest]	[Used for writing unit and widget tests]

### **Gradle or JAVA Version**

* Gradle version	[8.3]
* Java version	[17]

### **Assets**

#### The following assets are used in the app:
* Logo for Splash Screen: assets/logo/applogo.png
* Home Screen Logo: assets/logo/homescreenlogo.png
* Custom Fonts:
  * MonaSans

## Key Features of the Codebase
1.	**State Management:**
	CategoriesProvider in providers/category_provider.dart is used for managing category data.
2.	**Firebase Integration:**
	Firebase Realtime Database is used for fetching and displaying category data.
	Firebase Storage is used for handling images.
3.	**Responsive Design:**
	All UI components use MediaQuery for responsive layouts.
4.	**Reusability:**
	Components like CategoryCard and BottomNavBar are reusable widgets.
5.	**Theming:**
	Custom gradients and fonts enhance the user experience.
