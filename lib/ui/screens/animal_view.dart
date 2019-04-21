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
    return Scaffold(
        backgroundColor: const Color(0xfffafafa),

        appBar:
        new AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xffcfe9e5),
          iconTheme: IconThemeData(color: const Color(0xff434343)),
          title: Text("Meu perfil", style: TextStyle(color: const Color(0xff434343))),
        ),

        drawer: returnBar(),

        body: callBody(),
    );
  }

  Widget returnBar(){
    if (session.currentUser == null){
      return SizedBox(height: 0);
    }
    else{
      return new Drawer(
          child: new Column(children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(session.userData["name"]),
              accountEmail: Text(session.currentUser.email),
              currentAccountPicture: new Container(
                  width: 112.0,
                  height: 112.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage("https://i.imgur.com/BoN9kdC.png")
                      )
                  )),
              decoration: BoxDecoration(color: const Color(0xff88c9bf)),
            ),

            new ListTile(
              title: new Text('Meu perfil'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserView()));

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
          ]
          )
      );
    }
  }

  Widget callBody() {
    if (animalData.isEmpty) {
      setState(() {
        print("ta vazio");
        loadAnimalData();
      });
    }
    else {
      return new Container(
          child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[

                      new Container(
                          width: 112.0,
                          height: 112.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage("https://i.imgur.com/BoN9kdC.png")
                              )
                          )),

                      SizedBox(height: 12),

                      Text(animalData["animalName"][0],
                        style: TextStyle(
                            fontFamily: 'Roboto-Medium',
                            fontSize: 16,
                            color: const Color(0xff434343)
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8),

                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("SEXO",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      color: const Color(0xff88c9bf)
                                  )
                              ),
                              Text(animalData["sex"][0],
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 14,
                                      color: const Color(0xff434343)
                                  )
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: <Widget>[
                              Text("PORTE",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      color: const Color(0xff88c9bf)
                                  )
                              ),
                              Text(animalData["size"][0],
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 14,
                                      color: const Color(0xff434343)
                                  )
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: <Widget>[
                              Text("IDADE",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      color: const Color(0xff88c9bf)
                                  )
                              ),
                              Text(animalData["age"][0],
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 14,
                                      color: const Color(0xff434343)
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("LOCALIZAÇÃO",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      color: const Color(0xff88c9bf)
                                  )
                              ),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text("${ownerData["city"]} - ${ownerData["state"]}",
                                      style: TextStyle(
                                          fontFamily: 'Roboto-Regular',
                                          fontSize: 14,
                                          color: const Color(0xff434343)
                                      )
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      // --------------------------------------------------- //

                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("CASTRADO",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      color: const Color(0xff88c9bf)
                                  )
                              ),
                              Text(animalData["health"].contains("Castrado") ? "Sim" : "Não",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 14,
                                      color: const Color(0xff434343)
                                  )
                              ),
                              SizedBox(height: 10),

                              Text("VACINADO",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      color: const Color(0xff88c9bf)
                                  )
                              ),
                              Text(animalData["health"].contains("Vacinado") ? "Sim" : "Não",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 14,
                                      color: const Color(0xff434343)
                                  )
                              ),
                            ],
                          ),
                          SizedBox(width: 20),

                          Column(
                            children: <Widget>[
                              Text("VERMIFUGADO",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      color: const Color(0xff88c9bf)
                                  )
                              ),
                              Text(animalData["health"].contains("Vermifugado") ? "Sim" : "Não",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 14,
                                      color: const Color(0xff434343)
                                  )
                              ),
                              SizedBox(height: 10),

                              Text("DOENÇAS",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      color: const Color(0xff88c9bf)
                                  )
                              ),
                              Text(animalData["health"].contains("Doente") ? animalData["illness"][0] : "Nenhuma",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 14,
                                      color: const Color(0xff434343)
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      // ----------------------------------------------------//

                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("TEMPERAMENTO",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      color: const Color(0xff88c9bf)
                                  )
                              ),
                            ],
                          ),
                          printCharacteristics(),
                        ],
                      ),
                      SizedBox(height: 20),

                      // ----------------------------------------------------//

                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("EXIGÊNCIAS DO DOADOR",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      color: const Color(0xff88c9bf)
                                  )
                              ),
                            ],
                          ),
                          printRequirements(),
                        ],
                      ),
                      SizedBox(height: 20),

                      // ----------------------------------------------------//

                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("MAIS SOBRE ${animalData["animalName"][0].toUpperCase()}",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      color: const Color(0xff88c9bf)
                                  )
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width*0.8,
                                child: Text(animalData["about"][0],
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 14,
                                      color: const Color(0xff434343)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      MaterialButton(
                          color: const Color(0xff88c9bf),
                          textColor: const Color(0xff434343),
                          minWidth: 280,
                          height: 40,
                          child: Text("EDITAR PERFIL"),
                          onPressed: () {
                            setState(() {
                              loadAnimalData();
                            });
                          }
                      ),

                      SizedBox(height: 24)

                    ],
                  ),
                )
              ])
      );
    }
  }

  // TODO - arrumar forma de buscar dados do BD (sempre retorna null sem hot reload)
  loadAnimalData(){
    print("Trying to load animal data...");
    try {
      Firestore.instance
          .collection('animals')
          .document(widget.animalId).snapshots().listen((doc) {
            animalData["about"] = [doc["about"]];
            doc["adoptionRequirements"] != null ? animalData["adoptionRequirements"] = doc["adoptionRequirements"].cast<String>() : animalData["adoptionRequirements"] = [""];
            animalData["age"] = [doc["age"]];
            animalData["animalName"] = [doc["animalName"]];
            doc["characteristics"] != null ? animalData["characteristics"] = doc["characteristics"].cast<String>() : animalData["characteristics"] = [""];
            doc["financialAid"] != null ? animalData["financialAid"] = doc["financialAid"].cast<String>() : animalData["financialAid"] = [""];
            doc["health"] != null ? animalData["health"] = doc["health"].cast<String>() : animalData["health"] = [""];
            doc["helpOptions"] != null ? animalData["helpOptions"] = doc["helpOptions"].cast<String>() : animalData["helpOptions"] = [""];
            animalData["illness"] = [doc["illness"]];
            animalData["medicine"] = [doc["medicine"]];
            animalData["objects"] = [doc["objects"]];
            animalData["sex"] = [doc["sex"]];
            animalData["size"] = [doc["size"]];
            animalData["species"] = [doc["species"]];
            doc["sponsorshipRequirements"] != null ? animalData["sponsorshipRequirements"] = doc["sponsorshipRequirements"].cast<String>() : animalData["sponsorshipRequirements"] = [""];
            animalData["trackingPeriod"] = [doc["trackingPeriod"]];
            animalData["userUid"] = [doc["userUid"]];
          });

      Firestore.instance
        .collection('users')
        .document(animalData["userUid"][0]).snapshots().listen((user) {
          ownerData["city"] = user["city"];
          ownerData["state"] = user["state"];
        });

      print("Data from ${animalData["animalName"][0]} loaded.");
    }
    catch(e) {
      print("Error loading data from animal: " + e.toString());
    }
  }

  Widget printCharacteristics() {
    return new Column(children: animalData["characteristics"].map((item) => new Row(children: <Widget> [new Text(item,
        style: TextStyle(
            fontFamily: 'Roboto-Regular',
            fontSize: 14,
            color: const Color(0xff434343)
        )
    )])).toList());
  }

  Widget printRequirements() {
    return new Column(children: animalData["adoptionRequirements"].map((item) => new Row(children: <Widget> [new Text(item,
        style: TextStyle(
            fontFamily: 'Roboto-Regular',
            fontSize: 14,
            color: const Color(0xff434343)
        )
    )])).toList());
  }
}

