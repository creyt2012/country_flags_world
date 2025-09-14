import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'country_helper.dart';
import 'flag_size.dart';
import 'shimmer_widget.dart';

/// A widget that displays a country flag using images from flagcdn.com
/// 
/// This widget automatically loads country flags from the flagcdn.com service
/// using ISO alpha-2 country codes (e.g., "us", "vn", "fr").
/// 
/// Features:
/// - Cached network images for better performance
/// - Multiple flag sizes support
/// - Country code validation
/// - Shimmer loading animation
/// - Customizable error handling
class CountryFlag extends StatelessWidget {
  /// The ISO alpha-2 country code (e.g., "us", "vn", "fr")
  final String countryCode;
  
  /// The width of the flag
  final double? width;
  
  /// The height of the flag
  final double? height;
  
  /// The flag size from flagcdn.com
  final FlagSize? flagSize;
  
  /// How to inscribe the image into the space
  final BoxFit? fit;
  
  /// The border radius of the flag
  final BorderRadius? borderRadius;
  
  /// The decoration to apply to the flag container
  final BoxDecoration? decoration;
  
  /// Widget to show while the image is loading
  final Widget? placeholder;
  
  /// Widget to show if the image fails to load
  final Widget? fallback;
  
  /// Whether to show a loading indicator while the image is loading
  final bool showLoadingIndicator;
  
  /// The color of the loading indicator
  final Color? loadingIndicatorColor;
  
  /// Whether to show shimmer effect while loading
  final bool showShimmer;
  
  /// The color of the shimmer effect
  final Color? shimmerColor;
  
  /// Whether to validate country code
  final bool validateCountryCode;
  
  /// Custom error message for invalid country code
  final String? invalidCountryCodeMessage;

  /// Whether to use SVG format (sharp at any size). If false, uses PNG.
  final bool useSvg;

  const CountryFlag({
    super.key,
    required this.countryCode,
    this.width,
    this.height,
    this.flagSize,
    this.fit,
    this.borderRadius,
    this.decoration,
    this.placeholder,
    this.fallback,
    this.showLoadingIndicator = true,
    this.loadingIndicatorColor,
    this.showShimmer = true,
    this.shimmerColor,
    this.validateCountryCode = true,
    this.invalidCountryCodeMessage,
    this.useSvg = false,
  });

  /// Creates a CountryFlag with small size (20x13)
  const CountryFlag.small({
    super.key,
    required this.countryCode,
    this.fit,
    this.borderRadius,
    this.decoration,
    this.placeholder,
    this.fallback,
    this.showLoadingIndicator = true,
    this.loadingIndicatorColor,
    this.showShimmer = true,
    this.shimmerColor,
    this.validateCountryCode = true,
    this.invalidCountryCodeMessage,
    this.useSvg = false,
  }) : width = 20,
       height = 13,
       flagSize = FlagSize.small;

  /// Creates a CountryFlag with medium size (40x27)
  const CountryFlag.medium({
    super.key,
    required this.countryCode,
    this.fit,
    this.borderRadius,
    this.decoration,
    this.placeholder,
    this.fallback,
    this.showLoadingIndicator = true,
    this.loadingIndicatorColor,
    this.showShimmer = true,
    this.shimmerColor,
    this.validateCountryCode = true,
    this.invalidCountryCodeMessage,
    this.useSvg = false,
  }) : width = 40,
       height = 27,
       flagSize = FlagSize.medium;

  /// Creates a CountryFlag with large size (80x53)
  const CountryFlag.large({
    super.key,
    required this.countryCode,
    this.fit,
    this.borderRadius,
    this.decoration,
    this.placeholder,
    this.fallback,
    this.showLoadingIndicator = true,
    this.loadingIndicatorColor,
    this.showShimmer = true,
    this.shimmerColor,
    this.validateCountryCode = true,
    this.invalidCountryCodeMessage,
    this.useSvg = false,
  }) : width = 80,
       height = 53,
       flagSize = FlagSize.large;

  /// Creates a CountryFlag with extra large size (160x107)
  const CountryFlag.extraLarge({
    super.key,
    required this.countryCode,
    this.fit,
    this.borderRadius,
    this.decoration,
    this.placeholder,
    this.fallback,
    this.showLoadingIndicator = true,
    this.loadingIndicatorColor,
    this.showShimmer = true,
    this.shimmerColor,
    this.validateCountryCode = true,
    this.invalidCountryCodeMessage,
    this.useSvg = false,
  }) : width = 160,
       height = 107,
       flagSize = FlagSize.extraLarge;


  /// Gets the flag URL from flagcdn.com
  String get _flagUrl {
    if (useSvg) {
      return CountryHelper.getFlagSvgUrl(countryCode);
    }
    final size = flagSize?.value ?? 'w80';
    return CountryHelper.getFlagUrl(countryCode, size: size);
  }

  /// Validates country code if validation is enabled
  bool get _isValidCountryCode {
    if (!validateCountryCode) return true;
    return CountryHelper.isValidCountryCode(countryCode);
  }

  @override
  Widget build(BuildContext context) {
    // Check if country code is valid
    if (!_isValidCountryCode) {
      return _buildErrorWidget(
        invalidCountryCodeMessage ?? 'Invalid country code: $countryCode',
      );
    }

    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: useSvg
            ? SvgPicture.network(
                _flagUrl,
                width: width,
                height: height,
                fit: fit ?? BoxFit.cover,
                placeholderBuilder: (context) => _buildPlaceholder(),
              )
            : CachedNetworkImage(
                imageUrl: _flagUrl,
                width: width,
                height: height,
                fit: fit ?? BoxFit.cover,
                placeholder: (context, url) => _buildPlaceholder(),
                errorWidget: (context, url, error) => _buildErrorWidget(),
                memCacheWidth: width?.toInt(),
                memCacheHeight: height?.toInt(),
              ),
      ),
    );
  }

  /// Builds the placeholder widget
  Widget _buildPlaceholder() {
    if (placeholder != null) {
      return placeholder!;
    }

    if (!showLoadingIndicator) {
      return const SizedBox.shrink();
    }

    if (showShimmer) {
      return _buildShimmerPlaceholder();
    }

    return Center(
      child: CircularProgressIndicator(
        color: loadingIndicatorColor,
      ),
    );
  }

  /// Builds the shimmer placeholder
  Widget _buildShimmerPlaceholder() {
    return ShimmerWidget(
      baseColor: shimmerColor ?? Colors.grey[300]!,
      highlightColor: shimmerColor?.withValues(alpha: 0.8) ?? Colors.grey[200]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: shimmerColor ?? Colors.grey[300],
          borderRadius: borderRadius,
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: loadingIndicatorColor,
          ),
        ),
      ),
    );
  }

  /// Builds the error widget
  Widget _buildErrorWidget([String? message]) {
    if (fallback != null) {
      return fallback!;
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: borderRadius,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.flag,
            color: Colors.grey[600],
            size: (width ?? 80) * 0.3,
          ),
          if (message != null) ...[
            const SizedBox(height: 4),
            Text(
              message,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
} 