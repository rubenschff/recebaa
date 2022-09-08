import 'package:flutter/material.dart';

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
        body: Center(
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
                  )),
            ),
          ],
        ))),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: 'Share')
        ]));
  }
}
