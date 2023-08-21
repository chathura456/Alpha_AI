import 'package:alphaai/models/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:alphaai/providers/chat_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../providers/tts_provider.dart';
import '../services/tts_services.dart';
import '../widgets/chat_widget.dart';
import '../widgets/text_widget.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key? key, this.label, this.prompt, this.categoryName}) : super(key: key);
  final String? label;
  final String? prompt;
  final String? categoryName;

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}
class _ChatbotPageState extends State<ChatbotPage> with AutomaticKeepAliveClientMixin{
  late FocusNode _focusNode;
  late TextEditingController textController = TextEditingController();
  late ScrollController _scrollController;
  bool _isTyping = false;
  bool isListen = false;
  bool isNotEmpty = false;
  bool micVisible = true;
  bool isSpeak = true;
  SpeechToText speechToText = SpeechToText();
  late String userInput;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _scrollController = ScrollController();
    // Request focus after a short delay to ensure the build method completes
    Future.delayed(const Duration(milliseconds: 100), () {
      _focusNode.requestFocus();
    });
    textController = TextEditingController(text: widget.prompt ?? "");
    if(isNotEmpty==true){
      setState(() {
        isNotEmpty == false;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
    textController.dispose();
    _scrollController.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    super.build(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    final ttsProvider = Provider.of<TtsProvider>(context,listen: false);

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
                IconButton(onPressed: (){
                  setState(() {
                    if(ttsProvider.isSpeak){
                      TextToSpeech.mute();
                    }else{
                      TextToSpeech.initTTS();
                    }
                    ttsProvider.toggleSpeak();
                  });
                },
                  icon: Icon(ttsProvider.isSpeak?Icons.volume_up:Icons.volume_off,color: Colors.white,),),
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
            child: ListView.builder(
              shrinkWrap: true,
              addRepaintBoundaries: false,
              addAutomaticKeepAlives: true,
              controller: _scrollController,
              itemCount: chatProvider.getChatList.isNotEmpty?chatProvider.getChatList.length:1,
              itemBuilder: (context, index) {
                return chatProvider.getChatList.isNotEmpty?ChatWidget(
                  msg: chatProvider.getChatList[index].msg,
                  chatIndex: chatProvider.getChatList[index].chatIndex,
                )
                    :
                Container(
                  height: MediaQuery.of(context).size.height*0.7,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.text_snippet,
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
                        "Just enter your question or idea, and I'll do my best to assist you. \nI am always learning, so don't hesitate to ask me anything...",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(0.6),
                            height: 1.6,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          _isTyping? const SpinKitThreeBounce(
            color: Colors.white,
            size: 18,
          ):const SizedBox.shrink(),
          const SizedBox(
            height: 15,
          ),
        SizedBox(
          height: 100.0,
          child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 92.0, // 2 pixels more than your content container for the border
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 50, 50, 50), // Border color
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
                                controller: textController,
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
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                isNotEmpty = true;
                                micVisible=true;
                                isListen = false;
                              });
                              await sentMessageIst(
                              ttsProvider: ttsProvider,
                              chatProvider: chatProvider);
                              setState(() {
                                scrollList();
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(AssetManager.sendIcon,width: 20,height: 20,)
                              ),
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

  Future<void> sentMessageIst(
      {
        required TtsProvider ttsProvider,
        required ChatProvider chatProvider
      }) async {
    if(_isTyping){
      Fluttertoast.showToast(msg: 'You cannot send multiple messages at a time.');
      return;
    }
    if(textController.text.isEmpty){
      Fluttertoast.showToast(msg: 'Please Type a message.');
      return;
    }
    try {
      String msg1 = textController.text;
      setState(() {
        _isTyping = true;
        chatProvider.addUserMessage(msg: msg1);
        textController.clear();
        _focusNode.unfocus();
      });
      await chatProvider.sendMessageAndGetAnswers(
          count: chatProvider.chatList.length,
          ttsProvider: ttsProvider,
          msg: msg1,
          chosenModel: "");
      setState(() {
      });
    } catch (error) {
      Fluttertoast.showToast(msg: '"error $error"');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollList();
        _isTyping = false;
      });
    }

  }

  void scrollList() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2), curve: Curves.easeOut);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
