import 'package:flutter/material.dart';
import 'package:alphaai/models/chat_model.dart';
import 'package:alphaai/providers/tts_provider.dart';
import 'package:alphaai/services/api_services.dart';

class ChatProvider with ChangeNotifier{
  List<ChatModel> chatList = [];
  int lastID = -1;
  List<ChatModel> get getChatList{
    return chatList;
  }
  void addUserMessage({
    required String msg
  }){
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  void setCheckLastID(int id){
    lastID = id;
    notifyListeners();
  }
  int get checkLastID{
    return lastID;
  }

  Future<void>sendMessageAndGetAnswers({required String msg,
    required String chosenModel,required TtsProvider ttsProvider,required int count
  }
      )
  async{
      var reply = await ApiServices.sendMessagesChatGPT(message: msg, modelId: 'gpt-3.5-turbo',ttsProvider: ttsProvider,count: count);
      chatList.addAll(reply);
  }
}