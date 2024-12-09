import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../models/category_model.dart';

/// **CategoryDetailsPage**
///
/// Displays detailed information for a selected category.
/// This page includes the category's image, title, description, and a text-to-speech (TTS) feature.
class CategoryDetailsPage extends StatefulWidget {
  final CategoryModel category;

  CategoryDetailsPage({required this.category});

  @override
  _CategoryDetailsPageState createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  final FlutterTts _flutterTts = FlutterTts(); // Text-to-Speech instance
  bool _isPlaying = false; // Track if text-to-speech is playing

  @override
  void initState() {
    super.initState();
    _flutterTts.setCompletionHandler(() {
      setState(() {
        _isPlaying = false; // Set _isPlaying to false when TTS is finished
      });
    });
  }

  @override
  void dispose() {
    _flutterTts.stop(); // Stop TTS when page is closed
    super.dispose();
  }

  /// **Toggle TTS**
  ///
  /// This method toggles the Text-to-Speech (TTS) feature.
  /// If TTS is playing, it stops. Otherwise, it starts speaking the category's text content.
  Future<void> _toggleTTS() async {
    if (_isPlaying) {
      await _flutterTts.stop();
      setState(() => _isPlaying = false);
    } else {
      await _flutterTts.speak(widget.category.textContent);
      setState(() => _isPlaying = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width for responsive design
    final screenHeight = MediaQuery.of(context).size.height; // Get screen height for responsive design

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true, // Display the back button
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back button to white
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: _toggleTTS, // Call the TTS toggle method when tapped
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Round button corners
                ),
                side: BorderSide(color: Colors.black, width: 1.5),
                backgroundColor: Colors.white, // Button background color
              ),
              child: Text(
                _isPlaying ? 'Stop' : 'Listen', // Toggle text between "Stop" and "Listen"
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04, // Padding on left and right (4% of screen width)
          vertical: screenHeight * 0.02, // Padding on top and bottom (2% of screen height)
        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start of the screen
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.03), // Rounded border for the image
                child: Image.network(
                  widget.category.imageUrl, // Image URL from the CategoryModel
                  height: screenHeight * 0.5, // 50% of the screen height
                  width: double.infinity, // Full width of the screen
                  fit: BoxFit.contain, // Contain the image within the available space
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.error, // Show error icon if image fails to load
                    size: screenWidth * 0.1, // Icon size set to 10% of screen width
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space between image and title
              Text(
                widget.category.name, // Display the category name
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.06, // Font size 6% of screen width
                  color: Colors.white,
                  fontFamily: "bazooka",
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space between title and content
              Text(
                widget.category.textContent, // Display the category text content
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.045, // Font size 4.5% of screen width
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space before bottom navigation bar
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          if (index == 0) {
            Navigator.popUntil(context, (route) => route.isFirst); // Return to the first page
          }
        },
        showSettings: false, // Hide settings button in bottom navigation bar
      ),
    );
  }
}