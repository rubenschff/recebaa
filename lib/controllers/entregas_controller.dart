import 'dart:html';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class EntregasController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';

  PacotesController() {
    getPosicao();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativo = await Geolocator.isLocationServiceEnabled();

    if (!ativo) {
      return Future.error('Permissão de localização não concedida');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa permitir o acesso a localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error(
          'Acesse as configurações do aparelho e permita acesso a localização');
    }
    return await Geolocator.getCurrentPosition();
  }
}
