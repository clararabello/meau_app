import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var queryData = MediaQuery.of(context);
    //double devicePixelRatio = queryData.devicePixelRatio;

    return Scaffold(
      backgroundColor: const Color(0xfffafafa),

      body:
      Center(
        child: Column(
          children: <Widget>[

            Container(    // icone de menu
              height: 56,
              padding: new EdgeInsets.only(left: 12, top: 12),
              alignment: Alignment.topLeft,
              child: Icon(Icons.dehaze, color: const Color(0xff88c9bf),),
            ),

            Text( // texto "Olá!"
              'Olá!',
              style: TextStyle(
                fontFamily: 'Courgette-Regular',
                fontSize: 72,
                color: const Color(0xffffd358)
              ),
            ),

            SizedBox(height: 52.0),

            Text( // Texto inicial
              'Bem vindo ao Meau! \n Aqui você pode adotar, doar e ajudar \n '
                  'cães e gatos com facilidade. \n Qual o seu interesse?',
              style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontSize: 16,
                  color: const Color(0xff757575)
              ),
              textAlign: TextAlign.center
            ),

            SizedBox(height: 48.0),

            //-----------------------------------------------------//


            MaterialButton( // Botão adotar
              color: const Color(0xffffd358),
              textColor: const Color(0xff434343),
              minWidth: 232,
              height: 40,
              child: Text("ADOTAR"),
              onPressed: () => print("ADOTAR"),
            ),

            SizedBox(height: 12.0),


            MaterialButton(  // Botão ajudar
              color: const Color(0xffffd358),
              textColor: const Color(0xff434343),
              minWidth: 232,
              height: 40,
              child: Text("AJUDAR"),
              onPressed: () => print("AJUDAR"),
            ),

            SizedBox(height: 12.0),

            MaterialButton(   // Botão cadastrar
              color: const Color(0xffffd358),
              textColor: const Color(0xff434343),
              minWidth: 232,
              height: 40,
              child: Text("CADASTRAR ANIMAL"),
              onPressed: () => print("CADASTRAR"),
            ),

            SizedBox(height: 44.0),

            FlatButton(  // link login
              textColor: const Color(0xff88c9bf),
              onPressed: () {
                    Navigator.pushNamed(context, '/login');
              },
              child: Text("login"),),

            SizedBox(height: 68.0),

            Image.asset('assets/images/Meau_marca_2.png', alignment: Alignment.center, width: 122,), // imagem meau

          ],
        ),
      ),
    );
  }
}