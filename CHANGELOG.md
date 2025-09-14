# Changelog
## [2.0.2] - 2025-09-12

### Changed
- Bump version to 2.0.2
- Documentation: correct dependency snippet to ^2.0.2

### Added
- README: add SVG usage example (`useSvg: true`)

## [2.0.1] - 2025-09-12

### Added
- SVG support via `useSvg` in `CountryFlag`
- `CountryHelper.getFlagSvgUrl` and `getAllFlagUrls` includes `svg`
- Unified entry file `lib/country_flags.dart`

### Changed
- README updated to correct package name and imports
- Bumped dependencies: add `flutter_svg`


All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-01-27

### Added
- **Cached Network Images**: Added `cached_network_image` dependency for better performance and offline support
- **CountryHelper Class**: New utility class for country code validation, normalization, and country name lookup
- **FlagSize Enum**: Type-safe enum for different flag sizes (w20, w40, w80, w160, w320, w640)
- **ShimmerWidget**: Beautiful shimmer loading animation for better UX
- **Country Code Validation**: Built-in validation for ISO alpha-2 country codes with customizable error messages
- **Multiple Flag Sizes**: Support for 6 different flag sizes from flagcdn.com
- **Enhanced Error Handling**: Better error messages and customizable fallback widgets
- **Memory Optimization**: Added memory cache width/height for better performance
- **New Constructor Methods**: Added `CountryFlag.extraLarge()` constructor
- **Comprehensive Country Database**: Complete mapping of 249+ countries with names and codes

### Changed
- **Breaking**: Updated predefined sizes to match flagcdn.com standards:
  - `CountryFlag.small()`: 20x13 (was 80x60)
  - `CountryFlag.medium()`: 40x27 (was 120x90) 
  - `CountryFlag.large()`: 80x53 (was 160x120)
  - `CountryFlag.extraLarge()`: 160x107 (new)
- **Breaking**: Updated minimum Flutter version to 3.24.0 and Dart SDK to 3.5.0
- **Breaking**: Replaced `Image.network` with `CachedNetworkImage` for better performance
- **Enhanced**: Improved loading states with shimmer effects
- **Enhanced**: Better error handling with detailed error messages

### New Parameters
- `flagSize`: Specify exact flag size from flagcdn.com
- `showShimmer`: Enable/disable shimmer loading animation
- `shimmerColor`: Customize shimmer effect color
- `validateCountryCode`: Enable/disable country code validation
- `invalidCountryCodeMessage`: Custom error message for invalid codes

### Dependencies
- Updated `http` to ^1.2.0
- Added `cached_network_image` ^3.3.1
- Updated `flutter_lints` to ^4.0.0
- Added `mockito` ^5.4.4 for testing

### Testing
- Added comprehensive unit tests for all new features
- Added tests for CountryHelper utility class
- Added tests for FlagSize enum
- Enhanced existing widget tests

## [1.0.0] - 2025-01-27

### Added
- Initial release of country_flags package
- `CountryFlag` widget for displaying country flags
- Support for ISO alpha-2 country codes
- Automatic country code normalization (uppercase to lowercase)
- Customizable size, fit, border radius, and decoration
- Predefined sizes: small (80x60), medium (120x90), large (160x120)
- Loading indicators and error handling
- Custom placeholder and fallback widgets
- Network image loading from flagcdn.com
- Comprehensive documentation and examples
- Unit tests for all features 