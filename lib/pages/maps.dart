import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recebaa/pages/home.dart';
import 'package:recebaa/pages/pedidos.dart';
import 'package:recebaa/pages/register_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapsPage extends StatelessWidget {
  String nomeProduto;
  String latitude;
  String longitude;

  MapsPage(
      {required this.nomeProduto,
      required this.latitude,
      required this.longitude});

  @override
  Widget build(BuildContext context) {
    print(latitude);
    print(longitude);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 80,
            child: Builder(
              builder: (context) {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                          double.parse(latitude), double.parse(longitude)),
                      zoom: 18),
                  zoomControlsEnabled: true,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              child: Text(AppLocalizations.of(context)!.close)),
        ],
      ),
    );
  }
}
