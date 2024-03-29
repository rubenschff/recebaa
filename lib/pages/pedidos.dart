import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:recebaa/pages/get_packages.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({super.key});

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  late Future<List> pedidos;
  final Color color = Colors.grey.withOpacity(0.1);
  String? email = FirebaseAuth.instance.currentUser!.email;
  List<String> docIDs = [];

  //recupera os coumentos relacionados ao usuario
  Future getDocIDs() async {
    docIDs.clear();
    await FirebaseFirestore.instance.collection(email!).get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(
            15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getDocIDs(),
                  builder: ((context, snapshot) {
                    return ListView.builder(
                      itemCount: docIDs.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: Pacotes(documentID: docIDs[index]),
                        );
                      }),
                    );
                  }),
                ),
              ),
            ],
          )),
    );
  }
}
