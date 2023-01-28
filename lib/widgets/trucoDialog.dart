import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/routes/routingArgs.dart';

int otherI(int i, int nPlayers) {
  if (i == nPlayers - 1) {
    return 0;
  } else {
    return i + 1;
  }
}



Widget TrucoDialog(BuildContext context, GameArgs gameArgs, int playerCanta) {
  // NO QUIERO, QUIERO, RETRUCO, VALE 4
  List<List<bool>> activated = List.generate(gameArgs.nPlayers, (index) => [true, true, true, false]);
  for (int i = 0; i < 2; i++){activated[playerCanta][i] = false;}
  activated[playerCanta][2] = false;


  //RETRUCO, VALE 4
  List<bool> alredyActivated = [false, false];


  int puntos = 2, puntosAnt = 1;
  return StatefulBuilder(builder: (context, setState) {
    debugPrint("**************************************************");
    for (int i = 0; i < gameArgs.nPlayers - 1; i++) {
      for (int j = 0; j < 4; j++) {
        debugPrint("j1: ${activated[i][j]} | j2: ${activated[i + 1][j]}");
      }
      for (int j = 0; j < 2; j++) {
        debugPrint("alredyActivated: ${alredyActivated[j]}");
      }
    }
    debugPrint("**************************************************");

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
                const Text("Truco"),
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
                                          title: const Text("Truco"),
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
                            const SizedBox(height: 70.0),
                            ElevatedButton(     //Retruco
                                onLongPress: activated[i][2] && !alredyActivated[0] ? (){
                                  Fluttertoast.showToast(
                                      msg: "Retruco: 3 puntos",
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
                                  puntos += 1;

                                  setState((){
                                    // actualizo alredyActivated
                                    alredyActivated[0] = true;


                                    // descativa mis quiero
                                    //desactivo mis opciones
                                    for(int j = 0; j < 4; ++j){activated[i][j] = false;}

                                    // activa quiero del otro
                                    // activa opciones del otro
                                    activated[otherI(i, gameArgs.nPlayers)][0] = true;
                                    activated[otherI(i, gameArgs.nPlayers)][1] = true;
                                    activated[otherI(i, gameArgs.nPlayers)][3] = true;

                                  });
                                }
                                    : null,
                                child: const Text("   Retruco   ", style: TextStyle(fontSize: 17.0))),
                            const SizedBox(height: 10.0),
                            ElevatedButton(     //vale 4
                                onLongPress: activated[i][3] && !alredyActivated[1] ? (){
                                  Fluttertoast.showToast(
                                      msg: "Quiero vale cuatro: 4 puntos",
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
                                  puntos += 1;

                                  setState(() {
                                    // actualizo alredyActivated
                                    alredyActivated[0] = true;
                                    alredyActivated[1] = true;

                                    // descativa mis quiero
                                    //desactivo mis opciones
                                    for (int j = 0; j < 2; ++j) {
                                      activated[i][j] = false;
                                    }

                                    // activa quiero del otro
                                    // activa opciones del otro
                                    for (int j = 0; j < 2; ++j) {activated[otherI(i, gameArgs.nPlayers)][j] = true;}
                                  });
                                }
                                    : null,
                                child: const Text("Vale Cuatro",
                                    style: TextStyle(fontSize: 17))),

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

int _calcFaltaEnvido(GameArgs args) {
  int max = 0;
  if(args.puntos![0] > args.puntos![1]) max = args.puntos![0];
  else max = args.puntos![1];
  if(args.quince) return 15-max;
  else return 30-max;
}
/*
                 TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(EnvidoResult(i, 2));
                    },
                    child: Text(gameArgs.playerNames[i])),*/
