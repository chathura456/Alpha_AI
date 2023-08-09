import 'package:alphaai/pages/packages_page.dart';
import 'package:alphaai/widgets/container_button.dart';
import 'package:flutter/material.dart';

class SelectWhy extends StatefulWidget {
  const SelectWhy({super.key});

  @override
  State<SelectWhy> createState() => _SelectWhyState();
}

class _SelectWhyState extends State<SelectWhy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body:Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25,),
                    Padding(padding: const EdgeInsets.only(left: 35),
                      child: Text('What do you want \nfrom Alpha AI?',
                        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          height: 1.3
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 35,top: 10,right: 20),
                      child: Text('Choose an option that best fits your Desires. This helps us enhance our services.',
                        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
                            fontSize: 16,
                          height: 1.3
                        ),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    buildOption("Quick insights"),
                    buildOption("Discover new topics"),
                    buildOption("Improve language skills"),
                    buildOption("Understand complex concepts"),
                    buildOption("Other"),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  
  Widget buildOption(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: GradientOutlineContainer(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context){
                  return const PackagesPage();
                })
            );
          },
          borderRadius: BorderRadius.circular(10), // Provide the desired border radius
          width: MediaQuery.of(context).size.width,
          strokeWidth: 0.5,// Provide the desired width
          height: 60.0,
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold // Choose a color that contrasts with the gradient
            ),
          ), // Provide the desired height
        ),
      ),
    );
  }

}
