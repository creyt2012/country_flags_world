import 'package:flutter/material.dart';
import 'country_flag.dart';
import 'country_helper.dart';

/// A widget that displays a country flag with its name
/// 
/// This widget combines CountryFlag with country name display,
/// providing a complete country representation.
class CountryFlagWithName extends StatelessWidget {
  /// The ISO alpha-2 country code (e.g., "us", "vn", "fr")
  final String countryCode;
  
  /// The width of the flag
  final double? flagWidth;
  
  /// The height of the flag
  final double? flagHeight;
  
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

  /// The shape of the flag
  final FlagShape shape;

  /// Whether to show the country name
  final bool showCountryName;
  
  /// The text style for the country name
  final TextStyle? countryNameStyle;
  
  /// The spacing between flag and country name
  final double spacing;
  
  /// The alignment of the flag and name
  final MainAxisAlignment alignment;
  
  /// The direction of the layout (horizontal or vertical)
  final Axis direction;

  const CountryFlagWithName({
    super.key,
    required this.countryCode,
    this.flagWidth,
    this.flagHeight,
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
    this.shape = FlagShape.rectangle,
    this.showCountryName = true,
    this.countryNameStyle,
    this.spacing = 8.0,
    this.alignment = MainAxisAlignment.start,
    this.direction = Axis.horizontal,
  });

  /// Creates a CountryFlagWithName with small flag (20x13)
  const CountryFlagWithName.small({
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
    this.shape = FlagShape.rectangle,
    this.showCountryName = true,
    this.countryNameStyle,
    this.spacing = 8.0,
    this.alignment = MainAxisAlignment.start,
    this.direction = Axis.horizontal,
  }) : flagWidth = 20,
       flagHeight = 13,
       flagSize = FlagSize.small;

  /// Creates a CountryFlagWithName with medium flag (40x27)
  const CountryFlagWithName.medium({
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
    this.shape = FlagShape.rectangle,
    this.showCountryName = true,
    this.countryNameStyle,
    this.spacing = 8.0,
    this.alignment = MainAxisAlignment.start,
    this.direction = Axis.horizontal,
  }) : flagWidth = 40,
       flagHeight = 27,
       flagSize = FlagSize.medium;

  /// Creates a CountryFlagWithName with large flag (80x53)
  const CountryFlagWithName.large({
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
    this.shape = FlagShape.rectangle,
    this.showCountryName = true,
    this.countryNameStyle,
    this.spacing = 8.0,
    this.alignment = MainAxisAlignment.start,
    this.direction = Axis.horizontal,
  }) : flagWidth = 80,
       flagHeight = 53,
       flagSize = FlagSize.large;

  /// Creates a CountryFlagWithName with extra large flag (160x107)
  const CountryFlagWithName.extraLarge({
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
    this.shape = FlagShape.rectangle,
    this.showCountryName = true,
    this.countryNameStyle,
    this.spacing = 8.0,
    this.alignment = MainAxisAlignment.start,
    this.direction = Axis.horizontal,
  }) : flagWidth = 160,
       flagHeight = 107,
       flagSize = FlagSize.extraLarge;

  @override
  Widget build(BuildContext context) {
    final countryName = CountryHelper.getCountryName(countryCode);
    
    if (!showCountryName || countryName == null) {
      return CountryFlag(
        countryCode: countryCode,
        width: flagWidth,
        height: flagHeight,
        flagSize: flagSize,
        fit: fit,
        borderRadius: borderRadius,
        decoration: decoration,
        placeholder: placeholder,
        fallback: fallback,
        showLoadingIndicator: showLoadingIndicator,
        loadingIndicatorColor: loadingIndicatorColor,
        showShimmer: showShimmer,
        shimmerColor: shimmerColor,
        validateCountryCode: validateCountryCode,
        invalidCountryCodeMessage: invalidCountryCodeMessage,
        useSvg: useSvg,
      );
    }

    return Flex(
      direction: direction,
      mainAxisAlignment: alignment,
      children: [
        CountryFlag(
          countryCode: countryCode,
          width: flagWidth,
          height: flagHeight,
          flagSize: flagSize,
          fit: fit,
          borderRadius: borderRadius,
          decoration: decoration,
          placeholder: placeholder,
          fallback: fallback,
          showLoadingIndicator: showLoadingIndicator,
          loadingIndicatorColor: loadingIndicatorColor,
          showShimmer: showShimmer,
          shimmerColor: shimmerColor,
          validateCountryCode: validateCountryCode,
          invalidCountryCodeMessage: invalidCountryCodeMessage,
          useSvg: useSvg,
          shape: shape,
        ),
        SizedBox(
          width: direction == Axis.horizontal ? spacing : 0,
          height: direction == Axis.vertical ? spacing : 0,
        ),
        Flexible(
          child: Text(
            countryName,
            style: countryNameStyle ?? 
              TextStyle(
                fontSize: (flagHeight ?? 27) * 0.4,
                fontWeight: FontWeight.w500,
              ),
            overflow: TextOverflow.ellipsis,
            maxLines: direction == Axis.horizontal ? 1 : 2,
          ),
        ),
      ],
    );
  }
}
