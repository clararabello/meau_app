import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_project/session.dart';
import 'package:first_project/ui/screens/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/ui/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

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
  File sampleImage;
  Dialogs dialogs = new Dialogs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),

      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Cadastro Pessoal", style: TextStyle(color: const Color(0xff434343), fontSize: 20, fontFamily: 'Roboto-Medium',)),
          backgroundColor: const Color(0xffcfe9e5),
          leading: IconButton(icon: BackButtonIcon(), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home())), color: const Color(0xff434343)),
      ),

      body: Form(
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

            new Container(
              alignment: Alignment.centerLeft,
              padding: new EdgeInsets.only( left: 28.0),
              child:
              Text("FOTO DE PERFIL",
                style: TextStyle(color: const Color(0xff88C9bf), fontFamily: 'Roboto-Regular', fontSize: 16,),
                textAlign: TextAlign.left,),
            ),

            SizedBox(height: 10),
            new Padding(
              padding: EdgeInsets.all(20),
              child: new GestureDetector(
                child: new Container(
                    width: 400,
                    height: 150,
                    color: const Color(0xfff1f2f2),
                    child:
                    sampleImage == null ?
                    Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        Icon(Icons.control_point, color: const Color(0xff757575)),
                        Text("adicionar foto")
                      ],
                    )
                        :
                    Column(
                      children: <Widget>[
                        // SizedBox(height: 50),
                        // Icon(Icons.check_circle_outline, color: const Color(0xff757575)),
                        // Text("imagem adicionada!")
                        new Container(
                            height: 150,
                            decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: new DecorationImage(
                                    fit: BoxFit.scaleDown,
                                    alignment: FractionalOffset.topCenter,
                                    image: FileImage(sampleImage)))
                        )
                      ],
                    )
                ),
                onTap: getImage,
              ),
            ),

            SizedBox(height: 20),

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
                      onPressed: () async {
                        dialogs.loading(context);
                        await Future.delayed(Duration(seconds: 2));
                        signUp();
                      },
                    ))])
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
        FirebaseUser firebaseUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        DocumentReference user = Firestore.instance.collection('users').document(firebaseUser.uid);
        final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(user.documentID);
        final StorageUploadTask task = firebaseStorageRef.putFile(sampleImage);
        var photoUrl = await (await task.onComplete).ref.getDownloadURL();

        user.setData({'username': usernameController.text, 'age': ageController.text, 'state': stateController.text, 'address': addressController.text,
        'city': cityController.text, 'name': nameController.text, 'telephone': telephoneController.text, 'profilePicture': photoUrl});

        nameController.text = "";
        emailController.text = "";
        passwordController.text = "";
        telephoneController.text = "";
        ageController.text = "";
        addressController.text = "";
        stateController.text = "";
        cityController.text = "";
        usernameController.text = "";

        session.setCurrentUser();
        await Future.delayed(Duration(seconds: 1));
        session.loadData();
        await Future.delayed(Duration(seconds: 2));
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }
      catch(e){
        print(e.message);
      }
    }
  }

  Future<void> getImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Câmera'),
                    onTap: openCamera,
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: new Text('Galeria'),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Future openGallery() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = tempImage;
    });
    Navigator.pop(context);
  }

  Future openCamera() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      sampleImage = tempImage;
    });
    Navigator.pop(context);
  }
}