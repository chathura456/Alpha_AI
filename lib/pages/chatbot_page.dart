import 'package:alphaai/pages/settings_page.dart';
import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key? key, this.label, this.prompt, this.categoryName}) : super(key: key);
  final String? label;
  final String? prompt;
  final String? categoryName;

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}
class _ChatbotPageState extends State<ChatbotPage>{
  late FocusNode _focusNode;
  late TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    // Request focus after a short delay to ensure the build method completes
    Future.delayed(Duration(milliseconds: 100), () {
      _focusNode.requestFocus();
    });
    _textController = TextEditingController(text: widget.prompt ?? "");
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
    _textController.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          "Alpha AI",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        // Custom back button
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white, // Change the color of the back arrow
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 0.0,right: 20),
            child: Row(
              children: [
                /* ElevatedButton(
                    onPressed: () {
                      // Add your button's functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(40, 40),
                    ),
                    child: const Text(
                      'PRO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),*/
                /*Container(
                    width: 40,
                    height: 40,
                    color: Colors.blueAccent,
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      /*style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        primary: const Color.fromARGB(255, 103, 170, 238),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                      ),*/
                      child: const Icon(
                        Icons.discord,
                        size: 30.0,
                      ),
                    ),
                  ),*/
                GestureDetector(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.file_upload_outlined,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.more_vert,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(

              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 92.0, // 2 pixels more than your content container for the border
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 50, 50, 50), // Border color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                // Your current Positioned widget
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center, // Align items vertically in the center
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            reverse: true,
                            child: TextField(
                              controller: _textController,
                              focusNode: _focusNode,
                              autofocus: true,
                              maxLines: null,
                              decoration: const InputDecoration(
                                hintText: 'Write your message',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } 
}
