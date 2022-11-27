import 'package:flutter/material.dart';
import 'package:recebaa/pages/pedidos.dart';
import 'package:recebaa/pages/usuario.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          PedidosPage(),
          UsuarioPage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping), label: 'Pedidos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Perfil')
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
