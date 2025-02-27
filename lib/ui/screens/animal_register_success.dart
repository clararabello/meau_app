import 'package:first_project/auth.dart';
import 'package:first_project/session.dart';
import 'package:first_project/ui/screens/adopted_pets.dart';
import 'package:first_project/ui/screens/animal_index.dart';
import 'package:first_project/ui/screens/favorites.dart';
import 'package:first_project/ui/screens/home.dart';
import 'package:first_project/ui/screens/my_pets.dart';
import 'package:first_project/ui/screens/user_view.dart';
import 'package:flutter/material.dart';

class AnimalRegisterSuccess extends StatefulWidget {
  @override
  _AnimalRegisterSuccessState createState() => _AnimalRegisterSuccessState();
}

class _AnimalRegisterSuccessState extends State<AnimalRegisterSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro do Animal", style: TextStyle(color: const Color(0xff434343), fontSize: 20, fontFamily: 'Roboto-Medium')),
        backgroundColor: const Color(0xffffd358),
        iconTheme: IconThemeData(color: const Color(0xff434343)),
      ),
      drawer: returnBar(),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                Text("Eba!",
                    style: TextStyle(
                        fontFamily: 'Courgette-Regular',
                        fontSize: 72,
                        color: const Color(0xffffd358))
                ),

                SizedBox(height: 50),
                Text("O cadastro do seu pet foi realizado com sucesso!",
                    style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontSize: 16,
                        color: const Color(0xff757575)),
                    textAlign: TextAlign.center),

                SizedBox(height: 15),
                Text("Certifique-se que permitiu o envio de notificações por push "
                    "no campo privacidade do menu configurações do aplicativo. "
                    "Assim, poderemos te avisar assim que alguém interessado "
                    "entrar em contato!",
                    style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontSize: 16,
                        color: const Color(0xff757575)),
                    textAlign: TextAlign.center
                ),
              ],
            ),

            Container(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                  color: const Color(0xffffd358),
                  textColor: const Color(0xff434343),
                  minWidth: 232,
                  height: 40,
                  child: Text("MEUS PETS"),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyPetsScreen())),
              ),
            ),

          ],
        ),
      ),
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
