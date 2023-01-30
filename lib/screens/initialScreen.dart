import 'dart:io';

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
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Image(
                      image: AssetImage("resources/images/TRUCO.png")),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.075,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings1');
                      },
                      child: Text("Nueva Partida")),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.075,                  child: ElevatedButton(
                      onPressed: () {

                      },
                      child: Text("Continuar Partida")),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.075,
                  child: ElevatedButton(
                      onPressed: () {

                      },
                      child: Text("Cargar Partida")),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.075,
                  child: ElevatedButton(
                      onPressed: null,
                      onLongPress: () {
                        exit(0);
                      },
                      child: Text("Salir")),
                ),
              ],
            ),
        ],
      ),

    );
  }
}
