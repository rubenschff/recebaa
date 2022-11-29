import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  @override
  Widget build(BuildContext context) {
    String? user = FirebaseAuth.instance.currentUser?.displayName;
    String? email = FirebaseAuth.instance.currentUser?.email;

    return Container(
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              elevation: 30,
              shadowColor: Colors.black,
              color: Colors.blueGrey[200],
              child: SizedBox(
                width: 300,
                height: 530,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange[500],
                        radius: 108,
                        child: const CircleAvatar(
                          radius: 100,
                        ), //CircleAvatar
                      ), //CircleAvatar
                      const SizedBox(
                        height: 20,
                      ), //SizedBox
                      Text(
                        '${user!}',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ), //Textstyle
                      ), //Text
                      const SizedBox(
                        height: 25,
                      ), //SizedBox
                      Text(
                        AppLocalizations.of(context)!.email + ':',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ), //Textstyle
                      ), //Text
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ' ${email!}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ), //Textstyle
                      ), //SizedBox
                      SizedBox(
                        width: 100,
                      ) //SizedBox
                    ],
                  ), //Column
                ), //Padding
              ), //SizedBox
            ),
          ],
        ),
      ),
    );
    ;
  }
}
