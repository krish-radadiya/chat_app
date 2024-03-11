import 'dart:developer';
import 'package:chat_app/constants/string.dart';
import 'package:chat_app/utils/helper/auth-helper.dart';
import 'package:chat_app/utils/helper/firestore_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/chat-model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> arguments =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://i.pinimg.com/736x/c3/48/c2/c348c2ec2d5c012fd80759195a2aea50.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              CircleAvatar(
                radius: 15,
                foregroundImage: NetworkImage(arguments[1]),
              ),
              SizedBox(
                width: w / 30,
              ),
              Text(arguments[0]),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_sharp),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: StreamBuilder(
              stream: fetchedmsg,
              builder: (ctx, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  List<QueryDocumentSnapshot<Map<String, dynamic>>>? messages =
                      snapshot.data?.docs;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        reverse: true,
                        itemCount: messages?.length,
                        itemBuilder: (ctx, i) {
                          return Align(
                            alignment:
                                (arguments[2] != messages?[i]['receivedby'])
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                            child: Chip(
                              label: Text(
                                "${messages?[i]['message']}",
                              ),
                            ),
                          );
                        }),
                  );
                }
                return const CircularProgressIndicator();
              },
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: instagramStyleTextField(receiver: arguments[2]),
            ),
          ],
        ),
      ),
    );
  }

  Container instagramStyleTextField({required String receiver}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt_outlined),
          ),
          Expanded(
            child: TextFormField(
              cursorColor: Colors.black,
              controller: messageController,
              onChanged: (val) {
                message = val;
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Send message...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              log("$message");
              messageController.clear();
              Chat details = Chat(
                message: message!,
                receiver: receiver,
                sender: AuthHelper.auth.currentUser!.uid,
              );
              FireStoreHelper.fireStoreHelper.sendMessage(chatdetails: details);
              message = null;
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
