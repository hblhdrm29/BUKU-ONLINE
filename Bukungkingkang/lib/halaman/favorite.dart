import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../list_book.dart';
import '../main.dart';
import '../services/services.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late BooksHelper helper;
  List<dynamic> books = <dynamic>[];
  late int booksCount;

  @override
  void initState() {
    helper = BooksHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Favorite Books'),
        backgroundColor: HexColor('#3742fa'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20), child: Text('My Favourite Books')),
          Padding(padding: EdgeInsets.all(20), child: BooksList(books, true)),
        ],
      ),
    );
  }

  Future initialize() async {
    books = await helper.getFavorites();
    setState(() {
      booksCount = books.length;
      books = books;
    });
  }
}
