import 'package:first_project/ui/screens/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InterestedView extends StatefulWidget {
  const InterestedView({Key key, this.interestId}) : super(key: key);
  final String interestId;
  @override
  _InterestedViewState createState() => _InterestedViewState();
}

class _InterestedViewState extends State<InterestedView> {
  var dialogs = new Dialogs();
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: loadInterestData(),
      builder: (context, interest) {
        if (!interest.hasData)
          /*return new Column(
            children: <Widget>[

              //SizedBox(height: 50),
            ],
          );*/
          return Text("");
        else
          return new StreamBuilder(
              stream: loadInterestedData(interest.data["interestedUid"]),
              builder: (context, interested) {
                if (!interested.hasData)
                  /*return new Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      Text("Ainda não há usuários interessados nesse pet :("),
                    ],
                  );*/
                  return Text("");
                else
                  return Scaffold(
                    backgroundColor: const Color(0xfffafafa),

                    appBar:
                    new AppBar(
                      elevation: 0.0,
                      backgroundColor: const Color(0xffcfe9e5),
                      iconTheme: IconThemeData(color: const Color(0xff434343)),
                      title: Text("${interested.data["name"]}",
                          style: TextStyle(color: const Color(0xff434343))),
                    ),

                    body: Center(
                        child: ListView(
                            children: <Widget>[
                              Center(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 16),

                                    new Container(
                                        width: 112.0,
                                        height: 112.0,
                                        decoration: new BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(
                                                fit: BoxFit.fill,
                                                image: new NetworkImage(
                                                    "https://i.imgur.com/BoN9kdC.png")
                                            )
                                        )),

                                    SizedBox(height: 12),

                                    Text(interested.data["username"],
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Medium',
                                            fontSize: 16,
                                            color: const Color(0xff434343)
                                        )
                                    ),

                                    SizedBox(height: 36),

                                    Text("NOME COMPLETO",
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 12,
                                            color: const Color(0xff88c9bf)
                                        )
                                    ),

                                    SizedBox(height: 8),


                                    Text(interested.data["name"],
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 14,
                                            color: const Color(0xff434343)
                                        )
                                    ),

                                    SizedBox(height: 36),

                                    Text("IDADE",
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 12,
                                            color: const Color(0xff88c9bf)
                                        )
                                    ),

                                    SizedBox(height: 8),


                                    Text("${interested.data["age"]} anos",
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 14,
                                            color: const Color(0xff434343)
                                        )
                                    ),

                                    SizedBox(height: 36),


                                    Text("LOCALIZAÇÃO",
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 12,
                                            color: const Color(0xff88c9bf)
                                        )
                                    ),

                                    SizedBox(height: 8),


                                    Text("${interested.data["city"]} - ${interested.data["state"]}",
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 14,
                                            color: const Color(0xff434343)
                                        )
                                    ),

                                    SizedBox(height: 36),


                                    Text("ENDEREÇO",
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 12,
                                            color: const Color(0xff88c9bf)
                                        )
                                    ),

                                    SizedBox(height: 8),


                                    Text(interested.data["address"],
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 14,
                                            color: const Color(0xff434343)
                                        )
                                    ),

                                    SizedBox(height: 36),


                                    Text("TELEFONE",
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 12,
                                            color: const Color(0xff88c9bf)
                                        )
                                    ),

                                    SizedBox(height: 8),


                                    Text(interested.data["telephone"],
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 14,
                                            color: const Color(0xff434343)
                                        )
                                    ),

                                    SizedBox(height: 36),


                                    Text("NOME DE USUÁRIO",
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 12,
                                            color: const Color(0xff88c9bf)
                                        )
                                    ),

                                    SizedBox(height: 8),

                                    Text(interested.data["username"],
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 14,
                                            color: const Color(0xff434343)
                                        )
                                    ),

                                    SizedBox(height: 36),

                                    Text("HISTÓRICO",
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 12,
                                            color: const Color(0xff88c9bf)
                                        )
                                    ),

                                    SizedBox(height: 8),

                                    Text("Adotou 1 gato",
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 14,
                                            color: const Color(0xff434343)
                                        )
                                    ),

                                    SizedBox(height: 20),

                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: <Widget>[
                                          Divider(),
                                          SizedBox(height: 10),
                                          Text("Deseja aceitar o interesse de ${interested.data["name"]} em ${interest.data["type"].toLowerCase()} ${interest.data["animalName"]}?", textAlign: TextAlign.center),
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              MaterialButton(
                                                  color: const Color(0xff88c9bf),
                                                  textColor: const Color(0xff434343),
                                                  minWidth: 150,
                                                  height: 40,
                                                  child: Text("ACEITAR"),
                                                  onPressed: () => aceitar(interest.data["animalUid"], interest.data["interestedUid"])
                                              ),
                                              SizedBox(width: 20),
                                              MaterialButton(
                                                  color: const Color(0xff88c9bf),
                                                  textColor: const Color(0xff434343),
                                                  minWidth: 150,
                                                  height: 40,
                                                  child: Text("RECUSAR"),
                                                  onPressed: () => recusar(interest.data["animalUid"], interest.data["interestedUid"])
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ),

                                    SizedBox(height: 24)

                                  ],
                                ),
                              )
                            ])
                    )
                );
              });
      },
    );

  }

  loadInterestData() {
    return Firestore.instance
        .collection('interesteds')
        .document(widget.interestId)
        .snapshots()
        .map((snap) => snap.data);
  }

  loadInterestedData(String interestedId) {
    return Firestore.instance
        .collection('users')
        .document(interestedId)
        .snapshots()
        .map((snap) => snap.data);
  }

  aceitar(String animalID, String userUID) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Atenção"),
            elevation: 0,
            backgroundColor: const Color(0xffffffff),
            content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Tem certeza de que deseja aceitar este pedido?", textAlign: TextAlign.center)
                  ],
                )
            ),
            actions: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  child: Text("Voltar"),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              Align(
                alignment: Alignment.topRight,
                child: FlatButton(
                  child: Text("Confirmar"),
                  onPressed: () {
                    try {
                      DocumentReference aceito = Firestore.instance.collection('accepteds').document();
                      aceito.setData({'animalUid': animalID, 'userUid': userUID, 'date': Timestamp.fromDate(DateTime.now())
                      });
                      Firestore.instance.collection('animals').document(animalID).updateData({'isAvailable': false});
                      Firestore.instance.collection('animals').document(animalID).updateData({'adoptedBy': userUID});
                      Firestore.instance.collection('interesteds').where("animalUid", isEqualTo: animalID).getDocuments()
                          .then((snapshot) {
                        for (DocumentSnapshot ds in snapshot.documents){
                          ds.reference.delete();
                        }});
                      Navigator.pushNamed(context, '/adopt_pet');
                    }
                    catch(e) {
                      print("Error no pedidoo de adoção para animal: $e");
                    }
                  },
                ),
              ),

            ],
          );
        }
    );
  }

  recusar(String animalID, String userUID) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Aviso"),
            elevation: 0,
            backgroundColor: const Color(0xffffffff),
            content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("A solicitação foi recusada")
                  ],
                )
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Firestore.instance.collection('interesteds').where('animalUid', isEqualTo: animalID).where('interestedUid', isEqualTo: userUID).getDocuments().then((snapshot){
                      for (DocumentSnapshot ds in snapshot.documents){
                        ds.reference.delete();
                      }
                    });
                    Navigator.pushNamed(context, '/home');
                  } ,
                  child: Text("Ok")
              )
            ],
          );
        }
    );
  }

}

