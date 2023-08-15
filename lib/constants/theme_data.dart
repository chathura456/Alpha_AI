import 'dart:ui';

import 'package:flutter/material.dart';

Color newColor = const Color(0xFF3871C1);

final lightTheme = ThemeData(
    colorScheme: ThemeData.light(useMaterial3: true).colorScheme.copyWith(
      tertiary: Colors.grey[100],
      onSurface: Colors.grey[100],
      onTertiary: newColor,
      inversePrimary: Colors.white,
      background: Colors.white,
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: newColor,
      onSecondary: newColor,
      surface: newColor.withOpacity(0.4),
    )
);

final darkTheme = ThemeData(
    colorScheme: ThemeData.dark(useMaterial3: true).colorScheme.copyWith(
      tertiary: const Color(0xFF444654),
      onTertiary: const Color(0xFF343541),
      inversePrimary: const Color(0xFF444654),
      background: const Color(0xFF141416),
      primary: newColor,
      onPrimary: Colors.white,
      secondary: const Color(0xFF444654),
      surface: Colors.grey[100],
      onSecondary: Colors.white,
      onSurface: const Color(0xFF444654),
    )
);

class AppColors {
      static const Color gradientColor1 = Color(0xff00ADEF);
      static const Color gradientColor2 = Color(0xff3871C1);
      static const Color mainColor = Colors.blueAccent;
      static const Color containerColor = Color(0xff222124);
}


class GradientContainer extends StatelessWidget {
      final Widget child;

      const GradientContainer({super.key, required this.child});

      @override
      Widget build(BuildContext context) {
            return Container(
                  decoration: const BoxDecoration(
                        gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                    Color(0xff00ADEF),
                                    Color(0xff3871C1),
                              ],
                        ),
                  ),
                  child: child,
            );
      }
}
