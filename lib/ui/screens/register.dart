import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/ui/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

TextEditingController nameController = new TextEditingController();
TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
TextEditingController telephoneController = new TextEditingController();
TextEditingController ageController = new TextEditingController();
TextEditingController addressController = new TextEditingController();
TextEditingController stateController = new TextEditingController();
TextEditingController cityController = new TextEditingController();
TextEditingController usernameController = new TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),

      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Cadastro Pessoal", style: TextStyle(color: const Color(0xff434343), fontSize: 20, fontFamily: 'Roboto-Medium',)),
          backgroundColor: const Color(0xffcfe9e5),
          leading: Icon(Icons.dehaze, color: const Color(0xff434343))
      ),

      body:Form(
        key: _formKey,
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
                style: TextStyle(color: const Color(0xff88C9bf), fontFamily: 'Roboto-Regular', fontSize: 16,),
                textAlign: TextAlign.left,),
            ),

            SizedBox(height: 32.0),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Nome completo'
                ),
                //onSubmitted: (input) => nameController.text = input,
                controller: nameController,
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
                controller: ageController,
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
                controller: emailController,
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
                controller: stateController,
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
                controller: cityController,
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
                controller: addressController,
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
                controller: telephoneController,

              ),
            ),

            SizedBox(height: 28.0),

            new Container(
              alignment: Alignment.centerLeft,
              padding: new EdgeInsets.only( left: 28.0),
              child:
              Text("INFORMAÇÕES DE PERFIL",
                style: TextStyle(color: const Color(0xff88C9bf), fontFamily: 'Roboto-Regular', fontSize: 16,),
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
                controller: usernameController,
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
                controller: passwordController,
              ),
            ),

            SizedBox(height: 36.0),

           /* Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Confirmação de senha'
                ),
              ),
            ),*/

            SizedBox(height: 28.0),

            /*new Container(
              alignment: Alignment.centerLeft,
              padding: new EdgeInsets.only( left: 28.0),
              child:
              Text("FOTO DE PERFIL",
                style: TextStyle(color: const Color(0xff88C9bf), fontFamily: 'Roboto-Regular', fontSize: 16,),
                textAlign: TextAlign.left,),
            ),

            SizedBox(height: 32.0),*/

            Column(
                children:<Widget>[
                  Container(
                    width: 232,
                    child:
                    MaterialButton(
                      child: Text("FAZER CADASTRO"),
                      color: const Color(0xff88c9bf),
                      textColor: const Color(0xff434343),
                      minWidth: 8.0,
                      height: 40,
                      onPressed: () => signUp(),
                    ),)])
          ],
        ),
      )
    );
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        Firestore.instance.collection('users').document(user.uid)
            .setData({'username': usernameController.text, 'age': ageController.text, 'state': stateController.text, 'address': addressController.text,
        'city': cityController.text, 'name': nameController.text, 'telephone': telephoneController.text });
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }
      catch(e){
        print(e.message);
      }
    }
  }
}