import 'package:buku/main.dart';
import 'package:provider/provider.dart';
import 'package:buku/services/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            ElevatedButton.icon(
                icon: FaIcon(
                  FontAwesomeIcons.personCircleQuestion,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                label: Text(
                  'Login with Anonymus',
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(double.infinity, 50))),
            ElevatedButton.icon(
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.blue,
                ),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                label: Text(
                  'Login with google',
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(double.infinity, 50))),
          ]),
        ),
      ),
    );
  }
}
