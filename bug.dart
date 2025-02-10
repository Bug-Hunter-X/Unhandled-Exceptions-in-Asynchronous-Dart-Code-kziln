```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Successfully fetched data
      final jsonData = jsonDecode(response.body);
      // Process the jsonData
    } else {
      // Handle error
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions (e.g., network errors, JSON decoding errors)
    print('Error fetching data: $e');
    // Consider rethrowing the error or providing a default value
    rethrow; // or return a default value or handle it in a more user-friendly way
  }
}
```