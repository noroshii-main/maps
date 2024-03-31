import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'main.dart';
import 'page.dart';

class SetLanguagePage extends ExamplePage {
  SetLanguagePage() : super(const Icon(Icons.language), 'Set Map language');

  @override
  Widget build(BuildContext context) {
    return const SetLanguage();
  }
}

class SetLanguage extends StatefulWidget {
  const SetLanguage();

  @override
  State createState() => SetLanguageState();
}

class SetLanguageState extends State<SetLanguage> {
  MapboxMapController? mapController;
  var isJa = true;

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  _onStyleLoadedCallback() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Style loaded :)"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(32.0),
          child: FloatingActionButton(
            child: Icon(Icons.swap_horiz),
            onPressed: () {
              setState(
                () => isJa = !isJa,
              );
              if (isJa) {
                mapController?.setMapLanguage("ja");
                print("set language to ja");
              } else {
                mapController?.setMapLanguage("en");
                print("set language to en");
              }
            },
          ),
        ),
        body: MapboxMap(
          styleString: MapboxStyles.LIGHT,
          accessToken: MapsDemo.ACCESS_TOKEN,
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(target: LatLng(0.0, 0.0)),
          initialMapLanguage: 'ja',
          onStyleLoadedCallback: _onStyleLoadedCallback,
        ));
  }
}
