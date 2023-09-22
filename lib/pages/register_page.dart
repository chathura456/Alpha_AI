import 'package:flutter/material.dart';
import '../models/asset_manager.dart';
import '../widgets/gradient_buttons.dart';
import '../widgets/textbox.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              child: Center(child: Image.asset(AssetManager.logo, width: 200,)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(child: Text('Sign Up',style: TextStyle(fontSize: 35),),),
            ),
            TextBoxWidget(hintText: "User Name",
              controller: nameController,
              iconData: Icons.person,
              emptyError: "Email Address Cannot be empty",),
            const SizedBox(height: 20,),
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
            const SizedBox(height: 20,),
            TextBoxWidget(hintText: "Confirm Password",
              controller: confirmPassController,
              iconData: Icons.lock,
              isPassword: true,
              emptyError: "Confirm Password Cannot be empty",),

            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  "Sign Up",
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
                        return const LoginPage();
                      })
                  );
                },
                child: Text("Already have an Account? Sign In",style: TextStyle(fontSize: 16,
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
