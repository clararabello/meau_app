import 'package:first_project/auth.dart';
import 'package:first_project/ui/screens/adopted_pets.dart';
import 'package:first_project/ui/screens/animal_index.dart';
import 'package:first_project/ui/screens/favorites.dart';
import 'package:first_project/ui/screens/home.dart';
import 'package:first_project/ui/screens/my_pets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/session.dart';

//TODO - implementar view de usuário (sem ser o currentUser)
class UserView extends StatefulWidget {
  const UserView({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

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
                              fit: BoxFit.cover,
                              image: new NetworkImage(session.userData["profilePicture"])
                          )
                  )),

                  SizedBox(height: 12),

                  Text(session.userData["username"],
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


                  Text(session.userData["name"],
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


                  Text("${session.userData["age"]} anos",
                      style: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 14,
                          color: const Color(0xff434343)
                      )
                  ),

                  SizedBox(height: 36),


                  Text("EMAIL",
                      style: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 12,
                          color: const Color(0xff88c9bf)
                      )
                  ),

                  SizedBox(height: 8),


                  Text(session.currentUser.email,
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


                  Text("${session.userData["city"]} - ${session.userData["state"]}",
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


                  Text(session.userData["address"],
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


                  Text(session.userData["telephone"],
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


                  Text(session.userData["username"],
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

                  SizedBox(height: 32),

                  MaterialButton(
                      color: const Color(0xff88c9bf),
                      textColor: const Color(0xff434343),
                      minWidth: 280,
                      height: 40,
                      child: Text("EDITAR PERFIL"),
                      onPressed: () => print("editar perfil")
                  ),

                  SizedBox(height: 24)

                ],
              ),
            )
          ])
      )
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
            child: SingleChildScrollView(
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
                    title: new Text('Meus Pets'),
                    onTap: () {
                      this.setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyPetsScreen()));
                      });
                    },
                  ),

                  new Divider(),

                  new ExpansionTile(
                      backgroundColor: const Color(0xff88c9bf),
                      title: Text("Atalhos"),
                      children: <Widget>[
                        new ListTile(
                          title: new Text('Cadastrar um Pet'),
                          onTap: () {
                            this.setState(() {
                              Navigator.pushNamed(context, '/animal_register');
                            });
                          },
                        ),
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
                      ]
                  ),

                  new Divider(),

                  new ListTile(
                    title: new Text('Meus Favoritos'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Favorites())
                      );
                    },
                  ),

                  new Divider(),

                  new ListTile(
                    title: new Text('Meus Pets Adotados'),
                    onTap: () {
                      this.setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdoptedPets()));
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

                ])));
      else
        return new SizedBox(
          height: 0,
        );
    }
  }

}

