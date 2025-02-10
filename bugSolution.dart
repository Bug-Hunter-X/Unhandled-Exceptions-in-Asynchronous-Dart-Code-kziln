```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      print('Error fetching data. Status code: ${response.statusCode}');
      // Return null or a default value
      return null; // or return a default Map<String, dynamic> {}
    } 
  } on http.ClientException catch (e) {
    print('Network error: $e');
    return null; // or handle the network error appropriately
  } on FormatException catch (e) {
    print('JSON decoding error: $e');
    return null; // or handle the JSON decoding error
  } catch (e) {
    print('An unexpected error occurred: $e');
    return null;
  }
}
```