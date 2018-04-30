import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mapbox/flutter_mapbox.dart';

Future<Null> main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MapBoxDemo(),
    );
  }
}

class MapBoxDemo extends StatefulWidget {
  @override
  _MapBoxDemoState createState() => new _MapBoxDemoState();
}

class _MapBoxDemoState extends State<MapBoxDemo> {
  final MapboxOverlayController controller = new MapboxOverlayController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Mapbox Flutter Demo'),
      ),
      drawer: new Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: new ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new Text('Drawer Header'),
              decoration: new BoxDecoration(
                color: Colors.blue,
              ),
            ),
            new ListTile(
              title: new Text('jumpTo New York'),
              onTap: () {
                controller.jumpTo(new CameraPosition(
                    target: new LatLng(lat: 40.758896, lng: -73.985130),
                    zoom: 11.0,
                    bearing: 0.0,
                    tilt: 0.0));
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text('flyTo Melbourne'),
              onTap: () {
                controller.flyTo(
                    new CameraPosition(
                        target: new LatLng(lat: -37.8155984, lng: 144.9640312),
                        zoom: 11.0,
                        bearing: 0.0,
                        tilt: 0.0),
                    3000);
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text('easeTo Dubai'),
              onTap: () {
                controller.easeTo(
                    new CameraPosition(
                        target: new LatLng(lat: 25.276987, lng: 55.296249),
                        zoom: 11.0,
                        bearing: 180.0,
                        tilt: 0.0),
                    3000,
                    true);
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text('addMarker Melbourne'),
              onTap: () {
                controller.addMarker(new Marker(
                    position: new LatLng(lat: -37.810719, lng: 144.954474),
                    title: "Flagstaff Gardens",
                    snippet:
                        "Spacious, tranquil park with landscaped gardens & sculptures, plus picnic & recreational facilities."));
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text('setMinZoom(9)'),
              onTap: () {
                controller.setMinZoom(9.0);
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              title: new Text('setMaxZoom(11.5)'),
              onTap: () {
                controller.setMaxZoom(11.5);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: new Container(
        child: new MapboxOverlay(
          controller: controller,
          options: new MapboxMapOptions(
            style: Style.mapboxStreets,
            camera: new CameraPosition(
                target: new LatLng(lat: -37.8155984, lng: 144.9640312),
                zoom: 11.0,
                bearing: 0.0,
                tilt: 0.0),
          ),
        ),
      ),
    );
  }
}
