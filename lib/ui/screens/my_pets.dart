import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/session.dart';
import 'package:first_project/ui/screens/animal_index.dart';
import 'package:first_project/ui/screens/animal_view.dart';
import 'package:first_project/ui/screens/home.dart';
import 'package:first_project/ui/screens/user_view.dart';
import 'package:flutter/material.dart';

class MyPetsScreen extends StatefulWidget {
  @override
  _MyPetsScreenState createState() => _MyPetsScreenState();
}

class _MyPetsScreenState extends State<MyPetsScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: loadMyAnimalsData(),
      builder: (context, snapshots) {
        if (snapshots.hasData)
          return Scaffold(
              backgroundColor: const Color(0xfffafafa),
              appBar: AppBar(
                  title: Text("Meus Pets",
                      style: TextStyle(
                          color: const Color(0xff434343),
                          fontSize: 20,
                          fontFamily: 'Roboto-Medium')),
                  backgroundColor: const Color(0xff589b9b),
                iconTheme: IconThemeData(color: const Color(0xff434343)),
              ),
              drawer: returnBar(),
              body: ListView(
                  children: snapshots.data.documents
                      .map<Widget>((animal) => new GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AnimalView(animalId: animal.documentID, tipo: ""))),
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
                                            color: const Color(0xffcfe9e5),
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
                                          Icons.error,
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
                                    padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                                      child:
                                      Column(children: <Widget>[
                                        FutureBuilder(
                                          future: numberOfInteresteds(animal.documentID),
                                          builder: (context, AsyncSnapshot<int> result) {
                                            if (!result.hasData)
                                              return Container(); // future still needs to be finished (loading)
                                            else
                                              return Text("${result.data} USUÁRIO(S) INTERESSADO(S)");
                                              //SizedBox(height: 3),
                                              //Text("${typeOfInterest(animal.documentID)}")
                                          },
                                        ),
                                      ]),
                                  ),
                                ]),
                              )))))
                      .toList()));
      },
    );
  }

  Widget returnBar() {
    if (session.currentUser == null) {
      return new Drawer(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text("Você ainda não está logado :'("),
                )
              ]));
    } else {
      if (session.userData.isNotEmpty)
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
                            image: new NetworkImage(
                                "https://i.imgur.com/BoN9kdC.png")))),
                decoration: BoxDecoration(color: const Color(0xff88c9bf)),
              ),
              new ListTile(
                title: new Text('Meu perfil'),
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
              new ListTile(
                title: new Text('Cadastrar um Pet'),
                onTap: () {
                  this.setState(() {
                    Navigator.pushNamed(context, '/animal_register');
                  });
                },
              ),
              new Divider(),
              new ListTile(
                title: new Text('Adotar um Pet'),
                onTap: () {
                  this.setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AnimalIndexScreen(tipo: 'ADOTAR')));
                  });
                },
              ),
              new Divider(),
              new ListTile(
                title: new Text('Ajudar um Pet'),
                onTap: () {
                  this.setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AnimalIndexScreen(tipo: 'AJUDAR')));
                  });
                },
              ),
              new Divider(),
              new ListTile(
                title: new Text('Apadrinhar um Pet'),
                onTap: () {
                  this.setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AnimalIndexScreen(tipo: 'APADRINHAR')));
                  });
                },
              ),

              new Divider(),
              new ListTile(
                title: new Text('Meus Pets'),
                onTap: () {
                  this.setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyPetsScreen()));
                  });
                },
              ),
            ]));
      else
        return new SizedBox(
          height: 0,
        );
    }
  }

  loadMyAnimalsData() => Firestore.instance
      .collection('animals')
      .where('userUid', isEqualTo: session.currentUser.uid)
      .snapshots();

  Future<int> numberOfInteresteds(String animal) async {
    var result = await Firestore.instance
        .collection('interesteds')
        .where('animalUid', isEqualTo: animal)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    return documents.length;
  }

  typeOfInterest(String animal) async {
    var result = await Firestore.instance
        .collection('interesteds')
        .where('animalUid', isEqualTo: animal)
        .getDocuments();

  }
}
