# Country Flags Widget

A powerful Flutter package for displaying country flags using images from flagcdn.com with advanced features and optimizations.

## Features

- 🚀 **Cached Network Images**: Better performance with offline support
- 🌍 **249+ Countries**: Complete database of ISO alpha-2 country codes
- 📏 **Multiple Sizes**: 6 different flag sizes (w20, w40, w80, w160, w320, w640)
- ✨ **Shimmer Loading**: Beautiful loading animations
- ✅ **Validation**: Built-in country code validation with custom error messages
- 🎨 **Customizable**: Size, fit, border radius, decoration, and more
- 🔄 **Auto Normalization**: Automatic country code normalization (uppercase to lowercase)
- 🛡️ **Error Handling**: Comprehensive error handling with fallback widgets
- 📱 **Memory Optimized**: Efficient memory usage with cache optimization
- 🧪 **Well Tested**: Comprehensive unit tests for all features

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  country_flags_world: ^2.0.2
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Usage

```dart
import 'package:country_flags_world/country_flags.dart';

CountryFlag(
  countryCode: 'us',
)

CountryFlag(
  countryCode: 'vn',
  width: 100,
  height: 75,
)
```

### Predefined Sizes

```dart
CountryFlag.small(countryCode: 'us')        // 20x13
CountryFlag.medium(countryCode: 'vn')       // 40x27
CountryFlag.large(countryCode: 'fr')        // 80x53
CountryFlag.extraLarge(countryCode: 'de')   // 160x107
```

### Custom Flag Sizes

```dart
CountryFlag(
  countryCode: 'jp',
  flagSize: FlagSize.huge,  // 320x213
  width: 100,
  height: 67,
)
```

### Advanced Customization

```dart
CountryFlag(
  countryCode: 'jp',
  width: 150,
  height: 100,
  fit: BoxFit.cover,
  borderRadius: BorderRadius.circular(8),
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
)
```

### Custom Loading and Error States

```dart
CountryFlag(
  countryCode: 'de',
  placeholder: Container(
    color: Colors.grey[200],
    child: const Center(
      child: CircularProgressIndicator(),
    ),
  ),
  fallback: Container(
    color: Colors.grey[300],
    child: const Center(
      child: Icon(Icons.flag, color: Colors.grey),
    ),
  ),
)
```

### Disable Loading Indicator

```dart
CountryFlag(
  countryCode: 'it',
  showLoadingIndicator: false,
)
```

### Custom Loading Indicator Color

```dart
CountryFlag(
  countryCode: 'es',
  loadingIndicatorColor: Colors.blue,
)
```

### Shimmer Loading Effect

```dart
CountryFlag(
  countryCode: 'it',
  showShimmer: true,
  shimmerColor: Colors.blue,
)
```

### Country Code Validation

```dart
// Default validation (shows error for invalid codes)
CountryFlag(countryCode: 'invalid')

// Disable validation
CountryFlag(
  countryCode: 'invalid',
  validateCountryCode: false,
)

// Custom error message
CountryFlag(
  countryCode: 'invalid',
  invalidCountryCodeMessage: 'Country not found',
)
```

### Using CountryHelper

```dart
import 'package:country_flags_world/country_flags.dart';

// Validate country code
bool isValid = CountryHelper.isValidCountryCode('us'); // true

// Get country name
String? name = CountryHelper.getCountryName('vn'); // 'Vietnam'

// Get flag URL
String url = CountryHelper.getFlagUrl('fr', size: 'w160');

// Get all available flag sizes
List<String> sizes = CountryHelper.availableFlagSizes;
```

### SVG Support (mới)

```dart
CountryFlag(
  countryCode: 'us',
  useSvg: true, // dùng SVG để hiển thị sắc nét ở mọi kích thước
)
```

## Country Codes

The package uses ISO alpha-2 country codes. Here are some examples:

- `us` - United States
- `vn` - Vietnam
- `fr` - France
- `de` - Germany
- `jp` - Japan
- `gb` - United Kingdom
- `ca` - Canada
- `au` - Australia
- `br` - Brazil
- `in` - India

**Note**: Country codes are automatically converted to lowercase, so both `'US'` and `'us'` will work.

## API Reference

### CountryFlag

A widget that displays a country flag using images from flagcdn.com.

#### Constructors

- `CountryFlag()` - Creates a country flag with custom parameters
- `CountryFlag.small()` - Creates a small flag (20x13)
- `CountryFlag.medium()` - Creates a medium flag (40x27)
- `CountryFlag.large()` - Creates a large flag (80x53)
- `CountryFlag.extraLarge()` - Creates an extra large flag (160x107)

#### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `countryCode` | `String` | required | ISO alpha-2 country code |
| `width` | `double?` | null | Width of the flag |
| `height` | `double?` | null | Height of the flag |
| `flagSize` | `FlagSize?` | null | Flag size from flagcdn.com |
| `fit` | `BoxFit?` | `BoxFit.cover` | How to fit the image |
| `borderRadius` | `BorderRadius?` | null | Border radius of the flag |
| `decoration` | `BoxDecoration?` | null | Decoration for the container |
| `placeholder` | `Widget?` | null | Widget to show while loading |
| `fallback` | `Widget?` | null | Widget to show on error |
| `showLoadingIndicator` | `bool` | `true` | Whether to show loading indicator |
| `loadingIndicatorColor` | `Color?` | null | Color of loading indicator |
| `showShimmer` | `bool` | `true` | Whether to show shimmer effect |
| `shimmerColor` | `Color?` | null | Color of shimmer effect |
| `validateCountryCode` | `bool` | `true` | Whether to validate country code |
| `invalidCountryCodeMessage` | `String?` | null | Custom error message for invalid codes |

### CountryHelper

A utility class for country code validation and country information.

#### Methods

| Method | Return Type | Description |
|--------|-------------|-------------|
| `isValidCountryCode(String code)` | `bool` | Validates if country code is valid |
| `normalizeCountryCode(String code)` | `String` | Normalizes country code to lowercase |
| `getCountryName(String code)` | `String?` | Gets country name from code |
| `getFlagUrl(String code, {String size})` | `String` | Gets flag URL for country code |
| `getAllFlagUrls(String code)` | `Map<String, String>` | Gets all flag URLs for country |

#### Properties

| Property | Type | Description |
|----------|------|-------------|
| `allCountryCodes` | `Set<String>` | All valid country codes |
| `allCountryNames` | `Map<String, String>` | All country names |
| `availableFlagSizes` | `List<String>` | Available flag sizes |

### FlagSize

Enum for flag sizes available from flagcdn.com.

#### Values

| Value | Size | Width | Height |
|-------|------|-------|--------|
| `FlagSize.small` | w20 | 20px | 13px |
| `FlagSize.medium` | w40 | 40px | 27px |
| `FlagSize.large` | w80 | 80px | 53px |
| `FlagSize.extraLarge` | w160 | 160px | 107px |
| `FlagSize.huge` | w320 | 320px | 213px |
| `FlagSize.extraHuge` | w640 | 640px | 427px |

## Example App

Here's a complete example showing different ways to use the package:

```dart
import 'package:flutter/material.dart';
import 'package:country_flags_widget/country_flags.dart';

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Flags:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CountryFlag.small(countryCode: 'us'),
                const SizedBox(width: 16),
                CountryFlag.small(countryCode: 'vn'),
                const SizedBox(width: 16),
                CountryFlag.small(countryCode: 'fr'),
                const SizedBox(width: 16),
                CountryFlag.small(countryCode: 'de'),
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
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Custom Styling:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
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
          ],
        ),
      ),
    );
  }
}
```

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

- Website: https://algonest.io.vn

**Copyright**: Perpetual, unlimited use granted 

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Issues

If you find any issues or have feature requests, please create an issue. 