/// Enum for different flag shapes
enum FlagShape {
  /// Rectangle shape (default)
  rectangle,
  
  /// Rounded rectangle shape
  rounded,
  
  /// Circle shape
  circle,
  
  /// Square shape
  square,
  
  /// Rounded square shape
  roundedSquare,
  
  /// Stadium shape (rounded rectangle with more rounded corners)
  stadium,
  
  /// Diamond shape
  diamond,
  
  /// Rounded diamond shape
  roundedDiamond,
}

/// Extension for FlagShape to provide utility methods
extension FlagShapeExtension on FlagShape {
  /// Gets the border radius for the shape
  BorderRadius? getBorderRadius(double? width, double? height) {
    final w = width ?? 80.0;
    final h = height ?? 53.0;
    final minDimension = w < h ? w : h;
    
    switch (this) {
      case FlagShape.rectangle:
        return null;
      case FlagShape.rounded:
        return BorderRadius.circular(8.0);
      case FlagShape.circle:
        return BorderRadius.circular(minDimension / 2);
      case FlagShape.square:
        return null;
      case FlagShape.roundedSquare:
        return BorderRadius.circular(8.0);
      case FlagShape.stadium:
        return BorderRadius.circular(minDimension / 2);
      case FlagShape.diamond:
        return null;
      case FlagShape.roundedDiamond:
        return BorderRadius.circular(8.0);
    }
  }
  
  /// Gets the clip behavior for the shape
  Clip getClipBehavior() {
    switch (this) {
      case FlagShape.rectangle:
      case FlagShape.rounded:
      case FlagShape.square:
      case FlagShape.roundedSquare:
      case FlagShape.stadium:
        return Clip.antiAlias;
      case FlagShape.circle:
        return Clip.antiAlias;
      case FlagShape.diamond:
      case FlagShape.roundedDiamond:
        return Clip.antiAlias;
    }
  }
  
  /// Gets the transform matrix for special shapes
  Matrix4? getTransform() {
    switch (this) {
      case FlagShape.diamond:
      case FlagShape.roundedDiamond:
        return Matrix4.identity()..rotateZ(0.785398); // 45 degrees
      default:
        return null;
    }
  }
  
  /// Gets the aspect ratio for the shape
  double? getAspectRatio() {
    switch (this) {
      case FlagShape.square:
      case FlagShape.roundedSquare:
        return 1.0;
      case FlagShape.circle:
        return 1.0;
      case FlagShape.rectangle:
      case FlagShape.rounded:
      case FlagShape.stadium:
      case FlagShape.diamond:
      case FlagShape.roundedDiamond:
        return null; // Use natural aspect ratio
    }
  }
  
  /// Gets the display name for the shape
  String get displayName {
    switch (this) {
      case FlagShape.rectangle:
        return 'Rectangle';
      case FlagShape.rounded:
        return 'Rounded';
      case FlagShape.circle:
        return 'Circle';
      case FlagShape.square:
        return 'Square';
      case FlagShape.roundedSquare:
        return 'Rounded Square';
      case FlagShape.stadium:
        return 'Stadium';
      case FlagShape.diamond:
        return 'Diamond';
      case FlagShape.roundedDiamond:
        return 'Rounded Diamond';
    }
  }
}
