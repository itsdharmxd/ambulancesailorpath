import 'package:ambulancesailorpath/componets/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controller = TextEditingController();
  String ambulaceno = '', drivername = '';

  submit() async {
    print(ambulaceno + " " + drivername);
    bool c = false;
    await CoolAlert.show(
        widget: Text("Area :${this.ambulaceno}\nName :${this.drivername}"),
        context: context,
        type: CoolAlertType.confirm,
        onConfirmBtnTap: () {
          c = true;
          Navigator.pop(context);
        });
   
    if (!c) return;
    Provider.of<UserProvider>(context, listen: false)
        .setareaname(ambulaceno);
    Provider.of<UserProvider>(context, listen: false).setguardname(drivername);
   
    Navigator.pushNamed(context, '/mainpage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credentials'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            TextFormField(
              onChanged: (String s) {
                this.ambulaceno = s;
              },
              maxLength: 20,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.landscape_outlined,
                  color: Colors.red,
                ),
                labelText: 'Area ',
                labelStyle: TextStyle(
                  color: Colors.teal,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
              ),
            ),
            TextFormField(
              onChanged: (String s) {
                this.drivername = s;
              },
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                labelText: 'Guard name',
                labelStyle: TextStyle(
                  color: Colors.teal,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: submit,
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
