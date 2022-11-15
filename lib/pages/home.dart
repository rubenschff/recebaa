import 'package:flutter/material.dart';
import 'package:recebaa/controllers/entregas_controller.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recebaa seu pedido!')),
      body: ChangeNotifierProvider<EntregasController>(
        create: (context) => EntregasController(),
        child: Builder(builder: (context) {
          final local = context.watch<EntregasController>();

          String mensagem = local.erro == ''
              ? 'Latitude: ${local.lat} | Longitude: ${local.long}'
              : local.erro;

          return Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(90.0)),
                  SizedBox(
                    child: Image.asset('assets/images/location128x128.png'),
                  ),
                  SizedBox(
                    width: 20,
                    child: Text(''),
                  ),
                  SizedBox(
                    child: Text(
                      'Aqui você vai ver a localização da sua encomenda em tempo real',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Text(mensagem),
                  )
                ],
              ),
            ),
          );
        }),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.share), label: 'Share')
      //   ],
      // ),
    );
  }
}
