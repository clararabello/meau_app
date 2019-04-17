import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

TextEditingController nameController, speciesController, sexController, sizeController, ageController,
                      temperController, healthController, adoptionDemandsController, aboutController = new TextEditingController();

final GlobalKey<FormState> _basicFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> _adoptionFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> _helpFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> _sponsorshipFormKey = GlobalKey<FormState>();

class AnimalRegisterScreen extends StatefulWidget {
  static _AnimalRegisterScreenState of(BuildContext context) => context.ancestorStateOfType(const TypeMatcher<_AnimalRegisterScreenState>());
  @override
  _AnimalRegisterScreenState createState() => _AnimalRegisterScreenState();
}

class _AnimalRegisterScreenState extends State<AnimalRegisterScreen> {
  String _especie, _sexo, _porte, _idade;
  List<String> _temperamento, _periodoAcompanhamento, _auxilioFinanceiro;
  List<String> _saude = ['a'], _tipoCadastro = ['a'], _tiposAjuda = ['a'], _exigenciasAdocao = ['a'], _exigenciasApadrinhamento = ['a'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Cadastro do Animal", style: TextStyle(color: const Color(0xff434343), fontSize: 20, fontFamily: 'Roboto-Medium',)),
          backgroundColor: const Color(0xffffd358),
          leading: Icon(Icons.arrow_back, color: const Color(0xff434343))
      ),
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: new Container(
              alignment: Alignment.topLeft,
              child: registerForm(),
        )
      ),
    );
  }

  Widget registerForm() {
    return ListView(
      children: <Widget>[
        Form(
          key: _basicFormKey,
          child: Column(children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Tenho interesse em cadastrar o animal para:",
                  style: TextStyle(color: const Color(0xff434343)),
                  textAlign: TextAlign.left
              ),
            ),
            SizedBox(height: 15),
            CheckboxGroup(
              activeColor: const Color(0xffffd358),
              orientation: GroupedButtonsOrientation.VERTICAL,
              labels: <String>["ADOTAR", "AJUDAR", "APADRINHAR"],
              labelStyle: new TextStyle(color: const Color(0xffbdbdbd)),
              onSelected: (List selected) => setState((){
                _tipoCadastro = selected;
                print(_tipoCadastro);
              }),
            ),
            SizedBox(height: 32.0),

            Container(
              alignment: Alignment.centerLeft,
              child: Text("NOME DO ANIMAL", style: new TextStyle(color: const Color(0xffffd358))),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Nome do animal',
                  hintStyle: new TextStyle(color: const Color(0xffbdbdbd), fontSize: 14)
              ),
            ),
            SizedBox(height: 20),

            Container(
                alignment: Alignment.centerLeft,
                child: Text("FOTOS DO ANIMAL", style: new TextStyle(color: const Color(0xffffd358))),
            ),
            SizedBox(height: 20),

            Container(
                alignment: Alignment.centerLeft,
                child: Text("ESPÉCIE", style: new TextStyle(color: const Color(0xffffd358))),
            ),
            RadioButtonGroup(
              activeColor: const Color(0xffffd358),
              orientation: GroupedButtonsOrientation.VERTICAL,
              labels: <String>["Cachorro", "Gato"],
              labelStyle: new TextStyle(color: const Color(0xffbdbdbd)),
              onSelected: (String selected) => setState((){
                _especie = selected;
                print(_especie);
              }),
            ),
            SizedBox(height: 20),

            Container(
                alignment: Alignment.centerLeft,
                child: Text("SEXO", style: new TextStyle(color: const Color(0xffffd358))),
            ),
            RadioButtonGroup(
              activeColor: const Color(0xffffd358),
              orientation: GroupedButtonsOrientation.VERTICAL,
              labels: <String>["Macho", "Fêmea"],
              labelStyle: new TextStyle(color: const Color(0xffbdbdbd)),
              onSelected: (String selected) => setState((){
                _sexo = selected;
                print(_sexo);
              }),
            ),
            SizedBox(height: 20),

            Container(
                alignment: Alignment.centerLeft,
                child: Text("PORTE", style: new TextStyle(color: const Color(0xffffd358))),
            ),
            RadioButtonGroup(
              activeColor: const Color(0xffffd358),
              orientation: GroupedButtonsOrientation.VERTICAL,
              labels: <String>["Pequeno", "Médio", "Grande"],
              labelStyle: new TextStyle(color: const Color(0xffbdbdbd)),
              onSelected: (String selected) => setState((){
                _porte = selected;
                print(_porte);
              }),
            ),
            SizedBox(height: 20),

            Container(
                alignment: Alignment.centerLeft,
                child: Text("IDADE", style: new TextStyle(color: const Color(0xffffd358))),
            ),
            RadioButtonGroup(
              activeColor: const Color(0xffffd358),
              orientation: GroupedButtonsOrientation.VERTICAL,
              labels: <String>["Filhote", "Adulto", "Idoso"],
              labelStyle: new TextStyle(color: const Color(0xffbdbdbd)),
              onSelected: (String selected) => setState((){
                _idade = selected;
                print(_idade);
              }),
            ),
            SizedBox(height: 20),

            Container(
                alignment: Alignment.centerLeft,
                child: Text("TEMPERAMENTO", style: new TextStyle(color: const Color(0xffffd358))),
            ),
            CheckboxGroup(
              activeColor: const Color(0xffffd358),
              orientation: GroupedButtonsOrientation.VERTICAL,
              labels: <String>["Brincalhão", "Tímido", "Calmo", "Guarda", "Amoroso", "Preguiçoso"],
              labelStyle: new TextStyle(color: const Color(0xffbdbdbd)),
              onSelected: (List selected) => setState((){
                _temperamento = selected;
                print(_temperamento);
              }),
            ),
            SizedBox(height: 20),

            Container(
                alignment: Alignment.centerLeft,
                child: Text("SAÚDE", style: new TextStyle(color: const Color(0xffffd358))),
            ),
            CheckboxGroup(
              activeColor: const Color(0xffffd358),
              orientation: GroupedButtonsOrientation.VERTICAL,
              labels: <String>["Vacinado", "Vermifugado", "Castrado", "Doente"],
              labelStyle: new TextStyle(color: const Color(0xffbdbdbd)),
              onSelected: (List selected) => setState((){
                _saude = selected;
                print(_saude);
              }),
            ),
            callIllnessesTextField(),

            // forms extras
            adoptionForm(),
            helpForm(),
            sponsorshipForm(),

            Container(
              alignment: Alignment.centerLeft,
              child: Text("SOBRE O ANIMAL", style: new TextStyle(color: const Color(0xffffd358))),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Compartilhe a história do animal',
                  hintStyle: new TextStyle(color: const Color(0xffbdbdbd), fontSize: 14)
              ),
            ),
            SizedBox(height: 24),

            MaterialButton(
              child: Text("CADASTRAR ANIMAL"),
              color: const Color(0xffffd358),
              minWidth: 232,
              height: 40,
              onPressed: () => print("Cadastrar animal"),
            ),
          ])
        )
      ],
    );
  }

  Widget helpForm() {
    if(_tipoCadastro.contains('AJUDAR'))
      return
          Form(
            key: _helpFormKey,
            child: Column(
              children: <Widget>[
                Container(
                alignment: Alignment.centerLeft,
                  child: Text("Ajudar", style: TextStyle(fontFamily: 'Roboto-Medium', fontSize: 16, color: const Color(0xff434343))),
                ),
                SizedBox(height: 20),

                CheckboxGroup(
                  activeColor: const Color(0xffffd358),
                  orientation: GroupedButtonsOrientation.VERTICAL,
                  labels: <String>["Alimento", "Auxílio financeiro", "Medicamento", "Objetos"],
                  labelStyle: new TextStyle(color: const Color(0xffbdbdbd)),
                  onSelected: (List selected) => setState((){
                    _tiposAjuda = selected;
                    print(_tiposAjuda);
                    }),
                ),
                callHelpFields(),
                SizedBox(height: 24),
              ],
            )
          );
    else
      return Text("");
  }

  Widget adoptionForm() {
    if(_tipoCadastro.contains('ADOTAR'))
      return Form(
          key: _adoptionFormKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Container(
              alignment: Alignment.centerLeft,
                child: Text("Adoção", style: TextStyle(fontFamily: 'Roboto-Medium', fontSize: 16, color: const Color(0xff434343))),
              ),
              SizedBox(height: 20),

              Container(
                alignment: Alignment.centerLeft,
                child: Text("EXIGÊNCIAS PARA ADOÇÃO", style: new TextStyle(color: const Color(0xffffd358))),
              ),
              SizedBox(height: 10),
              CheckboxGroup(
                activeColor: const Color(0xffffd358),
                orientation: GroupedButtonsOrientation.VERTICAL,
                labels: <String>["Termo de adoção", "Fotos da casa", "Visita prévia ao animal", "Acompanhamento pós-adoção"],
                labelStyle: new TextStyle(color: const Color(0xffbdbdbd)),
                onSelected: (List selected) => setState((){
                  _exigenciasAdocao = selected;
                  print(_exigenciasAdocao);
                }),
              ),
              callTrackingPeriodCheckboxes(),
            ],
          )
      );
    else
      return Text("");
  }

  Widget sponsorshipForm() {
    if(_tipoCadastro.contains('APADRINHAR'))
      return Form(
        key: _sponsorshipFormKey,
        child: Column(
          children: <Widget>[
            Container(
            alignment: Alignment.centerLeft,
              child: Text("Apadrinhar", style: TextStyle(fontFamily: 'Roboto-Medium', fontSize: 16, color: const Color(0xff434343))),
            ),
            SizedBox(height: 20),

            Container(
              alignment: Alignment.centerLeft,
              child: Text("EXIGÊNCIAS PARA APADRINHAMENTO", style: new TextStyle(color: const Color(0xffffd358))),
            ),
            SizedBox(height: 10),
            CheckboxGroup(
              activeColor: const Color(0xffffd358),
              orientation: GroupedButtonsOrientation.VERTICAL,
              labels: <String>["Termo de apadrinhamento", "Visitas ao animal", "Auxílio financeiro"],
              labelStyle: new TextStyle(color: const Color(0xffbdbdbd)),
              onSelected: (List selected) => setState((){
                _exigenciasApadrinhamento = selected;
                print(_exigenciasApadrinhamento);
              }),
            ),

            callFinancialAidCheckboxes(),
          ],
        ),
      );
    else
      return Text("");
  }

  Widget callHelpFields(){
    if (_tiposAjuda.contains("Medicamento") & _tiposAjuda.contains("Objetos"))
      return new Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Nome do medicamento',
                hintStyle: new TextStyle(color: const Color(0xffbdbdbd), fontSize: 14)
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Especifique o(s) objeto(s)',
                hintStyle: new TextStyle(color: const Color(0xffbdbdbd), fontSize: 14)
            ),
          ),
        ],
      );
    else if (_tiposAjuda.contains("Medicamento"))
      return TextFormField(
        decoration: InputDecoration(
            hintText: 'Nome do medicamento',
            hintStyle: new TextStyle(color: const Color(0xffbdbdbd), fontSize: 14)
        ),
      );
    else if (_tiposAjuda.contains("Objetos"))
      return TextFormField(
        decoration: InputDecoration(
            hintText: 'Especifique o(s) objeto(s)',
            hintStyle: new TextStyle(color: const Color(0xffbdbdbd), fontSize: 14)
        ),
      );
    else
      return Text("");
  }

  Widget callIllnessesTextField(){
    if (_saude.contains("Doente"))
      return TextFormField(
        decoration: InputDecoration(
            hintText: 'Doenças do animal',
            hintStyle: new TextStyle(color: const Color(0xffbdbdbd), fontSize: 14)
        ),
      );
    else
      return Text("");
  }

  Widget callTrackingPeriodCheckboxes(){
    if (_exigenciasAdocao.contains("Acompanhamento pós-adoção"))
      return Padding(
        padding: EdgeInsets.all(20),
        child: CheckboxGroup(
          activeColor: const Color(0xffffd358),
          orientation: GroupedButtonsOrientation.VERTICAL,
          labels: <String>["1 mês", "3 meses", "6 meses"],
          labelStyle: new TextStyle(color: const Color(0xffbdbdbd)),
          onSelected: (List selected) => setState((){
            _periodoAcompanhamento = selected;
            print(_periodoAcompanhamento);
          }),
        ),
      );
    else
      return Text("");
  }

  Widget callFinancialAidCheckboxes(){
    if (_exigenciasApadrinhamento.contains("Auxílio financeiro"))
      return Padding(
        padding: EdgeInsets.all(20),
        child: CheckboxGroup(
          activeColor: const Color(0xffffd358),
          orientation: GroupedButtonsOrientation.VERTICAL,
          labels: <String>["Alimentação", "Saúde", "Objetos"],
          labelStyle: new TextStyle(color: const Color(0xffbdbdbd)),
          onSelected: (List selected) => setState((){
            _auxilioFinanceiro = selected;
            print(_auxilioFinanceiro);
          }),
        ),
      );
    else
      return Text("");
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        Firestore.instance.collection('users').document(user.uid)
            .setData({'username': nameController.text, 'age': ageController.text, 'state': stateController.text, 'address': addressController.text,
          'city': cityController.text, 'name': nameController.text, 'telephone': telephoneController.text });
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }
      catch(e){
        print(e.message);
      }
    }
  }

}


