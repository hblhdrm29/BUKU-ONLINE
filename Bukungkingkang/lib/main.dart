import 'package:buku/email.dart';
import 'package:buku/halaman/favorite.dart';
import 'package:buku/halaman/home.dart';
import 'package:buku/halaman/user.dart';

import 'package:buku/logingoogle.dart';
import 'package:buku/register.dart';
import 'package:buku/registerui.dart';
import 'package:buku/services/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final page = [MyHomePage(), FavoriteScreen(), UserPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[index],
      bottomNavigationBar: MenuBawah(context),
    );
  }

  Container MenuBawah(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: HexColor('#3742fa'),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                index = 0;
              });
            },
            icon: index == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.yellow,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.yellow,
                    size: 35,
                  ),
          ),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
              icon: index == 1
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.yellow,
                      size: 35,
                    )
                  : const Icon(Icons.favorite_border,
                      color: Colors.yellow, size: 35)),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                index = 2;
              });
            },
            icon: index == 2
                ? const Icon(
                    Icons.person,
                    color: Colors.yellow,
                    size: 35,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.yellow,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
