

import 'package:chat_app_firebase/Model/user_model.dart';
import 'package:chat_app_firebase/Utils/TextStyles/text_styles.dart';
import 'package:flutter/material.dart';

class ChatListTile extends StatelessWidget {

  const ChatListTile({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage:NetworkImage(user.image),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CircleAvatar(
              radius: 5,
              backgroundColor: user.isOnline ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
      title: Text(user.name,style: chatTitleStyle,),
      subtitle: Text(user.lastActive.toString(),style: chatSubTitleStyle,),
    );
  }
}
