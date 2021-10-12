import 'dart:convert';

import 'package:ambulancesailorpath/componets/ItemView.dart';
import 'package:ambulancesailorpath/componets/modals/item.dart';
import 'package:ambulancesailorpath/componets/providers/UserProvider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ambulancesailorpath/main.dart';
import 'package:provider/provider.dart';
import 'package:ambulancesailorpath/componets/network/ARC.dart' as ARC;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Items> lists = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var initializationSettingAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSetting =
        InitializationSettings(android: initializationSettingAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSetting);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.data['body']);
      dynamic jsonitem = jsonDecode(message.data['body']);
      print(jsonitem);
      Items newitem = Items.fromJson(jsonitem);
      int length = lists.length;
      // bool f = true;
      // for (int i = 0; i < length; i++) {
      //   print(lists[i].ambulanceno! +" "+ newitem.ambulanceno!);
      //   if (lists[i].ambulanceno == newitem.ambulanceno) {
      //     lists[i].duration = newitem.duration;
      //     f = false;
      //     break;
      //   }
      // }
      // if (f) {
        setState(() {
          lists.add(newitem);
        });
    //  }
    });

    Items item = Items();
    item.ambulanceno = "WB 12345";
    item.mobileno = "8910902686";
    item.duration = 4;
    item.from = "salkia";
    item.to = "ILS Howrah";
    lists.add(item);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Consumer<UserProvider>(
              builder: (context, user, _) =>
                  Text(context.read<UserProvider>().areaname)),
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () {
                  ARC.unregisterdevice();
                },
                child: Text("Unregister")),
            ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  ARC.registerdevice();
                },
                child: Text("Register"))
          ],
        ),
        body: ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, i) {
            return ItemView(lists[i].ambulanceno, lists[i].duration,
                lists[i].from, lists[i].to, lists[i].mobileno, i + 1 ,lists,this.setState);
          },
        ),
      ),
    );
  }
}
