import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../services/database_service.dart';

/// **CategoriesProvider**
///
/// A provider class that manages the state of categories.
/// It interacts with the [DatabaseService] to fetch categories from the database
/// and notifies listeners about changes to the state.
class CategoriesProvider with ChangeNotifier {
  /// List of categories retrieved from the database.
  List<CategoryModel> _categories = [];
  /// Loading state - to indicate if the categories are being fetched.
  bool _isLoading = false;
  String? _errorMessage;

  final DatabaseService _databaseService = DatabaseService();

  // Getters for state
  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// **Fetch Categories**
  ///
  /// Fetches the list of categories from the database.
  ///
  /// - **What it does**:
  ///   - Sets [_isLoading] to `true` to show a loading state.
  ///   - Calls [_databaseService.fetchCategories()] to retrieve categories.
  ///   - Updates the [_categories] list with the retrieved data.
  ///   - If an error occurs, it sets [_errorMessage] with the error details.
  ///   - Whether successful or not, [_isLoading] is set to `false` at the end.
  ///
  /// - **Usage**: Call this method to load categories when the app starts or when refreshing data.
  ///
  /// - **Returns**: `Future<void>` as it is an asynchronous method./**/
  Future<void> fetchCategories() async {
    _isLoading = true;
    _errorMessage = null; // Reset error message
    notifyListeners();

    try {
      _categories = await _databaseService.fetchCategories();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
