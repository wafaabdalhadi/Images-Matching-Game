import 'package:flutter/material.dart';
import 'package:memory_game/main.dart';

showAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: Text("Cancle"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text("Yes"),
    onPressed:  () {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("You Are Win!"),
    content: Text("Try Again?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}