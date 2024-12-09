import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/category_provider.dart';
import './UI/pages/splash_screen.dart';
import 'firebase_options.dart';

/// **Main Entry Point**
///
/// This function initializes Firebase, sets up the app with a multi-provider,
/// and calls the **runApp()** method to start the application.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures that all bindings are initialized before the app starts

  // **Initialize Firebase** with platform-specific options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Platform-specific Firebase config
  );

  // **Run the Application**
  runApp(
    MultiProvider(
      providers: [
        // **Provider for Categories** to manage state using ChangeNotifier
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
      ],
      child: MyApp(), // Call the root widget of the app
    ),
  );
}

/// **MyApp**
///
/// This is the root widget of the NBA Highlights App.
/// It sets up the MaterialApp with a **SplashScreen** as the initial screen.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner from the app
      title: 'NBA Highlights',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter, // Gradient starts from the top
              end: Alignment.bottomCenter, // Gradient ends at the bottom
              colors: [
                Color(0xFF0A0A0A),
                Color(0xFF0A0A0A), // Bottom color (Same Dark Blue for consistent gradient)
              ],
            ),
          ),
          child: SplashScreen(), // Initial screen displayed at app start
        ),
      ),
    );
  }
}