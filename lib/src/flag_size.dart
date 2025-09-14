/// Enum for flag sizes available from flagcdn.com
enum FlagSize {
  /// 20px width
  small('w20'),
  
  /// 40px width  
  medium('w40'),
  
  /// 80px width (default)
  large('w80'),
  
  /// 160px width
  extraLarge('w160'),
  
  /// 320px width
  huge('w320'),
  
  /// 640px width
  extraHuge('w640');

  const FlagSize(this.value);
  
  /// The size value used in the URL
  final String value;
  
  /// Gets the width in pixels
  int get width {
    switch (this) {
      case FlagSize.small:
        return 20;
      case FlagSize.medium:
        return 40;
      case FlagSize.large:
        return 80;
      case FlagSize.extraLarge:
        return 160;
      case FlagSize.huge:
        return 320;
      case FlagSize.extraHuge:
        return 640;
    }
  }
  
  /// Gets the height in pixels (assuming 3:2 aspect ratio)
  int get height {
    return (width * 2 / 3).round();
  }
  
  /// Gets the aspect ratio
  double get aspectRatio => 3 / 2;
}



