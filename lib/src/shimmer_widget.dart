import 'package:flutter/material.dart';

/// A shimmer effect widget for loading states
class ShimmerWidget extends StatefulWidget {
  /// The child widget to apply shimmer effect to
  final Widget child;
  
  /// The base color of the shimmer effect
  final Color baseColor;
  
  /// The highlight color of the shimmer effect
  final Color highlightColor;
  
  /// The duration of the shimmer animation
  final Duration duration;
  
  /// The direction of the shimmer effect
  final ShimmerDirection direction;

  const ShimmerWidget({
    super.key,
    required this.child,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.duration = const Duration(milliseconds: 1500),
    this.direction = ShimmerDirection.ltr,
  });

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: widget.direction == ShimmerDirection.ltr
                  ? Alignment.centerLeft
                  : widget.direction == ShimmerDirection.rtl
                      ? Alignment.centerRight
                      : widget.direction == ShimmerDirection.ttb
                          ? Alignment.topCenter
                          : Alignment.bottomCenter,
              end: widget.direction == ShimmerDirection.ltr
                  ? Alignment.centerRight
                  : widget.direction == ShimmerDirection.rtl
                      ? Alignment.centerLeft
                      : widget.direction == ShimmerDirection.ttb
                          ? Alignment.bottomCenter
                          : Alignment.topCenter,
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: [
                _animation.value - 0.3,
                _animation.value,
                _animation.value + 0.3,
              ].map((stop) => stop.clamp(0.0, 1.0)).toList(),
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}

/// Direction of the shimmer effect
enum ShimmerDirection {
  /// Left to right
  ltr,
  /// Right to left
  rtl,
  /// Top to bottom
  ttb,
  /// Bottom to top
  btt,
}



