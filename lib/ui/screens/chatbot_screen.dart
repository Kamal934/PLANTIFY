import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:plant_app/ui/constants.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({
    super.key,
  });

  @override
  State<ChatbotScreen> createState() {
    return _ChatbotScreenState();
  }
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  ChatUser myself = ChatUser(id: '1', firstName: 'User');
  ChatUser bot = ChatUser(id: '2', firstName: 'Eco');
  List<ChatMessage> allMessages = [ChatMessage(text: 'Hi, I am Eco, Your AI Assistent. How can i Help You Today', user: ChatUser(id: '2', firstName: 'AgroMan'), createdAt: DateTime.now())];

  List<ChatUser> typing = [];

  ChatSession get chat {
    String? apiKey = Platform.environment['API_KEY'];
    // AIzaSyDFyMD3bo3Wl5Qv3sezvSZKj2PL26Jmfno remove before pushing
    apiKey ??= "AIzaSyDFyMD3bo3Wl5Qv3sezvSZKj2PL26Jmfno";
    final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: apiKey,
        generationConfig: GenerationConfig(maxOutputTokens: 400));
    
    return model.startChat(history: [
      Content.text(
          'Hello, You are An AI assistent for a Plant app and your name is Eco, you will help me my farming related issues in $language language. If i ask you any topic not related to farming then refuse me to answer.'),
      Content.model(
          [TextPart('Great to meet you. What would you like to know?')])
    ],);
  }

  String get language {
    Locale currentLocale = Localizations.localeOf(context);
    String languageCode = currentLocale.languageCode;
    if (languageCode=='pa'){
      return 'Punjabi';
    }
    else if(languageCode=='hi'){
      return 'Hindi';
    }
    else{
      return 'English';
    }
  }

  getdata(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});
    var content = Content.text(m.text);
    final response = await chat.sendMessageStream(content).last;
    
    ChatMessage m1 =
        ChatMessage(text: response.text!, user: bot, createdAt: DateTime.now());
    allMessages.insert(0, m1);
    setState(() {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    InputBorder outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(
        color:  Constants.primaryColor.withOpacity(0.7),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco'),

      ),
      body: DashChat(
        currentUser: myself,
        messageOptions: MessageOptions(
          currentUserContainerColor: Constants.primaryColor.withOpacity(0.9),
          containerColor:Colors.grey.shade300,
          textColor: Colors.black,
        ),
        typingUsers: typing,
        scrollToBottomOptions: ScrollToBottomOptions(
          scrollToBottomBuilder: (scrollController) => DefaultScrollToBottom(
            scrollController: scrollController,
            backgroundColor: Constants.primaryColor,
            textColor: Constants.blackColor,
          ),
        ),
        inputOptions: InputOptions(
          leading: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.photo_size_select_actual_rounded,
                color: Constants.primaryColor,
              ),
            )
          ],
          inputDecoration: InputDecoration(
              filled: false,
              enabledBorder: outlineBorder,
              focusedBorder: outlineBorder,
              errorBorder: outlineBorder,
              hintText: 'Ask Something...',
              contentPadding: const EdgeInsets.symmetric(horizontal: 24)),
          alwaysShowSend: true,
          sendOnEnter: true,
          sendButtonBuilder: defaultSendButton(color:Constants.primaryColor),
        ),
        onSend: (ChatMessage m) {
          getdata(m);
        },
        messages: allMessages,
      ),
    );
  }
}