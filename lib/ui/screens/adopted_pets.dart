import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/auth.dart';
import 'package:first_project/session.dart';
import 'package:first_project/ui/screens/animal_index.dart';
import 'package:first_project/ui/screens/animal_view.dart';
import 'package:first_project/ui/screens/home.dart';
import 'package:first_project/ui/screens/my_pets.dart';
import 'package:first_project/ui/screens/user_view.dart';
import 'package:flutter/material.dart';

class AdoptedPets extends StatefulWidget {
  @override
  _AdoptedPetsState createState() => _AdoptedPetsState();
}

class _AdoptedPetsState extends State<AdoptedPets> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: loadAnimalsData(),
      builder: (context, snapshots) {
        if (snapshots.hasData)
          return Scaffold(
              backgroundColor: const Color(0xfffafafa),
              appBar: AppBar(
                  title: Text("Meus pets adotados",
                      style: TextStyle(
                          color: const Color(0xff434343),
                          fontSize: 20,
                          fontFamily: 'Roboto-Medium')),
                  backgroundColor: const Color(0xffffd358)
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
        else
          return new Container();
      },
    );
  }

  loadAnimalsData() {
    if(session.currentUser != null)
      return Firestore.instance
        .collection('animals')
        .where('adoptedBy', isEqualTo: session.currentUser.uid)
        .snapshots();
    else
      return null;
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
                            fit: BoxFit.cover,
                            image: new NetworkImage(session.userData["profilePicture"])
                        )
                    )),
                decoration: BoxDecoration(color: const Color(0xff88c9bf)),
              ),
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
                title: new Text('Meu perfil'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => UserView()));
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
              new Divider(),
              new ListTile(
                title: new Text('Logout'),
                onTap: () {
                  AuthService().signOut();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),

            ]));
      else
        return new SizedBox(
          height: 0,
        );
    }
  }
}
