import 'dart:io';
import 'package:http/http.dart' as http;

void main() async {
  print('Checking available countries from flagcdn.com...\n');
  
  // Danh sách các quốc gia phổ biến để test
  final List<String> commonCountries = [
    'us', 'vn', 'fr', 'de', 'jp', 'gb', 'ca', 'au', 'br', 'in',
    'cn', 'ru', 'kr', 'it', 'es', 'mx', 'nl', 'se', 'ch', 'no',
    'dk', 'fi', 'pl', 'cz', 'hu', 'at', 'be', 'pt', 'gr', 'ie',
    'nz', 'za', 'ar', 'cl', 'pe', 'co', 've', 'ec', 'uy', 'py',
    'bo', 'pe', 'ec', 'uy', 'py', 'bo', 'pe', 'ec', 'uy', 'py'
  ];
  
  int availableCount = 0;
  int totalCount = commonCountries.length;
  
  print('Testing $totalCount common countries...\n');
  
  for (String countryCode in commonCountries) {
    try {
      final response = await http.get(
        Uri.parse('https://flagcdn.com/w80/$countryCode.png'),
        headers: {'User-Agent': 'Dart/2.0'},
      );
      
      if (response.statusCode == 200) {
        print('✅ $countryCode - Available');
        availableCount++;
      } else {
        print('❌ $countryCode - Not found (${response.statusCode})');
      }
    } catch (e) {
      print('❌ $countryCode - Error: $e');
    }
    
    // Delay để tránh spam server
    await Future.delayed(Duration(milliseconds: 100));
  }
  
  print('\n📊 Results:');
  print('Available countries: $availableCount/$totalCount');
  print('Success rate: ${(availableCount / totalCount * 100).toStringAsFixed(1)}%');
  
  print('\n🌍 Common country codes that work:');
  final List<String> workingCountries = [
    'us', 'vn', 'fr', 'de', 'jp', 'gb', 'ca', 'au', 'br', 'in',
    'cn', 'ru', 'kr', 'it', 'es', 'mx', 'nl', 'se', 'ch', 'no',
    'dk', 'fi', 'pl', 'cz', 'hu', 'at', 'be', 'pt', 'gr', 'ie',
    'nz', 'za', 'ar', 'cl', 'pe', 'co', 've', 'ec', 'uy', 'py'
  ];
  
  for (String country in workingCountries) {
    stdout.write('$country ');
  }
  
  print('\n\n💡 Note: flagcdn.com supports ISO alpha-2 country codes.');
  print('   You can find the complete list at: https://flagcdn.com/');
} 