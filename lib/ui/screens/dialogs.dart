import 'package:flutter/material.dart';

class Dialogs {
  loading(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              elevation: 0,
              backgroundColor: const Color(0x00ffffff),
              content: SingleChildScrollView(
                  child: Center(
                    child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            const Color(0xff88c9bf))
                    ),
                  )
              )
          );
        }
    );
  }

  information(BuildContext context, String message) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erro"),
              elevation: 0,
              backgroundColor: const Color(0xffffffff),
              content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(message)
                    ],
                  )
              ),
              actions: <Widget>[
                FlatButton(
              onPressed: () => Navigator.pop(context),
                  child: Text("Ok")
          )
            ],
          );
        }
    );
  }
}