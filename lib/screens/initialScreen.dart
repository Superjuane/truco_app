import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  final String title = "Truco App";

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: NetworkImage(
                        'https://trucoargentino.net.ar/img/logo_truco_argentino.png')),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings1');
                    },
                    child: Text("Nueva Partida")),
                ElevatedButton(
                    onPressed: () {

                    },
                    child: Text("Continuar Partida")),
                ElevatedButton(
                    onPressed: () {

                    },
                    child: Text("Cargar Partida")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
