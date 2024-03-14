import 'dart:developer';
import 'package:chat_app/constants/string.dart';
import 'package:chat_app/modules/screens/chat-app/model/chat-model.dart';
import 'package:chat_app/utils/helper/auth-helper.dart';
import 'package:chat_app/utils/helper/firestore_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    logout() {
      AuthHelper.authHelper.signOut();
      Get.toNamed('/login');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Telegram"),
        // title: (AuthHelper.auth.currentUser?.displayName == null)
        //     ? Text(
        //         "${AuthHelper.auth.currentUser?.email?.split("@")[0].capitalizeFirst}",
        //         style: titleTextStyle(),
        //       )
        //     : Text(
        //         "${AuthHelper.auth.currentUser?.displayName}",
        //         style: titleTextStyle(),
        //       ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Image.asset(
        //       (Get.isDarkMode == true)
        //           ? "lib/assets/vedio-white.png"
        //           : "lib/assets/vedio-black.png",
        //       height: h / 28,
        //     ),
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: Image.asset(
        //       (Get.isDarkMode == true)
        //           ? "lib/assets/edit-white.png"
        //           : "lib/assets/edit-black.png",
        //       height: h / 40,
        //     ),
        //   ),
        // ],
      ),
      body: StreamBuilder(
        stream: FireStoreHelper.fireStoreHelper.fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<QueryDocumentSnapshot<Map<String, dynamic>>>? users =
                snapshot.data?.docs;
            return Column(
              children: [
                // const Padding(
                //   padding: EdgeInsets.all(1),
                // ),
                Expanded(
                  flex: 20,
                  child: ListView.builder(
                    itemCount: users?.length,
                    itemBuilder: (ctx, i) {
                      return Card(
                        child: ListTile(
                          onTap: () async {
                            Chat chatDetails = Chat(
                              message: '',
                              receiver: users?[i]['uid'],
                              sender: AuthHelper.auth.currentUser!.uid,
                            );
                            fetchedmsg = await FireStoreHelper.fireStoreHelper
                                .fetchMessage(chatdetails: chatDetails);
                            Get.toNamed('/chat', arguments: [
                              "${users?[i]['name']}",
                              "${users?[i]['dp']}",
                              "${users?[i]['uid']}",
                            ]);
                          },
                          title: Text(
                            "${users?[i]['name']}",
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          subtitle: const Text("Sent 2h ago"),
                          trailing: const Text("5:21 pm"),
                          // trailing: IconButton(
                          //   onPressed: () {},
                          //   icon: Image.asset(
                          //     (Get.isDarkMode == true)
                          //         ? "lib/assets/camera-white.png"
                          //         : "lib/assets/camera-black.png",
                          //     height: h / 30,
                          //   ),
                          // ),
                          leading: const CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                              "https://img.freepik.com/premium-photo/memoji-happy-man-white-background-emoji_826801-6837.jpg",
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  TextStyle titleTextStyle() => const TextStyle(
        fontSize: 20,
      );
}
