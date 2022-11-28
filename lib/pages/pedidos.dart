import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PedidosPage extends StatefulWidget {
  const PedidosPage({super.key});

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  late Future<List> pedidos;
  final Color color = Colors.grey.withOpacity(0.1);
  String email = '';
  List<String> docIDs = [];

  Future getPedidos() async {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        email = user.email!;
      });
    }
    await FirebaseFirestore.instance.collection(email).get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    // getUsuario();
    getPedidos();
    pedidos = pegarFotos();
  }

  @override
  Widget build(BuildContext context) {
    print(email);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(
          24.0,
        ),
        child: FutureBuilder<List>(
          future: pedidos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 2),
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: color),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Text(snapshot.data![index]['id'].toString()),
                          //Text(snapshot.data![index]['title'].toString())
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Card(
                              color: Color.fromARGB(255, 255, 154, 2),
                              child: Text(
                                docIDs[index],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Text('argaerbgeargb')
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Erro ao carregar pedidos"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Future<List> pegarFotos() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body).map((foto) => foto).toList();
    }
    throw Exception("Erro ao carregar fotos");
  }
}
