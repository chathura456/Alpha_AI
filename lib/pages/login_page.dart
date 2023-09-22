import 'package:alphaai/pages/packages_page.dart';
import 'package:alphaai/pages/register_page.dart';
import 'package:alphaai/widgets/textbox.dart';
import 'package:flutter/material.dart';
import '../models/asset_manager.dart';
import '../widgets/gradient_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(child: Image.asset(AssetManager.logo, width: 250,)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(child: Text('Sign In',style: TextStyle(fontSize: 35),),),
            ),
            TextBoxWidget(hintText: "Email Address",
              controller: emailController,
              iconData: Icons.email,
              emptyError: "Email Address Cannot be empty",),
            const SizedBox(height: 20,),
            TextBoxWidget(hintText: "Password",
              controller: passwordController,
              iconData: Icons.lock,
              isPassword: true,
              emptyError: "Password Cannot be empty",),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width*0.75,
                child: Text("Forget Password?",style: TextStyle(fontSize: 16,
                  color: Colors.grey
                ),textAlign: TextAlign.end,),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GradientButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context){
                        return const PackagesPage();
                      })
                  );
                },
                borderRadius: BorderRadius.circular(30), // Provide the desired border radius
                width: 250.0, // Provide the desired width
                height: 60.0,
                child: const Text(
                  "Sign in",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600 // Choose a color that contrasts with the gradient
                  ),
                ), // Provide the desired height
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context){
                        return const RegisterPage();
                      })
                  );
                },
                child: Text("Don't have an Account? Sign up",style: TextStyle(fontSize: 16,
                    color: Colors.grey
                ),textAlign: TextAlign.center,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
