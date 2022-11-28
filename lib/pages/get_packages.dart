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
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(1)),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    color: Color.fromARGB(255, 255, 154, 2),
                    child: Text(
                      data['nomeProduto'],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 20,
                  child: Card(
                    child: Text(data['latitude']),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 20,
                  child: Card(
                    child: Text(data['longitude']),
                  ),
                )
              ],
            ),
          );
        }
        return Text('Loading');
      }),
    );
  }
}
