import 'package:firebase_database/firebase_database.dart';
import '../models/category_model.dart';

/// **DatabaseService**
///
/// This service is responsible for all interactions with the **Firebase Realtime Database**.
/// It provides methods to read and fetch data from the **categories** node.
class DatabaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  /// **Fetch Categories**
  ///
  /// Retrieves a list of categories from the **Firebase Realtime Database**.
  ///
  /// - **How it works**:
  ///   - It accesses the `categories` node from the database.
  ///   - If the snapshot exists, it converts the data into a list of [CategoryModel] objects.
  ///   - If no data exists, it throws an exception with a message.
  ///   - If an error occurs, it catches the exception, logs the error, and rethrows it.
  ///
  /// - **Returns**: A `Future<List<CategoryModel>>` that resolves to a list of categories.
  ///
  /// - **Usage**: Call this method to get the list of categories and update the UI accordingly.
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final snapshot = await _dbRef.child('categories').get();
      if (snapshot.exists) {
        final Map<dynamic, dynamic> categoriesMap =
        snapshot.value as Map<dynamic, dynamic>;
        return categoriesMap.entries.map((entry) {
          return CategoryModel.fromMap(entry.key, entry.value);
        }).toList();
      } else {
        throw Exception("No categories found in the database.");
      }
    } catch (e) {
      // Log and rethrow the error for the provider to handle
      print("Error fetching categories: $e");
      throw Exception("Failed to load categories. Please try again later.");
    }
  }
}