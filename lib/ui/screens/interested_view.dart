import 'package:first_project/ui/screens/animal_index.dart';
import 'package:first_project/ui/screens/my_pets.dart';
import 'package:first_project/ui/screens/user_view.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/session.dart';

class InterestedView extends StatefulWidget {
  const InterestedView({Key key, this.interestId}) : super(key: key);
  final String interestId;
  @override
  _InterestedViewState createState() => _InterestedViewState();
}

class _InterestedViewState extends State<InterestedView> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: loadInterestData(),
      builder: (context, interest) {
        if (!interest.hasData)
          return new Column(
            children: <Widget>[
              SizedBox(height: 50),
              Text("Ainda não há usuários interessados nesse pet :("),
            ],
          );
        else
          return new StreamBuilder(
              stream: loadInterestedData(interest.data["interestedUid"]),
              builder: (context, interested) {
                if (!interested.hasData)
                  return new Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      Text("Ainda não há usuários interessados nesse pet :("),
                    ],
                  );
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
                                                  onPressed: () => print("editar perfil")
                                              ),
                                              SizedBox(width: 20),
                                              MaterialButton(
                                                  color: const Color(0xff88c9bf),
                                                  textColor: const Color(0xff434343),
                                                  minWidth: 150,
                                                  height: 40,
                                                  child: Text("RECUSAR"),
                                                  onPressed: () => print("editar perfil")
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

}

