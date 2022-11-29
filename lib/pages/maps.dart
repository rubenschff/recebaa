import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recebaa/pages/register_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapsPage extends StatelessWidget {
  String nomeProduto;
  double latitude;
  double longitude;

  MapsPage(
      {required this.nomeProduto,
      required this.latitude,
      required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Builder(
              builder: (context) {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(latitude, longitude), zoom: 18),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: Text(AppLocalizations.of(context)!.close)),
        ],
      ),
    );
  }
}
