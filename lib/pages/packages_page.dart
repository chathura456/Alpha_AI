import 'package:alphaai/pages/home_page.dart';
import 'package:alphaai/widgets/gradient_buttons.dart';
import 'package:flutter/material.dart';

import '../widgets/discount_button.dart';
import '../widgets/icon_header_container.dart';

class PackagesPage extends StatefulWidget {
  const PackagesPage({super.key});

  @override
  State<PackagesPage> createState() => _PackagesPageState();
}

class _PackagesPageState extends State<PackagesPage> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context){
                              return const HomePage();
                            })
                        );
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),

                        child: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),

                        child: const Text('Restore',style: TextStyle(fontSize: 12),),
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: Padding(padding: const EdgeInsets.only(top: 10),
                  child: Text('Unlock Unlimited Access',
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
             const SizedBox(height: 40,),
             myContainer(Icons.quickreply, "Answers From GPT 3.5", "More accurate and detailed answers."),
              const SizedBox(height: 30,),
              myContainer(Icons.image, "AI Image generation", "Creative ai images."),
              const SizedBox(height: 30,),
              myContainer(Icons.stacked_line_chart, "No limits", "Have Unlimited dialogues."),
              const SizedBox(height: 30,),
              myContainer(Icons.videocam_off_sharp, "No Ads", "Enjoy Alpha AI without ads."),
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: DiscountButton(
                  header: "LKR1600.00/Week",
                  subHeader: "3 days Free Trial/Auto Renewal",
                  showDiscount: false,
                  isSelected: isSelect,
                  onPressed: () {
                    setState(() {
                      isSelect = !isSelect;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: DiscountButton(
                  header: "LKR13000.00/LifeTime",
                  subHeader: "Billed Once",
                  showDiscount: true,
                  isSelected: !isSelect,
                  onPressed: () {
                    setState(() {
                      isSelect = !isSelect;
                    });
                  },
                ),
              ),
              const SizedBox(height: 40,),
              GradientButton(
                  onPressed: (){},
                  width: MediaQuery.of(context).size.width*0.8,
                height: 60,
                  borderRadius: BorderRadius.circular(30.0),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Start Free Trial and Plan',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget myContainer(IconData icon, String header, String sub){
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: IconHeaderSubHeader(
            icon: icon,
            header: header,
            subheader: sub,
          ),
        ),
      ),
    );
  }
}
