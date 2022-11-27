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

  @override
  void initState() {
    super.initState();
    pedidos = pegarFotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos"),
      ),
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
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1),
                  itemCount: 4,
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
                                snapshot.data![index]['id'].toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Text(snapshot.data![index]['title'].toString())
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
