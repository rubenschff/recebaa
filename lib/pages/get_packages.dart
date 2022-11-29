import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          print(data);
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1)),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: Card(
                    child: Text(
                      data['nomeProduto'],
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 25,
                  child: Card(
                    color: Color.fromARGB(255, 255, 154, 2),
                    child: Text('Latitude: ' + data['latitude']),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 25,
                  child: Card(
                    color: Color.fromARGB(255, 255, 154, 2),
                    child: Text('Longitude: ' + data['longitude']),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    side: BorderSide(width: 2, color: Colors.orange),
                  ),
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.buttonSeeInMap,
                  ),
                ),
              ],
            ),
          );
        }
        return Text(
          AppLocalizations.of(context)!.loading,
        );
      }),
    );
  }
}
