import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import '../utils/routes/routingArgs.dart';

int otherI(int i, int nPlayers) {
  if (i == nPlayers - 1) {
    return 0;
  } else {
    return i + 1;
  }
}

int _calcFaltaEnvido(GameArgs args) {
  int mayor = 0;
  if(args.puntos![0] > args.puntos![1]) mayor = args.puntos![0];
  else mayor = args.puntos![1];
  if(args.quince) return 15-mayor;
  else return max(30-mayor,0);
}


Widget EnvidoDialog(BuildContext context, GameArgs gameArgs, int playerCanta) {
  // NO QUIERO, QUIERO, ENVIDO, ENVIDO ENVIDO, REAL ENVIDO, FALTA ENVIDO
  List<List<bool>> activated = List.generate(gameArgs.nPlayers, (index) => [true, true, true, true, true, true]);
  for (int i = 0; i < 2; i++){activated[playerCanta][i] = false;}


  //ENVIDO, ENVIDO ENVIDO, REAL ENVIDO, FALTA ENVIDO
  List<bool> alredyActivated = [false, false, false, false];

  //PRINT
  // debugPrint("**************************************************");
  // for (int i = 0; i < gameArgs.nPlayers - 1; i++) {
  //   for (int j = 0; j < 5; j++) {
  //     debugPrint("j1: ${activated[i][j]} | j2: ${activated[i + 1][j]}");
  //   }
  //   for (int j = 0; j < 4; j++) {
  //     debugPrint("alredyActivated: ${alredyActivated[j]}");
  //   }
  // }
  // debugPrint("**************************************************");


  int puntos = 2, puntosAnt = 1;
  return StatefulBuilder(builder: (context, setState) {
    // debugPrint("**************************************************");
    // for (int i = 0; i < gameArgs.nPlayers - 1; i++) {
    //   for (int j = 0; j < 5; j++) {
    //     debugPrint("j1: ${activated[i][j]} | j2: ${activated[i + 1][j]}");
    //   }
    //   for (int j = 0; j < 4; j++) {
    //     debugPrint("alredyActivated: ${alredyActivated[j]}");
    //   }
    // }
    // debugPrint("**************************************************");
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width * 0.95,
          //color: Colors.red,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(6.0, 15.0, 6.0, 10.0),
            child: Column(
              children: [
                const Text("Envido"),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < gameArgs.nPlayers; i++)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: activated[i][0]
                                    ? () {
                                        Navigator.of(context).pop(PointsResult(
                                            otherI(i, gameArgs.nPlayers),
                                            puntosAnt));
                                      }
                                    : null,
                                child: const Text("   No Quiero   ")),
                            ElevatedButton(
                                onPressed: activated[i][1]
                                    ? () async {
                                        final result = await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text("Envido"),
                                                content: const Text("Quien gana"),
                                                actions: [
                                                  for (int j = 0;
                                                      j < gameArgs.nPlayers;
                                                      j++)
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop((j));
                                                        },
                                                        child: Text(gameArgs
                                                            .playerNames[j])),
                                                ],
                                              );
                                            });
                                        Navigator.of(context).pop(PointsResult(result, puntos));
                                      }
                                    : null,
                                child: const Text("      Quiero      ")),
                            const SizedBox(height: 10.0),
                            Container(
                              width: 100,
                              height: 1,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 10.0),
                            ElevatedButton(     //Envido Envido
                                onLongPress: activated[i][2] && !alredyActivated[0] ? (){
                                  Fluttertoast.showToast(
                                      msg: "Envido Real Envido: 4 puntos",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 20.0
                                  );
                                }:null,
                                onPressed: activated[i][2] && !alredyActivated[0] ? () {
                                        // actualizo puntosAnt y puntos
                                        puntosAnt = puntos;
                                        puntos += 2;

                                        setState((){
                                          // actualizo alredyActivated
                                          alredyActivated[0] = true;
                                          alredyActivated[1] = true;

                                          // descativa mis quiero
                                          //desactivo mis opciones
                                          for(int j = 0; j < 6; ++j){activated[i][j] = false;}

                                          // activa quiero del otro
                                          // activa opciones del otro
                                          for(int j = 0; j < 6; ++j) {activated[otherI(i, gameArgs.nPlayers)][j] = true;}

                                        });
                                      }
                                    : null,
                                child: const Text("Envido Envido")),
                            ElevatedButton(     //Envido Real Envido
                                onLongPress: activated[i][3] && !alredyActivated[1] ? (){
                                  Fluttertoast.showToast(
                                      msg: "Envido Real Envido: 5 puntos",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 20.0
                                  );
                                }:null,
                                onPressed:
                                    activated[i][3] && !alredyActivated[1] ? () {
                                      puntosAnt = puntos;
                                      puntos += 3;

                                      setState(() {
                                        // actualizo alredyActivated
                                        alredyActivated[0] = true;
                                        alredyActivated[1] = true;

                                        // descativa mis quiero
                                        //desactivo mis opciones
                                        for (int j = 0; j < 6; ++j) {
                                          activated[i][j] = false;
                                        }

                                        // activa quiero del otro
                                        // activa opciones del otro
                                        for (int j = 0; j < 6; ++j) {activated[otherI(i, gameArgs.nPlayers)][j] = true;}
                                      });
                                          }
                                        : null,
                                child: const Text("Envido Real Envido",
                                    style: TextStyle(fontSize: 11))),
                            ElevatedButton(//Envido Envido Real Envido
                                onLongPress: activated[i][4] && !alredyActivated[2] ? (){
                                  Fluttertoast.showToast(
                                      msg: "Envido Envido Real Envido: 7 puntos",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 20.0
                                  );
                                }:null,
                                onPressed:
                                    activated[i][4] && !alredyActivated[2] ? ()  {
                                      puntosAnt = puntos;
                                      puntos = 7;

                                      setState(() {
                                        // actualizo alredyActivated
                                        alredyActivated[0] = true;
                                        alredyActivated[1] = true;
                                        alredyActivated[2] = true;

                                        // descativa mis quiero
                                        //desactivo mis opciones
                                        for (int j = 0; j < 6; ++j) {
                                          activated[i][j] = false;
                                        }

                                        // activa quiero del otro
                                        // activa opciones del otro
                                        for (int j = 0; j < 6; ++j) {
                                          activated[otherI(i, gameArgs.nPlayers)][j] = true;
                                        }
                                      });
                                    }
                                        : null,
                                child: const Text("Env. Env. Real Env.",
                                    style: TextStyle(fontSize: 11))),
                            ElevatedButton(    //Falta Envido
                                onLongPress: activated[i][5] && !alredyActivated[3] ? (){
                                  Fluttertoast.showToast(
                                      msg: "Envido Envido Real Envido: ${_calcFaltaEnvido(gameArgs)} puntos",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 20.0
                                  );
                                }:null,
                                onPressed:
                                    activated[i][5] && !alredyActivated[3]
                                        ? () {
                                      puntosAnt = puntos;
                                      puntos = _calcFaltaEnvido(gameArgs);

                                      setState(() {
                                        // actualizo alredyActivated
                                        alredyActivated[0] = true;
                                        alredyActivated[1] = true;
                                        alredyActivated[2] = true;
                                        alredyActivated[3] = true;

                                        // descativa mis quiero
                                        //desactivo mis opciones
                                        for (int j = 0; j < 6; ++j) {
                                          activated[i][j] = false;
                                        }

                                        // activa quiero del otro
                                        // activa opciones del otro
                                        for (int j = 0; j < 6; ++j) {
                                          activated[otherI(i, gameArgs.nPlayers)][j] = true;
                                        }
                                      });
                                          }
                                        : null,
                                child: const Text("  Falta Envido  ")),
                          ],
                        )
                    ]),
                const SizedBox(height: 50.0),
                Text("Quiero: $puntos", style: const TextStyle(fontSize: 60)),
                const SizedBox(height: 30.0),
                Text("No quiero: $puntosAnt", style: const TextStyle(fontSize: 30)),
              ],
            ),
          )),
    );
  });
}


/*
                 TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(EnvidoResult(i, 2));
                    },
                    child: Text(gameArgs.playerNames[i])),*/
