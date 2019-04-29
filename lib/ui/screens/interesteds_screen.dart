import 'package:first_project/ui/screens/user_view.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//TODO - colocar botão para fechar processo com usuário
class interestedsScreen extends StatefulWidget {
  interestedsScreen({Key key, @required this.animalId}) : super(key: key);
  final String animalId;

  @override
  _interestedsScreenState createState() => _interestedsScreenState();
}

class _interestedsScreenState extends State<interestedsScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: loadInteresteds(),
      builder: (context, snapshots) {
        if (snapshots.hasData)
          return Scaffold(
              backgroundColor: const Color(0xfffafafa),
              appBar: AppBar(
                  title: StreamBuilder(
                    stream: loadAnimalData(),
                    builder: (context, animal) {
                      return Text("Interessados em ${animal.data["animalName"]}",
                          style: TextStyle(
                              color: const Color(0xff434343),
                              fontSize: 20,
                              fontFamily: 'Roboto-Medium')
                      );
                    },
                  ),
                  backgroundColor: const Color(0xffffd358),
                  leading: IconButton(icon: BackButtonIcon(),
                    color: const Color(0xff434343),
                    onPressed: () => Navigator.pop(context),
                  )),

              //drawer: returnBar(),
              body: ListView(
                  children: snapshots.data.documents
                      .map<Widget>((interested) => new GestureDetector(
                      onTap: () => print("Aaaa"), // TODO - colocar link para user view de interested.data["interestedUid"]
                      child: new Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: const Color(0xfffafafa),
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
                                    height: 20,
                                    width: 600,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(7),
                                      child: Text(
                                          interested.data["interestedName"],
                                          style: TextStyle(
                                              fontFamily:
                                              'Roboto-Medium',
                                              fontSize: 16,
                                              color: const Color(
                                                  0xff434343)))),
                                ],
                              ),
                            ]),
                          ))))
                      .toList()));
      },
    );
  }

  loadAnimalData() => Firestore.instance
      .collection('animals')
      .document(widget.animalId)
      .snapshots()
      .map((snap) => snap.data);

  loadInteresteds() => Firestore.instance
      .collection('interesteds')
      .where('animalUid', isEqualTo: widget.animalId)
      .snapshots();
}
