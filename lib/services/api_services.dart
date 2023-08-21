import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:alphaai/constants/api_data.dart';
import 'package:alphaai/models/chat_model.dart';
import 'package:alphaai/providers/tts_provider.dart';
import 'package:alphaai/services/tts_services.dart';

class ApiServices {

  //send messages using chatGPT api
  static Future<List<ChatModel>> sendMessagesChatGPT({required String message,
    required String modelId,
    required TtsProvider ttsProvider,
    required int count}) async {
    try {
      var response = await http.post(Uri.parse('$BASE_URL/chat/completions'),
          headers: {
            'Authorization': 'Bearer $API_KEY',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            "model": modelId,
            "messages": [
              {"role": "user", "content": message}
            ]
          }));
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }
      List<ChatModel> chatList = [];
      if (jsonResponse['choices'].length > 0) {
        // print("response ${jsonResponse['choices'][0]['text']}");
        chatList = List.generate(jsonResponse['choices'].length, (index) {
          return ChatModel(
              msg: jsonResponse['choices'][index]['message']['content'],
              chatIndex: count);
        });
        if (ttsProvider.isSpeak) {
          TextToSpeech.speak(jsonResponse['choices'][0]['message']['content']);
        }
        //print(count);
      }
      return chatList;
    } catch (error) {
      Fluttertoast.showToast(msg: '"error $error"');
      rethrow;
    }
  }


  static generateImage(String prompt, int count, String size) async {
    var response = await http.post(
        Uri.parse('$BASE_URL/images/generations'),
        headers: {
          'Authorization': 'Bearer $API_KEY',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {
              "prompt": prompt,
              "n": count,
              "size": size
            }
        )
    );
    Map jsonResponse = jsonDecode(response.body);
    if (jsonResponse['error'] != null) {
      return jsonResponse['error'];
    }
    List imageList = [];
    if (jsonResponse['data'].length > 0) {
      // print("response ${jsonResponse['choices'][0]['text']}");

      List.generate(jsonResponse['data'].length, (index) {
        imageList.add(jsonResponse['data'][index]['url']);
      });

      return imageList;
    }
  }
}

