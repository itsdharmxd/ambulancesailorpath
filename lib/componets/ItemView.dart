import 'package:ambulancesailorpath/componets/TimeCounter.dart';
import 'package:ambulancesailorpath/componets/modals/item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// class ItemView extends StatefulWidget {
//   final String? ambulanceno;
//   final String? from;
//   final String? to;
//   final String? mobileno;
//   final int? duration;
//   int no;
//   ItemView(this.ambulanceno, this.duration, this.from, this.to, this.mobileno ,this.no);

//   @override
//   _ItemViewState createState() => _ItemViewState();
// }

// class _ItemViewState extends State<ItemView> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(height: MediaQuery.of(context).size.width * 0.4 ,

//       margin: EdgeInsets.only(top: 10),
//       decoration: BoxDecoration(
//         color: Colors.grey[400],
//         borderRadius: BorderRadius.circular(20),
//       ),
//       // height: MediaQuery.of(context).size.height * 0.15,
//       child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Container(

//           color: Colors.black,
//           width: MediaQuery.of(context).size.width * 0.07,
//           child: Center(child: Text(this.widget.no.toString(),style: TextStyle(color: Colors.white),),),
//         ),
//         Padding(padding: EdgeInsets.only(left:10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text("Vehicle : "+ this.widget.ambulanceno!,
//                style: GoogleFonts.anton(
//                fontSize: 20.0
//                )
//               ),

//               Text("from : " + this.widget.from!,
//               style: GoogleFonts.robotoSlab(

//               )
//               ),

//               Text("to : " + this.widget.to!, style: GoogleFonts.robotoSlab()),

//               Text("Cell No : " + this.widget.mobileno!,
//                   style: GoogleFonts.robotoSlab()),
//              Row(children:[ Text("Time : ", style: GoogleFonts.anton(fontSize: 15.0)) ,
//              Text( "${(this.widget.duration! ~/ 60).toString() } hours ${(this.widget.duration! % 60).toString()} minutes",
//              style: GoogleFonts.anton(fontSize: 15.0,
//              color: Colors.green
//              )
//              )]),

//             ],
//            ),
//         )
//       ]),
//     );
//   }
// }

class ItemView extends StatelessWidget {
  final List<Items> lists;
  final String? ambulanceno;
  final String? from;
  final String? to;
  final String? mobileno;
  final int? duration;
  final int no;
final  dynamic func;
  ItemView(
    this.ambulanceno,
    this.duration,
    this.from,
    this.to,
    this.mobileno,
    this.no,
    this.lists,
    this.func
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.4,

      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(20),
      ),
      // height: MediaQuery.of(context).size.height * 0.15,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width * 0.07,
          child: Center(
            child: Text(
              no.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Vehicle : " + ambulanceno!,
                  style: GoogleFonts.anton(fontSize: 20.0)),
              Text("from : " + from!, style: GoogleFonts.robotoSlab()),
              Text("to : " + to!, style: GoogleFonts.robotoSlab()),
              Text("Cell No : " + mobileno!, style: GoogleFonts.robotoSlab()),
              Row(children: [
                Text("Time : ", style: GoogleFonts.anton(fontSize: 15.0)),
                TimeCounter(duration!,this.lists,this.func,this.no-1)
              ]),
            ],
          ),
        )
      ]),
    );
  }
}
