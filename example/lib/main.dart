import 'package:flutter/material.dart';
import 'package:country_flags_world/country_flags.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Flags Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Flags Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Flags (New Sizes):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                CountryFlag.small(countryCode: 'us'),
                CountryFlag.medium(countryCode: 'vn'),
                CountryFlag.large(countryCode: 'fr'),
                CountryFlag.extraLarge(countryCode: 'de'),
                CountryFlag.small(countryCode: 'jp'),
                CountryFlag.medium(countryCode: 'gb'),
                CountryFlag.large(countryCode: 'ca'),
                CountryFlag.extraLarge(countryCode: 'au'),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Different Sizes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CountryFlag.small(countryCode: 'jp'),
                const SizedBox(width: 16),
                CountryFlag.medium(countryCode: 'jp'),
                const SizedBox(width: 16),
                CountryFlag.large(countryCode: 'jp'),
                const SizedBox(width: 16),
                CountryFlag.extraLarge(countryCode: 'jp'),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Custom Sizes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                CountryFlag(
                  countryCode: 'it',
                  width: 100,
                  height: 60,
                ),
                CountryFlag(
                  countryCode: 'es',
                  width: 120,
                  height: 80,
                ),
                CountryFlag(
                  countryCode: 'br',
                  width: 140,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Custom Styling:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                CountryFlag(
                  countryCode: 'it',
                  width: 120,
                  height: 80,
                  borderRadius: BorderRadius.circular(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                CountryFlag(
                  countryCode: 'es',
                  width: 120,
                  height: 80,
                  borderRadius: BorderRadius.circular(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                ),
                CountryFlag(
                  countryCode: 'br',
                  width: 120,
                  height: 80,
                  borderRadius: BorderRadius.circular(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange, Colors.yellow],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(color: Colors.orange, width: 3),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Different BoxFit:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                Column(
                  children: [
                    const Text('Cover'),
                    const SizedBox(height: 8),
                    CountryFlag(
                      countryCode: 'us',
                      width: 80,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Contain'),
                    const SizedBox(height: 8),
                    CountryFlag(
                      countryCode: 'us',
                      width: 80,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Fill'),
                    const SizedBox(height: 8),
                    CountryFlag(
                      countryCode: 'us',
                      width: 80,
                      height: 40,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Custom Loading States:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                CountryFlag(
                  countryCode: 'de',
                  width: 80,
                  height: 60,
                  placeholder: Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                CountryFlag(
                  countryCode: 'invalid',
                  width: 80,
                  height: 60,
                  fallback: Container(
                    color: Colors.red[100],
                    child: const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                ),
                CountryFlag(
                  countryCode: 'fr',
                  width: 80,
                  height: 60,
                  showLoadingIndicator: false,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'New Features Demo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                // Shimmer effect
                CountryFlag(
                  countryCode: 'de',
                  width: 80,
                  height: 53,
                  showShimmer: true,
                  shimmerColor: Colors.blue,
                ),
                // Custom flag size
                CountryFlag(
                  countryCode: 'fr',
                  flagSize: FlagSize.huge,
                  width: 80,
                  height: 53,
                ),
                // Validation disabled
                CountryFlag(
                  countryCode: 'invalid',
                  width: 80,
                  height: 53,
                  validateCountryCode: false,
                ),
                // Custom error message
                CountryFlag(
                  countryCode: 'invalid2',
                  width: 80,
                  height: 53,
                  invalidCountryCodeMessage: 'Not found',
                ),
                // SVG rendering (sharp at any size)
                CountryFlag(
                  countryCode: 'us',
                  width: 80,
                  height: 53,
                  useSvg: true,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Case Insensitive:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                CountryFlag.small(countryCode: 'US'),
                CountryFlag.small(countryCode: 'us'),
                CountryFlag.small(countryCode: 'VN'),
                CountryFlag.small(countryCode: 'vn'),
                CountryFlag.small(countryCode: 'FR'),
                CountryFlag.small(countryCode: 'fr'),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 