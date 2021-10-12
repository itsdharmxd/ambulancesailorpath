import 'dart:async';

import 'package:ambulancesailorpath/componets/modals/item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeCounter extends StatefulWidget {
  int duration = 0;
  List<Items> lists;
  dynamic func;
  int index;

  TimeCounter(
    this.duration,
    this.lists,
    this.func,
    this.index
  );

  @override
  _TimeCounterState createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (time) {
      if (mounted)
        setState(() {
          if (this.widget.duration > 0)
            this.widget.duration--;
          else {
            this.widget.func(() {
              this.widget.lists.removeAt(this.widget.index);
            });
          }
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        "${(this.widget.duration ~/ (60 * 60)).toString()} hours ${(this.widget.duration ~/ 60).toString()} minutes ${(this.widget.duration % 60).toString()} seconds",
        style: GoogleFonts.anton(fontSize: 15.0, color: Colors.green));
  }
}
