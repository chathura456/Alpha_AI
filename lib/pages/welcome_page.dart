import 'package:alphaai/models/asset_manager.dart';
import 'package:alphaai/pages/login_page.dart';
import 'package:alphaai/pages/select_why.dart';
import 'package:flutter/material.dart';

import '../widgets/gradient_buttons.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 75,),
                  Padding(padding: const EdgeInsets.only(left: 0),
                    child: Text('Welcome to ',
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 30
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 0),
                    child: Text('Ask Turbo AI',
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 65,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 75,),
                  Center(child: Image.asset(AssetManager.logo, width: 300,)),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
            child: GradientButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context){
                      return const LoginPage();
                    })
                );
              },
              borderRadius: BorderRadius.circular(30), // Provide the desired border radius
              width: 250.0, // Provide the desired width
              height: 60.0,
              child: const Text(
                "Let's Go",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold // Choose a color that contrasts with the gradient
                ),
              ), // Provide the desired height
            ),
          ),
        ],
      ),
    )
    ;
  }
}
