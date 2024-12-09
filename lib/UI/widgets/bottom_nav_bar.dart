import 'package:flutter/material.dart';

/// **BottomNavBar**
///
/// A custom bottom navigation bar widget that allows users to switch between pages.
/// This widget includes navigation buttons for **Home** and, optionally, an **Info** button.
///
/// **Parameters:**
/// - `showSettings`: A boolean to control the visibility of the **Info** button. Defaults to `true`.
/// - `onTap`: A callback function to handle tap events for navigation actions.
class BottomNavBar extends StatelessWidget {
  /// **Whether to show the settings/info button in the navigation bar.**
  final bool showSettings;

  /// **Callback function triggered when a navigation icon is tapped.**
  ///
  /// The callback provides the index of the tab that was tapped.
  final Function(int) onTap;

  /// **Constructor**
  ///
  /// Accepts parameters to control the visibility of the **Info** button and
  /// provides a callback to handle navigation taps.
  BottomNavBar({this.showSettings = true, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(50, 50, 50, 145), // Background color with transparency
      padding: EdgeInsets.only(top: 10, bottom: 10), // Padding at the top and bottom of the navigation bar

      child: Row(
        // Aligns the navigation buttons (Home, Info) evenly if both are present
        // If the **Info** button is hidden, align buttons to the center
        mainAxisAlignment: showSettings
            ? MainAxisAlignment.spaceEvenly // Distribute items evenly across the row
            : MainAxisAlignment.center, // Center the Home button if Info is hidden
        children: [
          /// **Home Button**
          ///
          /// Tapping this button triggers the `onTap` callback with an index of **0**.
          IconButton(
            icon: Icon(
              Icons.home, // Home icon
              size: 32, // Icon size
              color: Colors.white, // White color for the icon
            ),
            onPressed: () => onTap(0), // Call the onTap callback with index 0 for Home
          ),

          // **Info Button**
          // This button is only displayed if `showSettings` is true.
          if (showSettings)
            IconButton(
              icon: Icon(
                Icons.info_outlined, // Info icon
                size: 32, // Icon size
                color: Colors.white, // White color for the icon
              ),
              onPressed: () => onTap(1), // Call the onTap callback with index 1 for Info
            ),
        ],
      ),
    );
  }
}