import 'package:alphaai/constants/theme_data.dart';
import 'package:flutter/material.dart';

class GradientOutlineContainer extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final BorderRadius borderRadius;
  final double width;
  final double height;
  final double strokeWidth;


  const GradientOutlineContainer({super.key,
    this.onPressed,
    required this.child,
    this.borderRadius = BorderRadius.zero,
    this.width = double.infinity,
    this.height = 50.0,
    this.strokeWidth = 2.0,
  });

  @override
  State<GradientOutlineContainer> createState() => _GradientOutlineContainerState();
}

class _GradientOutlineContainerState extends State<GradientOutlineContainer> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed!();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: widget.onPressed,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.gradientColor1,
              AppColors.gradientColor2
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(widget.strokeWidth),
          child: Container(
            decoration: BoxDecoration(
              color: _isPressed ? Colors.blueAccent:Theme.of(context).colorScheme.background,
              borderRadius: widget.borderRadius,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0), // Add some padding to the left side of the text
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
