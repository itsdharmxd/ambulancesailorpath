import 'package:ambulancesailorpath/componets/Login.dart';
import 'package:ambulancesailorpath/componets/MainPage.dart';
import 'package:ambulancesailorpath/componets/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(create: (_)=>UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/mainpage',
        routes: {
          '/login':(_)=>Login(),
          '/mainpage':(_)=>MainPage()
        },
      ),
    );
  }
}