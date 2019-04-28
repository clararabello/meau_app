import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/ui/screens/home.dart';
import 'package:first_project/ui/screens/animal_view.dart';
import 'package:first_project/session.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: loadFavorites(),
      builder: (context, snapshots) {
        return Scaffold(
            backgroundColor: const Color(0xfffafafa),
            appBar: AppBar(
                title: Text("Favoritos"),
                backgroundColor: const Color(0xffffd358),
                ),
        );},
    );
  }

  loadFavorites() => Firestore.instance
      .collection('favorites')
      .where('registerType')
      .snapshots();
}