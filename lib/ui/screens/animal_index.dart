import 'package:first_project/ui/screens/animal_view.dart';
import 'package:first_project/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalIndexScreen extends StatefulWidget {
  AnimalIndexScreen({Key key, @required this.tipo}) : super(key: key);
  final String tipo;

  @override
  _AnimalIndexScreenState createState() => _AnimalIndexScreenState();
}

class _AnimalIndexScreenState extends State<AnimalIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: loadAnimalsData(),
      builder: (context, snapshots) {
        if (snapshots.hasData)
          return Scaffold(
              backgroundColor: const Color(0xfffafafa),
              appBar: AppBar(
                  title: Text(chooseTitle(),
                      style: TextStyle(
                          color: const Color(0xff434343),
                          fontSize: 20,
                          fontFamily: 'Roboto-Medium')),
                  backgroundColor: const Color(0xffffd358),
                  leading: IconButton(
                    icon: BackButtonIcon(),
                    color: const Color(0xff434343),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home())),
                  )),
              body: ListView(
                  children: snapshots.data.documents
                      .map<Widget>((animal) => new GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AnimalView(animalId: animal.documentID, tipo: widget.tipo))),
                          child: new Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: const Color(0xfffafafa),
                              child: AspectRatio(
                                  aspectRatio: 344 / 264,
                                  child: Container(
                                    child: Column(children: <Widget>[
                                      new Stack(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                                color: const Color(0xfffee29b),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        const Radius.circular(
                                                            10),
                                                    topRight:
                                                        const Radius.circular(
                                                            10))),
                                            height: 35,
                                            width: 600,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.all(7),
                                              child: Text(
                                                  animal.data["animalName"],
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'Roboto-Medium',
                                                      fontSize: 16,
                                                      color: const Color(
                                                          0xff434343)))),
                                          Positioned(
                                            top: 5,
                                            left: 370,
                                            child: new Icon(
                                              Icons.favorite_border,
                                              color: const Color(0xff434343),
                                            ),
                                          )
                                        ],
                                      ),
                                      new Container(
                                          height: 220,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  alignment: FractionalOffset
                                                      .topCenter,
                                                  image: new NetworkImage(
                                                      animal.data["url"])))),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 40,
                                            right: 40,
                                            top: 5,
                                            bottom: 5),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Text(animal.data["sex"]
                                                    .toUpperCase())
                                              ],
                                            ),
                                            SizedBox(width: 60),
                                            Column(
                                              children: <Widget>[
                                                Text(animal.data["age"]
                                                    .toUpperCase())
                                              ],
                                            ),
                                            SizedBox(width: 60),
                                            Column(
                                              children: <Widget>[
                                                Text(animal.data["size"]
                                                    .toUpperCase())
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                          child: Text(
                                              "${animal.data["neighbourhood"].toUpperCase()} - ${animal.data["state"].toUpperCase()}"))
                                    ]),
                                  )))))
                      .toList()));
      },
    );
  }

  loadAnimalsData() => Firestore.instance
      .collection('animals')
      .where('registerType', arrayContains: widget.tipo)
      .snapshots();

  String chooseTitle() {
    if (widget.tipo == "ADOTAR")
      return "Adotar";
    else if (widget.tipo == "APADRINHAR")
      return "Apadrinhar";
    else
      return "Ajudar";
  }
}
