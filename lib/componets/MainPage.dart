import 'package:ambulancesailorpath/componets/ItemView.dart';
import 'package:ambulancesailorpath/componets/modals/item.dart';
import 'package:ambulancesailorpath/componets/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Consumer<UserProvider>(   builder:(context ,user,_)=> Text(context.read<UserProvider>().areaname)),
        actions: [
          ElevatedButton(
            style: ButtonStyle(

            ),
            onPressed:(
         

            ){}, child:   Text("Register"))
        ],
      ),
      body: ListView.builder(
        itemCount: lists.length,
        itemBuilder: (context, i) {
          return ItemView(lists[i].ambulanceno, lists[i].duration,
              lists[i].from, lists[i].to, lists[i].mobileno, i+1);
        },
      ),
    );
  }
}
