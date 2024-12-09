import 'package:flutter/material.dart';
import 'package:nba_highlights_app/UI/pages/about_us.dart';
import 'package:nba_highlights_app/UI/pages/category_details_page.dart';
import 'package:provider/provider.dart';
import '../../providers/category_provider.dart';
import '../widgets/category_card.dart';
import '../widgets/bottom_nav_bar.dart';

/// **LandingPage**
///
/// The main landing page of the NBA Highlights App.
/// Displays a grid of categories fetched from the Firebase database.
/// Provides navigation to the **About Us** page and **Category Details** page.
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    // **Fetch categories after the first frame is rendered**
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<CategoriesProvider>(context, listen: false);
      provider.fetchCategories(); // Call to fetch categories from Firebase
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoriesProvider>(context); // Access provider for category data

    return Scaffold(
      backgroundColor: Colors.black, // Sets the background color for the entire page
      appBar: AppBar(
        backgroundColor: Colors.black, // Sets background color of the app bar
        title: Column(
          children: [
            Image.asset(
              'assets/logo/homescreenlogo.png', // Logo for the home screen
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.06, // Set logo height relative to screen height
              width: MediaQuery.of(context).size.width * 0.4, // Set logo width relative to screen width
            ),
            SizedBox(height: 10), // Space below the logo
          ],
        ),
        centerTitle: true, // Centers the title (logo) in the AppBar
      ),

      /// **Main Body of the Page**
      body: SafeArea(
        child: categoryProvider.isLoading
            ? Center(child: CircularProgressIndicator()) // Show loading indicator while data is being fetched
            : categoryProvider.errorMessage != null
            ? SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.8, // Fill screen with content
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1, // Padding on both sides
                      ),
                      child: Text(
                        "Oops! Something went wrong..", // Error message text
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MonaSans',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Space below the error text
                    ElevatedButton(
                      onPressed: () {
                        categoryProvider.fetchCategories(); // Retry fetching categories
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded button
                        ),
                      ),
                      child: Text(
                        "Retry", // Retry button text
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05, // Font size relative to screen width
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MonaSans',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
            : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05, // Responsive horizontal padding
            ),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.01), // Vertical spacing
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two columns in the grid
                    crossAxisSpacing: 16.0, // Spacing between columns
                    mainAxisSpacing: 16.0, // Spacing between rows
                  ),
                  shrinkWrap: true, // Allows GridView to fit its contents
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling for GridView
                  itemCount: categoryProvider.categories.length, // Number of categories
                  itemBuilder: (context, index) {
                    final category = categoryProvider.categories[index]; // Current category
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01, // Space above and below the card
                      ),
                      child: CategoryCard(
                        category: category,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryDetailsPage(category: category), // Navigate to category details
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      /// **Bottom Navigation Bar**
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          if (index == 0) {
            // Home tab is active, no action needed
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUsPage()), // Navigate to About Us page
            );
          }
        },
      ),
    );
  }
}