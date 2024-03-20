

import 'package:chat_app_firebase/Model/user_model.dart';
import 'package:chat_app_firebase/Provider/firebase_provider.dart';
import 'package:chat_app_firebase/Utils/Widgets/appbar.dart';
import 'package:chat_app_firebase/Utils/Widgets/chat_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final userData = [
    UserModel(uid: '1',name: "nithin",email: 'codernta@gmail.com',image: 'https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600nw-1714666150.jpg', isOnline: true, lastActive: DateTime.now()
    ),
    UserModel(uid: '2',name: "cristiano",email: 'cr7@gmail.com',image: 'https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600nw-1714666150.jpg', isOnline: false, lastActive: DateTime.now()
    ),
    UserModel(uid: '3',name: "messi",email: 'messi@gmail.com',image: 'https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600nw-1714666150.jpg', isOnline: true, lastActive: DateTime.now()
    ),
    UserModel(uid: '4',name: "hazard",email: 'hazard@gmail.com',image: 'https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600nw-1714666150.jpg', isOnline: false, lastActive: DateTime.now()
    ),
  ];


  @override
  void initState() {
    super.initState();
    Provider.of<FirebaseProvider>(context,listen: false).getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBars,
      body: homePageBody(),
    );
  }

  homePageBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        child: Consumer<FirebaseProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
                itemBuilder: (context,index){
                return ChatListTile(user: provider.users[index],);
                }, separatorBuilder: (context,int index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(height: 1,color: Colors.grey.shade200,),
                  );
            }, itemCount: provider.users.length);
          }
        ),
      ),
    );
  }
}
