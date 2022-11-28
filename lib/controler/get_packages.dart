// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class PacotesID extends StatefulWidget {
//   const PacotesID({super.key});

//   @override
//   State<PacotesID> createState() => _PacotesIDState();
// }

// class _PacotesIDState extends State<PacotesID> {
//   String? id;
//   String? produto;
//   String? latitude;
//   String? longitude;
//   List encomendas = [];

//   @override
//   void initState() {
//     super.initState();
//     getPacote();
//   }

//   getPacote() async {
//     User? user = await FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       setState(() {
//         id = user.email!;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference collectionReference =
//         FirebaseFirestore.instance.collection(id!);
//     return FutureBuilder<DocumentSnapshot>(
//       builder: ((context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           encomendas.add(data);
//           return Text('');
//         }
//       }),
//     );
//   }
// }
