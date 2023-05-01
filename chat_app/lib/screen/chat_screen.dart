import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/services/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;

  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("chatGPT"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openaiLogo),
        ),
        actions: [
          IconButton(onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white),),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Text("hello this is a txt");
                  }),
            ),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: textEditingController,
                          onSubmitted: (value) {
                            //TODO send message
                          },
                          decoration: const InputDecoration.collapsed(
                              hintText: "how can i help you",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
