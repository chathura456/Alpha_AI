import 'package:alphaai/pages/welcome_page.dart';
import 'package:alphaai/providers/theme_provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/theme_data.dart';
import 'models/asset_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context,ThemeProvider themeProvider, child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeProvider.darkTheme?darkTheme:lightTheme,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      splash: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetManager.video, width: width),
          ],
        ),
      ),
      //backgroundColor: newColor,
      nextScreen: const WelcomePage(),
      splashIconSize: width,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(seconds: 2),
    );
  }
}

