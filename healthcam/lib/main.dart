import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'home.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[600],
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Health',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Cam',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: <Widget>[
                        Text(
                          "Inicie la detección de Productos",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        IconButton(
                          icon: Icon(Icons.camera_alt),
                          iconSize: 50.0,
                          color: Colors.redAccent,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => HomePage(cameras)),
                            );
                          },
                        ),
                        SizedBox(height: 100.0),
                        Text("Recomendaciones:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "1-Acercar el producto a la cámara de tal forma que este dentro de las dimenciones de la pantalla",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          "2-Mantener el dispositivo sin movimientos bruscos",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          "3-Estar en una zona con buena iluminación",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          "4-Para una correcta detección intentar no tapar el producto con las manos",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
