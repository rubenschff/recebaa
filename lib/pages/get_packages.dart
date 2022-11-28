import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Pacotes extends StatelessWidget {
  final String documentID;
  final String? user = FirebaseAuth.instance.currentUser?.email;

  Pacotes({required this.documentID});

  @override
  Widget build(BuildContext context) {
    //get the colecction
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(user!);
    return FutureBuilder<DocumentSnapshot>(
      future: collectionReference.doc(documentID).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('Nome do produto: ${data['nomeProduto']}');
        }
        return Text('Loading');
      }),
    );
  }
}
