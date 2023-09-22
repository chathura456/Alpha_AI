import 'package:flutter/material.dart';

import '../constants/theme_data.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final BorderRadius borderRadius;
  final double width;
  final double height;

  const GradientButton({super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius = BorderRadius.zero,
    this.width = double.infinity,
    this.height = 50.0,
  });



  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.gradientColor1,
              AppColors.gradientColor2
            ],
          ),
         // color: AppColors.gradientColor1
        ),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
