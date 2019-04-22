import 'package:first_project/ui/screens/home.dart';
import 'package:first_project/ui/screens/user_view.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/session.dart';

class AnimalView extends StatefulWidget {
  final String animalId;

  AnimalView({Key key, @required this.animalId}) : super(key: key);

  @override
  _AnimalViewState createState() => _AnimalViewState();
}

class _AnimalViewState extends State<AnimalView> {
  Map<String, List<String>> animalData = Map<String, List<String>>();
  Map<String, String> ownerData = Map<String, String>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: loadAnimalData(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return Scaffold(
              backgroundColor: const Color(0xfffafafa),

              appBar: AppBar(
                title: Text(snapshot.data["animalName"],
                    style: TextStyle(
                      color: const Color(0xff434343),
                      fontSize: 20,
                      fontFamily: 'Roboto-Medium')
                ),
                backgroundColor: const Color(0xffffd358),
                leading: IconButton(icon: BackButtonIcon(),
                  color: const Color(0xff434343),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
              )),

              drawer: returnBar(),
              body: Container(
                  child: ListView(children: <Widget>[
                    new Stack(
                      children: <Widget>[
                        new Column(
                          children: <Widget>[
                            new Container(
                                height: 250,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        alignment: FractionalOffset.topCenter,
                                        image: new NetworkImage(
                                            "https://clubeparacachorros.com.br/wp-content/uploads/2016/01/golden-retriever-baba.png")))
                            ),

                            Padding(
                              padding: EdgeInsets.all(30),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      snapshot.data["animalName"],
                                      style: TextStyle(
                                          fontFamily: 'Roboto-Medium',
                                          fontSize: 16,
                                          color: const Color(0xff434343)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  SizedBox(height: 20),

                                  Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text("SEXO",
                                            style: TextStyle(
                                                fontFamily: 'Roboto-Regular',
                                                fontSize: 12,
                                                color: const Color(0xffffd358)),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 5),
                                          Text(snapshot.data["sex"],
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 14,
                                                  color: const Color(0xff434343))),
                                        ],
                                      ),
                                      SizedBox(width: 70),
                                      Column(
                                        children: <Widget>[
                                          Text("PORTE",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 12,
                                                  color: const Color(0xffffd358))),
                                          SizedBox(height: 5),
                                          Text(snapshot.data["size"],
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 14,
                                                  color: const Color(0xff434343))),
                                        ],
                                      ),
                                      SizedBox(width: 70),
                                      Column(
                                        children: <Widget>[
                                          Text("IDADE",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 12,
                                                  color: const Color(0xffffd358))),
                                          SizedBox(height: 5),
                                          Text(snapshot.data["age"],
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 14,
                                                  color: const Color(0xff434343))),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 20),

                                  Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text("LOCALIZAÇÃO",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 12,
                                                  color: const Color(0xffffd358))),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                  "${ownerData["city"]} - ${ownerData["state"]}",
                                                  style: TextStyle(
                                                      fontFamily: 'Roboto-Regular',
                                                      fontSize: 14,
                                                      color: const Color(0xff434343))),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10),
                                  Divider(color: const Color(0xffe0e0e0)),
                                  SizedBox(height: 10),

                                  Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text("CASTRADO",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 12,
                                                  color: const Color(0xffffd358))),
                                          SizedBox(height: 5),
                                          Text(
                                              snapshot.data["health"].contains("Castrado")
                                                  ? "Sim"
                                                  : "Não",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 14,
                                                  color: const Color(0xff434343))),
                                          SizedBox(height: 10),
                                          Text("VACINADO",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 12,
                                                  color: const Color(0xffffd358))),
                                          SizedBox(height: 5),
                                          Text(
                                              snapshot.data["health"].contains("Vacinado")
                                                  ? "Sim"
                                                  : "Não",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 14,
                                                  color: const Color(0xff434343))),
                                        ],
                                      ),
                                      SizedBox(width: 100),
                                      Column(
                                        children: <Widget>[
                                          Text("VERMIFUGADO",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 12,
                                                  color: const Color(0xffffd358))),
                                          SizedBox(height: 5),
                                          Text(
                                              snapshot.data["health"]
                                                  .contains("Vermifugado")
                                                  ? "Sim"
                                                  : "Não",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 14,
                                                  color: const Color(0xff434343))),
                                          SizedBox(height: 10),
                                          Text("DOENÇAS",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 12,
                                                  color: const Color(0xffffd358))),
                                          SizedBox(height: 5),
                                          Text(
                                              snapshot.data["health"].contains("Doente")
                                                  ? snapshot.data["illness"]
                                                  : "Nenhuma",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 14,
                                                  color: const Color(0xff434343))),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10),
                                  Divider(color: const Color(0xffe0e0e0)),
                                  SizedBox(height: 10),

                                  Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text("TEMPERAMENTO",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 12,
                                                  color: const Color(0xffffd358))),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                          children: snapshot.data["characteristics"]
                                              .map<Widget>((item) =>
                                          new Row(children: <Widget>[
                                            new Text(item,
                                                style: TextStyle(
                                                    fontFamily: 'Roboto-Regular',
                                                    fontSize: 14,
                                                    color: const Color(0xff434343)))
                                          ]))
                                              .toList()),
                                    ],
                                  ),

                                  SizedBox(height: 10),
                                  Divider(color: const Color(0xffe0e0e0)),
                                  SizedBox(height: 10),

                                  Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text("EXIGÊNCIAS DO DOADOR",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 12,
                                                  color: const Color(0xffffd358))),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                          children: snapshot.data["adoptionRequirements"]
                                              .map<Widget>((item) =>
                                          new Row(children: <Widget>[
                                            new Text(item,
                                                style: TextStyle(
                                                    fontFamily: 'Roboto-Regular',
                                                    fontSize: 14,
                                                    color: const Color(0xff434343))),
                                            new SizedBox(height: 25)
                                          ]))
                                              .toList()),
                                    ],
                                  ),

                                  SizedBox(height: 10),
                                  Divider(color: const Color(0xffe0e0e0)),
                                  SizedBox(height: 10),

                                  Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "MAIS SOBRE ${snapshot.data["animalName"].toUpperCase()}",
                                            style: TextStyle(
                                                fontFamily: 'Roboto-Regular',
                                                fontSize: 12,
                                                color: const Color(0xffffd358)),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.8,
                                            child: Text(
                                              snapshot.data["about"],
                                              style: TextStyle(
                                                  fontFamily: 'Roboto-Regular',
                                                  fontSize: 14,
                                                  color: const Color(0xff434343)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40),

                                  MaterialButton(
                                      color: const Color(0xfffdcf58),
                                      textColor: const Color(0xff434343),
                                      minWidth: 280,
                                      height: 40,
                                      child: Text("PRETENDO ADOTAR"),
                                      onPressed: () {
                                        setState(() {
                                          loadAnimalData();
                                        });
                                      }),

                                  SizedBox(height: 24)
                                ],
                              ),
                            ),
                          ],
                        ),

                        new Positioned(
                            child: new FloatingActionButton(
                                backgroundColor: const Color(0xfffafafa),
                                child: Icon(Icons.favorite_border, color: const Color(0xff434343)),
                                onPressed: () => print("aaa")
                            ),
                          left: 330,
                          top: 220,
                        ),
                      ],
                    ),
              ])));
      },
    );
  }

  Widget returnBar() {
    if (session.currentUser == null) {
      return SizedBox(height: 0);
    } else {
      return new Drawer(
          child: new Column(children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: Text(session.userData["name"]),
          accountEmail: Text(session.currentUser.email),
          currentAccountPicture: new Container(
              width: 360.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://i.imgur.com/BoN9kdC.png")))),
          decoration: BoxDecoration(color: const Color(0xffffd358)),
        ),
        new ListTile(
          title: new Text('Adotar'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => UserView()));
          },
        ),
        new Divider(),
        new ListTile(
          title: new Text('Home'),
          onTap: () {
            this.setState(() {
              Navigator.pushNamed(context, '/home');
            });
          },
        ),
        new Divider(),
      ]));
    }
  }

  loadAnimalData() {
    return Firestore.instance
        .collection('animals')
        .document(widget.animalId)
        .snapshots()
        .map((snap) => snap.data);
  }

  Widget printCharacteristics() {
    return new Column(
        children: animalData["characteristics"]
            .map((item) => new Row(children: <Widget>[
                  new Text(item,
                      style: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 14,
                          color: const Color(0xff434343)))
                ]))
            .toList());
  }

  Widget printRequirements() {
    return new Column(
        children: animalData["adoptionRequirements"]
            .map((item) => new Row(children: <Widget>[
                  new Text(item,
                      style: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 14,
                          color: const Color(0xff434343)))
                ]))
            .toList());
  }
}
