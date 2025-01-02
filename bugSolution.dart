```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      print('Resource not found');
      return null; // Or throw an exception, depending on your needs
    } else if (response.statusCode == 500) {
      print('Server error');
      return null; // Or throw an exception, depending on your needs
      //Consider retry logic here
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('An unexpected error occurred: $e');
    //In a production app, you may want to display a user-friendly message here
    //and potentially implement retry mechanisms or fallbacks.
    return null;
  }
}
```