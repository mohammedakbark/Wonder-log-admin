import 'package:flutter/material.dart';
import 'package:wanderlog_admin/util/style.dart';

showconfirmation(
    context,
    String content,
    String greenButtonText,
    String redButtontext,
    void Function()? grrenFunction,
    void Function()? redFunction) {
   showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          content,
          style: nunitoStyle(),
        ),
        actions: [
          TextButton(
              onPressed: redFunction,
              child: Text(
                redButtontext,
                style: nunitoStyle(color: Colors.red),
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: grrenFunction,
              child: Text(
                greenButtonText,
                style: nunitoStyle(),
              ))
        ],
      );
    },
  );
}
