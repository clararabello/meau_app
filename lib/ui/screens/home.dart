import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xfffafafa),

      body:
      Center(
        child: Column(
          children: <Widget>[

            Icon(Icons.dehaze),

            SizedBox(height: 64.0),

            Text(
              'Hello world',
              style: TextStyle(
                fontFamily: 'Courgette-Regular'
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nome de usuário'
                ),
              ),
            ),

            SizedBox(height: 20.0),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Senha'
                ),
              ),

            ),

            SizedBox(height: 52.0),

            MaterialButton(
              color: const Color(0xff88c9bf),
              textColor: const Color(0xff434343),
              minWidth: 280,
              height: 40,
              child: Text("ENTRAR"),
              onPressed: () => print("Entrar"),
            ),

            SizedBox(height: 72.0),


            MaterialButton(
                color: const Color(0xff194f7c),
                textColor: Colors.white,
                minWidth: 280,
                height: 40,
                child:
                FlatButton.icon(
                  icon: Icon(Icons.dehaze),
                  label: Text("ENTRAR COM FACEBOOK"),
                  textColor: Colors.white,
                  onPressed: () => print("Entrar com Facebook"),
                )

            ),

            SizedBox(height: 8.0),

            MaterialButton(
                color: const Color(0xfff15f5c),
                textColor: Colors.white,
                minWidth: 280,
                height: 40,
                child:
                FlatButton.icon(
                  icon: Icon(Icons.dehaze),
                  label: Text("ENTRAR COM GOOGLE"),
                  textColor: Colors.white,
                  onPressed: () => print("Entrar com Google"),
                )
            )
          ],
        ),
      ),
    );
  }
}