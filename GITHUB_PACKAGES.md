# Using with GitHub Packages

This package is available through GitHub Packages. To use it in your Flutter project:

## 1. Add to pubspec.yaml

```yaml
dependencies:
  country_flags_world:
    git:
      url: https://github.com/creyt2012/country_flags_world.git
      ref: main
```

## 2. Or use specific version

```yaml
dependencies:
  country_flags_world:
    git:
      url: https://github.com/creyt2012/country_flags_world.git
      ref: v2.0.3
```

## 3. Run flutter pub get

```bash
flutter pub get
```

## 4. Import and use

```dart
import 'package:country_flags_world/country_flags.dart';

// Basic usage
CountryFlag(countryCode: 'us')

// With shapes
CountryFlag(countryCode: 'vn', shape: FlagShape.circle)

// With country name
CountryFlagWithName(countryCode: 'fr')
```

## Available Versions

- `v2.0.3` - Latest version with flag shapes and CountryFlagWithName widget
- `v2.0.2` - Previous version
- `main` - Development version

## Features

- 🚀 **8 Flag Shapes**: rectangle, circle, square, rounded, stadium, diamond, etc.
- 🌍 **249+ Countries**: Complete database of ISO alpha-2 country codes
- 📏 **Multiple Sizes**: 6 different flag sizes
- ✨ **Shimmer Loading**: Beautiful loading animations
- ✅ **Validation**: Built-in country code validation
- 🎨 **Customizable**: Size, fit, border radius, decoration, and more
- 🔄 **Auto Normalization**: Automatic country code normalization
- 🛡️ **Error Handling**: Comprehensive error handling with fallback widgets
- 📱 **Memory Optimized**: Efficient memory usage with cache optimization
- 🧪 **Well Tested**: Comprehensive unit tests for all features
