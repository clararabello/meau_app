import 'package:flutter/material.dart';

class AdoptionStories extends StatefulWidget {
  @override
  _AdoptionStoriesState createState() => _AdoptionStoriesState();
}

class _AdoptionStoriesState extends State<AdoptionStories> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: new AppBar(
          title: Text("Histórias de Adoção",
              style: TextStyle(color: const Color(0xff434343))),
        ),

        body: Center(
            child: ListView(children: <Widget>[

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
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://i.imgur.com/BoN9kdC.png"))))
                ,
                SizedBox(height: 12),
                SizedBox(height: 36),
              ],

            ),

          )

        ])));
  }
}

class AnimalWidget extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
    return new Text("VAK VAN VÉ");
  }
}
