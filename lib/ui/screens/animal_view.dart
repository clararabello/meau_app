import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_project/ui/screens/animal_adopt_success.dart';
import 'package:first_project/ui/screens/animal_index.dart';
import 'package:first_project/ui/screens/animal_register_success.dart';
import 'package:first_project/ui/screens/interesteds_screen.dart';
import 'package:first_project/ui/screens/user_view.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/session.dart';

class AnimalView extends StatefulWidget {
  final String animalId, tipo;

  AnimalView({Key key, @required this.animalId, this.tipo}) : super(key: key);

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
                  onPressed: () => Navigator.pop(context),
              )),

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
                                            snapshot.data["url"])))
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
                                                  "${snapshot.data["neighbourhood"]} - ${snapshot.data["state"]}",
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
                                      showDemands(snapshot),
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

                                  showButtons(snapshot),
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
        else
          return new Container();
      },
    );
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

  showButtons(AsyncSnapshot animal) {
    if (session.currentUser != null && animal.data["userUid"] == session.currentUser.uid && animal.data["isAvailable"])
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
              color: const Color(0xfffdcf58),
              textColor: const Color(0xff434343),
              minWidth: 148,
              height: 40,
              child: Text("VER INTERESSADOS", style: TextStyle(fontSize: 12)),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => interestedsScreen(animalId: widget.animalId))),
          ),
          SizedBox(width: 16),
          MaterialButton(
              color: const Color(0xfffdcf58),
              textColor: const Color(0xff434343),
              minWidth: 148,
              height: 40,
              child: Text("REMOVER PET", style: TextStyle(fontSize: 12)),
              onPressed: () => print("remover pet") //TODO - implementar remover pet
          )
        ],
      );
    else {
      if (!animal.data["isAvailable"])
        return Text("Este pet já foi adotado! ;)", textAlign: TextAlign.center);
    if (session.currentUser != null)
        return FutureBuilder(
          future: interestAlreadyExist(session.currentUser.uid, widget.animalId),
          builder: (context, AsyncSnapshot<bool> result) {
            if (!result.hasData)
              return Container(); // future still needs to be finished (loading)
            if (result.data) // result.data is the returned bool from doesNameAlreadyExists
              return Text("Você já mostrou interesse por esse pet! Agora é só esperar a resposta do dono ;)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontSize: 14,
                  color: const Color(0xff434343)));
            else
              return MaterialButton(
                  color: const Color(0xfffdcf58),
                  textColor: const Color(0xff434343),
                  minWidth: 280,
                  height: 40,
                  child: Text("PRETENDO ${widget.tipo}", style: TextStyle(fontSize: 12)),
                  onPressed: () async {
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
                                    Text("Tem certeza de que deseja fazer um pedido para ${widget.tipo.toLowerCase()} este pet?", textAlign: TextAlign.center)
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
                                      DocumentReference interested = Firestore.instance.collection(
                                          'interesteds').document();
                                      interested.setData({
                                        'interestedUid': session.currentUser.uid,
                                        'animalUid': widget.animalId,
                                        'type': widget.tipo,
                                        'interestedName': session.userData["name"],
                                        'animalName': animal.data["animalName"]
                                      });

                                      print("Interest registered.");
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => AnimalAdoptSuccess()));
                                    }
                                    catch (e) {
                                      print("Error registering interest: $e");
                                    }
                                  },
                                ),
                              ),

                            ],
                          );
                        }
                    );
                  }
              );
          },
        );
      else
        return new Column(
          children: <Widget>[
            Text("Você precisa estar logado para mostrar interesse em um pet!", textAlign: TextAlign.center),
            FlatButton(
              textColor: const Color(0xff88c9bf),
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text("login")
            ),
          ],
        );
    }
  }

  Future<bool> interestAlreadyExist(String person, String animal) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('interesteds')
        .where('interestedUid', isEqualTo: person)
        .where('animalUid', isEqualTo: animal)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    return documents.length >= 1;
  }

  Widget showDemands(AsyncSnapshot animal) {
    return Column(
      children: <Widget>[
        showAjudar(animal),
        showAdotar(animal),
        showApadrinhar(animal)
      ],
    );
  }

  showAjudar(AsyncSnapshot animal) {
    if (animal.data["registerType"].contains("AJUDAR"))
      return new Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("EXIGÊNCIAS PARA AJUDAR",
                  style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 12,
                      color: const Color(0xffffd358))),
            ],
          ),
          SizedBox(height: 5),
          Column(
              children: animal.data["helpOptions"]
                  .map<Widget>((item) =>
              new Row(children: <Widget>[
                new Text(item,
                    style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontSize: 14,
                        color: const Color(0xff434343))),
                new SizedBox(height: 25)
              ]))
                  .toList()
          ),
        ],
      );
    else
      return new SizedBox(height: 0);
  }

  showAdotar(AsyncSnapshot animal) {
    if (animal.data["registerType"].contains("ADOTAR"))
      return new Column(
        children: <Widget>[
          animal.data["registerType"].contains("AJUDAR") ? SizedBox(height: 15) : SizedBox(height: 0),
          Row(
            children: <Widget>[
              Text("EXIGÊNCIAS PARA ADOTAR",
                  style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 12,
                      color: const Color(0xffffd358))),
            ],
          ),
          SizedBox(height: 5),
          Column(
              children: animal.data["adoptionRequirements"]
                  .map<Widget>((item) =>
              new Row(children: <Widget>[
                new Text(item,
                    style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontSize: 14,
                        color: const Color(0xff434343))),
                new SizedBox(height: 25)
              ]))
                  .toList()
          ),
        ],
      );
    else
      return new SizedBox(height: 0);
  }

  showApadrinhar(AsyncSnapshot animal) {
    if (animal.data["registerType"].contains("APADRINHAR"))
      return new Column(
        children: <Widget>[
          animal.data["registerType"].contains("AJUDAR") || animal.data["registerType"].contains("ADOTAR") ? SizedBox(height: 15) : SizedBox(height: 0),
          Row(
            children: <Widget>[
              Text("EXIGÊNCIAS PARA APADRINHAR",
                  style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 12,
                      color: const Color(0xffffd358))),
            ],
          ),
          SizedBox(height: 5),
          Column(
              children: animal.data["sponsorshipRequirements"]
                  .map<Widget>((item) =>
              new Row(children: <Widget>[
                new Text(item,
                    style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontSize: 14,
                        color: const Color(0xff434343))),
                new SizedBox(height: 25)
              ]))
                  .toList()
          ),
        ],
      );
    else
      return new SizedBox(height: 0);
  }
}
