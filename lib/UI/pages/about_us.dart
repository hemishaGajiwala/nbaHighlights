import 'package:flutter/material.dart';
import 'package:nba_highlights_app/UI/widgets/bottom_nav_bar.dart';

/// **AboutUsPage**
///
/// This page displays the "About Us" information for the NBA Highlights App.
/// It includes a descriptive message, a brief history, and a thank-you message for users.
class AboutUsPage extends StatelessWidget {

  /// **Build Method**
  ///
  /// Builds the UI for the About Us page.
  /// This page consists of an **AppBar**, a **body** containing text about the NBA,
  /// and a **Bottom Navigation Bar** for user navigation.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // for page background
      appBar: AppBar(
        automaticallyImplyLeading: true, // show the back button
        iconTheme: IconThemeData( // Change the color of the back arrow
          color: Colors.white, // Back arrow color set to white
        ),
        backgroundColor: Colors.black, // Set background color of AppBar
        title: Text(
          'About US',
          style: TextStyle(
            fontFamily: 'MonaSans', // Custom font for title
            fontSize: 32, // Font size for title
            fontWeight: FontWeight.bold, // Font weight
            color: Colors.white, // Title color
          ),
        ),
        centerTitle: true, // Center the title in the AppBar
      ),
      body: Container(
        color: Colors.black, // Set background color of the body
        padding: EdgeInsets.all(16.0), // Add padding around (16px) the content
        child: SingleChildScrollView( // Scrolls the content if it overflows the screen
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns child widgets to the start (left)
            children: [
              Text(
                'Welcome to National Basketball Association! ',
                style: TextStyle(
                  fontSize: 22, // Title font size
                  fontWeight: FontWeight.bold,
                  fontFamily: 'bazooka',
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0), // Space between title and body text
              Text(
                '\n\n\nWelcome back to the Greatest Ever series as we rank the most interesting moments of NBA history.\n\n'
                    'History is written by winners and by people who leave a strong mark on something, whether good or bad.\n\n'
                    'The NBA is filled with the most talented players playing in the strongest league in the basketball world.\n\n'
                    'Over the past 10 years, there have been some basketball moments that, regardless of whether you\'re a fan of that particular team or player, '
                    'make you feel good to just be a fan of this global game.\n\n'
                    'These are the moments that make players legends and stay in your memory forever.\n\n\n',
                style: TextStyle(
                  fontSize: 18, // Font size for body text
                  color: Colors.white, // Text color
                  fontFamily: 'bazooka',
                  height: 1.5, // Line height for better readability
                ),
                textAlign: TextAlign.justify, // Justify the text
              ),
              SizedBox(height: 20.0), // Add space before footer
              Text(
                'Thank you for being a part of our journey! 🏀',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'bazooka',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          if (index == 0) {
            // If the first tab is pressed, navigate back to the first page in the navigation stack
            Navigator.popUntil(context, (route) => route.isFirst);
          }
        },
        showSettings: false, // Hide the settings button from the bottom navigation bar
      ),
    );
  }

}