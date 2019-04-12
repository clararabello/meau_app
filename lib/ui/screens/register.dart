import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xfffafafa),

      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Cadastro Pessoal", style: TextStyle(color: const Color(0xff434343), fontSize: 20, fontFamily: 'Roboto-Medium')),
          backgroundColor: const Color(0xffcfe9e5),
          leading: Icon(Icons.dehaze, color: const Color(0xff434343))
      ),

      body:
      Center(
        child: ListView(
          children: <Widget>[

            SizedBox(height: 16.0),

            new Container(
                padding: new EdgeInsets.all(4.0),
                width: 348, //328
                height: 80,
                decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
                color: const Color(0xffcfe9e5)
              ),
              child:
              Text("As informações preenchidas serão divulgadas \n"
                  "apenas para a pessoa com a qual você realizar \n"
                  "o processo de adoção e/ou apadrinhamento, \n"
                  "após a formalização do processo.",
                      style: TextStyle(
                            fontFamily: 'Roboto-Regular',
                            fontSize: 14,
                            color: const Color(0xff434343)
                      ),
                textAlign: TextAlign.center
                          )


            ),

            SizedBox(height: 28.0),

            new Container(
              alignment: Alignment.centerLeft,
              padding: new EdgeInsets.only( left: 28.0),
              child:
                Text("INFORMAÇÕES PESSOAIS",
                  style: TextStyle(color: const Color(0xff88C9bf), fontFamily: 'Roboto-Regular', fontSize: 16),
                  textAlign: TextAlign.left,),
            ),

            SizedBox(height: 32.0),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nome completo'
                ),
              ),
            ),

            SizedBox(height: 36.0),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Idade'
                ),
              ),
            ),

            SizedBox(height: 36.0),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
              ),
            ),

            SizedBox(height: 36.0),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Estado'
                ),
              ),
            ),

            SizedBox(height: 36.0),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Cidade'
                ),
              ),
            ),

            SizedBox(height: 36.0),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Endereço'
                ),
              ),
            ),

            SizedBox(height: 36.0),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Telefone'
                ),
              ),
            ),

            SizedBox(height: 28.0),

            new Container(
              alignment: Alignment.centerLeft,
              padding: new EdgeInsets.only( left: 28.0),
              child:
              Text("INFORMAÇÕES DE PERFIL",
                style: TextStyle(color: const Color(0xff88C9bf), fontFamily: 'Roboto-Regular', fontSize: 16),
                textAlign: TextAlign.left,),
            ),

            SizedBox(height: 32.0),

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

            SizedBox(height: 36.0),

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

            SizedBox(height: 36.0),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Confirmação de senha'
                ),
              ),
            ),

            SizedBox(height: 28.0),

            new Container(
              alignment: Alignment.centerLeft,
              padding: new EdgeInsets.only( left: 28.0),
              child:
              Text("FOTO DE PERFIL",
                style: TextStyle(color: const Color(0xff88C9bf), fontFamily: 'Roboto-Regular', fontSize: 16),
                textAlign: TextAlign.left),
            ),

            SizedBox(height: 32.0),

            Text("FOTO"),
            Column(
              children:<Widget>[
                Container(
                  width: 232,
                  child: MaterialButton(
                    color: const Color(0xff88c9bf),
                    textColor: const Color(0xff434343),
                    minWidth: 8.0,
                    height: 40,
                    child: Text("FAZER CADASTRO"),
                    onPressed: () => print("fazer cadastro"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}