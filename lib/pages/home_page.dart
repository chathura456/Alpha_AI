import 'package:alphaai/constants/theme_data.dart';
import 'package:alphaai/models/asset_manager.dart';
import 'package:alphaai/pages/chatbot_page.dart';
import 'package:alphaai/pages/image_screen.dart';
import 'package:alphaai/widgets/suggestion_context_container.dart';
import 'package:flutter/material.dart';
import 'package:alphaai/pages/settings_page.dart';
import '../constants/suggestions.dart';
import '../widgets/suggestion_head_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLabel = 'Knowledge';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Image.asset(AssetManager.logo, width: 50,height: 50,)
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                 /* IconButton(
                      onPressed: (){
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) {
                          return const ImageScreen();
                        }));
                      },
                      icon: const Icon(Icons.image,color: Colors.white,),
                    iconSize: 28,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(width: 20.0),*/
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const settings_page();
                          },
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.settings,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ask Turbo AI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) {
                          return const ChatbotPage();
                        }));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: AppColors.containerColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              child: IgnorePointer(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Write your message',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              width: 35.0,
                              height: 35.0,
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 50.0),
                      child: const Text(
                        'You have no conversations yet 😔',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) {
                          return const ChatbotPage();
                        }));
                      },
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context) {
                            return const ChatbotPage();
                          }));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>( Colors.blueAccent),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(const Size(
                              120, 40)), // Adjust the width and height here
                        ),
                        child: const Text(
                          'Start',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 30.0),
                    child: Text(
                      'Templates',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 50.0, // Adjust the height of the button row
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SuggestionTypeButton(
                          emoji: '🧠',
                          label: 'Knowledge',
                          isSelected: selectedLabel == 'Knowledge',
                          onPressed: () => handleButtonPressed('Knowledge'),
                        ),
                        SuggestionTypeButton(
                          emoji: '📝',
                          label: 'Writing',
                          isSelected: selectedLabel == 'Writing',
                          onPressed: () => handleButtonPressed('Writing'),
                        ),
                        SuggestionTypeButton(
                          emoji: '📖',
                          label: 'Summaries',
                          isSelected: selectedLabel == 'Summaries',
                          onPressed: () => handleButtonPressed('Summaries'),
                        ),
                        SuggestionTypeButton(
                          emoji: '🗣️',
                          label: 'Translation',
                          isSelected: selectedLabel == 'Translation',
                          onPressed: () => handleButtonPressed('Translation'),
                        ),
                        SuggestionTypeButton(
                          emoji: '🎓',
                          label: 'Learning',
                          isSelected: selectedLabel == 'Learning',
                          onPressed: () => handleButtonPressed('Learning'),
                        ),
                        SuggestionTypeButton(
                          emoji: '💡',
                          label: 'Ideas',
                          isSelected: selectedLabel == 'Ideas',
                          onPressed: () => handleButtonPressed('Ideas'),
                        ),
                        SuggestionTypeButton(
                          emoji: '📊',
                          label: 'Analysis',
                          isSelected: selectedLabel == 'Analysis',
                          onPressed: () => handleButtonPressed('Analysis'),
                        ),
                        SuggestionTypeButton(
                          emoji: '🎭',
                          label: 'Fun',
                          isSelected: selectedLabel == 'Fun',
                          onPressed: () => handleButtonPressed('Fun'),
                        ),
                        SuggestionTypeButton(
                          emoji: '🌐',
                          label: 'Tech',
                          isSelected: selectedLabel == 'Tech',
                          onPressed: () => handleButtonPressed('Tech'),
                        ),
                        SuggestionTypeButton(
                          emoji: '🤖',
                          label: 'Coding',
                          isSelected: selectedLabel == 'Coding',
                          onPressed: () => handleButtonPressed('Coding'),
                        ),

                        // Add more buttons as needed
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0), // Add spacing
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...suggestions.where((suggestion) => suggestion.categoryName == selectedLabel).map((suggestion) {
                            return SuggestionContent(
                              categoryName: suggestion.categoryName,
                              label: suggestion.topic,
                              prompt: suggestion.prompt,
                            );
                          }).toList(),
                          const SizedBox(height: 110.0),  // Add your desired height here
                        ],

                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   height: 92.0, // 2 pixels more than your content container for the border
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: const Color.fromARGB(255, 50, 50, 50), // Border color
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(10.0),
            //         topRight: Radius.circular(10.0),
            //       ),
            //     ),
            //   ),
            // ),
            // Your current Positioned widget
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: GestureDetector(
            //     onTap: (){
            //       Navigator.of(context)
            //           .pushReplacement(MaterialPageRoute(builder: (context) {
            //         return const ChatbotPage();
            //       }));
            //     },
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(
            //           horizontal: 20.0, vertical: 10.0),
            //       height: 90.0,
            //       decoration: BoxDecoration(
            //         color: Theme.of(context).colorScheme.background,
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       child: Row(
            //         children: [
            //           const Expanded(
            //             child: IgnorePointer(
            //               child: TextField(
            //                 decoration: InputDecoration(
            //                   hintText: 'Write your message',
            //                   border: InputBorder.none,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           const SizedBox(width: 10.0),
            //           Container(
            //             width: 40.0,
            //             height: 40.0,
            //             decoration: const BoxDecoration(
            //               color: Colors.blueAccent,
            //               shape: BoxShape.circle,
            //             ),
            //             child: const Icon(
            //               Icons.send,
            //               color: Colors.white,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void handleButtonPressed(String label) {
    setState(() {
      selectedLabel = label;
    });
  }

}
