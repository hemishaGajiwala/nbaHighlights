import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nba_highlights_app/models/category_model.dart';

/// **CategoryCard**
///
/// A reusable component for displaying a category's thumbnail and title.
/// Each card shows an image and the category's name, and it supports tap actions.
///
/// **Parameters:**
/// - `category`: The [CategoryModel] representing the category's details (image, name, etc.).
/// - `onTap`: A callback function to handle the tap event when the card is pressed.
class CategoryCard extends StatelessWidget {
  /// The category data to be displayed on the card (image, name, etc.).
  final CategoryModel category;

  /// Callback function to handle tap events on the card.
  final VoidCallback onTap;

  /// **Constructor**
  ///
  /// Creates a **CategoryCard** with the given [category] and [onTap] action.
  CategoryCard({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width for responsive design
    final screenHeight = MediaQuery.of(context).size.height; // Get screen height for responsive design

    return InkWell(
      onTap: onTap, // Call the onTap callback when the card is tapped
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Background color of the card
          borderRadius: BorderRadius.circular(screenWidth * 0.03), // Rounded corners based on screen width
          border: Border.all(
            color: Colors.grey, // Border color for the card
            width: 1.5, // Thickness of the border
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
              spreadRadius: 2, // How much the shadow spreads
              blurRadius: 6, // How blurry the shadow is
              offset: Offset(0, 3), // Vertical shadow shift (no horizontal shift)
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01, // Dynamic vertical padding
            horizontal: screenWidth * 0.01, // Dynamic horizontal padding
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the children in the column
            children: [
              /// **Image Section**
              ///
              /// Displays the category image using **CachedNetworkImage**.
              /// Shows a circular progress indicator while the image is loading.
              /// If the image fails to load, an error icon is displayed.
              CachedNetworkImage(
                imageUrl: category.imageUrl, // Image URL for the category
                height: screenHeight * 0.10, // Image height relative to screen height (10% of screen height)
                fit: BoxFit.contain, // The image will fit within the container
                placeholder: (context, url) => SizedBox(
                  height: screenHeight * 0.05, // Placeholder height
                  width: screenWidth * 0.1, // Placeholder width
                  child: CircularProgressIndicator(
                    strokeWidth: screenWidth * 0.005, // Dynamic width for the loading spinner
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  color: Colors.red,
                  Icons.error, // Error icon to display if image load fails
                  size: screenWidth * 0.1, // Dynamic size for the error icon
                ),
              ),

              /// **Space Between Image and Text**
              SizedBox(height: screenHeight * 0.01), // Space between image and category name text

              /// **Category Name**
              ///
              /// Displays the name of the category below the image.
              /// The text is centered, bold, and white in color.
              Text(
                category.name, // Display the category name
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}