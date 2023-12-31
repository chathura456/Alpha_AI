import 'package:alphaai/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:alphaai/constants/theme_data.dart';
import 'package:alphaai/providers/count_provider.dart';
import 'package:alphaai/providers/size_provider.dart';
import 'package:alphaai/providers/theme_provider.dart';
import 'package:alphaai/pages/chatbot_page.dart';
import 'package:alphaai/services/api_services.dart';
import 'package:alphaai/models/asset_manager.dart';
import 'package:alphaai/services/menu_options.dart';
import 'package:alphaai/widgets/count_dropdown.dart';
import 'package:alphaai/widgets/image_widget.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late FocusNode focusNode;
  late TextEditingController textEditingController;
  bool isLoaded = false;
  bool isListen = false;
  bool micVisible = true;
  bool isSubmitted = false;
  bool isButtonShow = true;
  bool isExpanded = true;
  bool isUrlValid = false;

  SpeechToText speechToText = SpeechToText();
  late var outputData;
  late String imageUrl;
  late Image myImage;
  double loadPrc = 0.0;
  List imageList = [];


  @override
  void initState() {
    focusNode = FocusNode();
    textEditingController = TextEditingController();
    const ImageCountDropdown();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final sizesProvider = Provider.of<SizesProvider>(context, listen: false);
    final countProvider = Provider.of<ImageCountProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 2.0,
        shadowColor: Colors.grey,
        title: const Text(
          "Alpha AI",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white, // Change the color of the back arrow
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return const ChatbotPage();
              }));
            },
            icon: const Icon(
              Icons.text_snippet,
              color: Colors.white,
            ),
          ),

          IconButton(
              onPressed: () {
                setState(() {
                  Services.showImageOptions(context: context);
                });
              },
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: ListView.builder(
                itemCount: countProvider.currentNo,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isLoaded
                            ?
                        Column(
                          children: [
                            ImageWidget(imageUrl: imageList[index].toString()),
                          ],
                        )
                            : SizedBox(
                          height:
                          MediaQuery.of(context).size.height * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (isSubmitted)
                                  ? const SpinKitCircle(
                                color: Colors.white,
                                size: 68,
                              )
                                  : Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withOpacity(0.4),
                                    size: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.3,
                                  ),
                                  Text(
                                    'Enter a hint or description to generate an image that fits your idea..',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary
                                            .withOpacity(0.6),
                                        height: 1.6,
                                        fontSize: 18),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                  //color: Colors.orange,
                }),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),

            child: Wrap(
              children: [
                ExpansionTile(
                  onExpansionChanged: (isExpanded){
                    setState(() {
                      this.isExpanded = isExpanded;
                    });
                  },
                  collapsedIconColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  maintainState: true,
                  initiallyExpanded: isExpanded,
                  title: const Text(''),
                  trailing: Icon(isExpanded?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  children:
                  [ Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                                focusNode: focusNode,
                                controller: textEditingController,
                                cursorColor:
                                Theme.of(context).colorScheme.onPrimary,
                                onTap: () {},
                                onChanged: (value) {
                                  setState(() {
                                    isSubmitted = false;
                                  });
                                },
                                onSubmitted: (value) async {

                                  if (textEditingController.text.isNotEmpty) {
                                    setState(() {
                                      isLoaded = false;
                                      isSubmitted = true;
                                      isButtonShow = false;

                                    });

                                    outputData = await ApiServices.generateImage(
                                        textEditingController.text,
                                        countProvider.currentNo,
                                        sizesProvider.currentSize);

                                    isUrlValid = Uri.parse(outputData[0].toString()).isAbsolute;
                                    if(isUrlValid){
                                      setState(() {
                                        imageList = outputData;
                                        textEditingController.clear();
                                        isLoaded = true;
                                        isButtonShow = true;
                                        isExpanded = false;
                                      });

                                    }
                                    else{

                                      setState(() {
                                        textEditingController.clear();
                                        isButtonShow = true;
                                        isExpanded = false;
                                        isSubmitted = false;
                                        Fluttertoast.showToast(
                                            msg: 'AI model cannot identified you entered data. Please try to enter meaningful keywords.').timeout(const Duration(seconds: 10));
                                      });
                                    }

                                  }
                                  else{
                                    Fluttertoast.showToast(msg: 'User Input cannot be null');
                                  }

                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: 'Please enter what you want..',
                                    hintStyle:
                                    TextStyle(color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withOpacity(0.5),)),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          width: 250,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainColor,
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () async {
                              if (textEditingController.text.isNotEmpty) {
                                setState(() {
                                  isLoaded = false;
                                  isSubmitted = true;
                                  isButtonShow = false;

                                });

                                outputData = await ApiServices.generateImage(
                                    textEditingController.text,
                                    countProvider.currentNo,
                                    sizesProvider.currentSize);

                                isUrlValid = Uri.parse(outputData[0].toString()).isAbsolute;
                                if(isUrlValid){
                                  setState(() {
                                    imageList = outputData;
                                    textEditingController.clear();
                                    isLoaded = true;
                                    isButtonShow = true;
                                    isExpanded = false;
                                  });

                                }
                                else{

                                  setState(() {
                                    textEditingController.clear();
                                    isButtonShow = true;
                                    isExpanded = false;
                                    isSubmitted = false;
                                    Fluttertoast.showToast(
                                        msg: 'AI model cannot identified you entered data. Please try to enter meaningful keywords.').timeout(const Duration(seconds: 10));
                                  });
                                }


                              }
                              else{
                                Fluttertoast.showToast(msg: 'User Input cannot be null');
                              }
                            },
                            child: isButtonShow
                                ? const Text(
                              'Generate AI Image',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            )
                                : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Please Wait',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(width: 8,),
                                SpinKitThreeBounce(
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
