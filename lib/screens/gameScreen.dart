import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/functions.dart';
import '../utils/routes/routingArgs.dart';
import '../widgets/envidoDialog.dart';
import '../widgets/trucoDialog.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.gameArgs});
  final String title = "Truco App";
  final GameArgs gameArgs;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late String titulo;
  bool gana1 = false;
  bool gana2 = false;
  final controller = ConfettiController();
  bool isConfettiPlaying = false;
  late int winPoints = widget.gameArgs.quince? 15 : 30;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      isConfettiPlaying = controller.state == ConfettiControllerState.playing;
    });
    titulo = widget.gameArgs.quince ? "TRUCO (a 15)" : "TRUCO";
  }

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  // Future<bool?> _showExitDialog(BuildContext context) async {
  //   return await showDialog(
  //     context: context,
  //     builder: (context) => _buildExitDialog(context),
  //   );
  // }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('SALIR')),
      content: const Text('Quieres salir de la aplicación ?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('CANCELAR',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('GUARDAR Y SALIR',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('SALIR SIN GUARDAR',
              style: TextStyle(color: Colors.red, fontSize: 12)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    setState(() {
      if(widget.gameArgs.puntos![0] >= winPoints){
        gana1 = true;
        controller.play();
      }
      if(widget.gameArgs.puntos![1] >= winPoints){
        gana2 = true;
        controller.play();
      }
    });
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    Row(
                      children: [
                        Text(titulo, style: Theme.of(context).textTheme.headline2),
                      ],
                    ),
                    widget.gameArgs.flor
                        ? SvgPicture.asset(
                            "resources/icons/flower-svgrepo-com.svg",
                            height: 50,
                            width: 50,
                            color: Theme.of(context).textTheme.headline2!.color,
                          )
                        : SvgPicture.asset(
                            (darkModeOn)
                                ? "resources/icons/flower-svgrepo-com-not-dark.svg"
                                : "resources/icons/flower-svgrepo-com-not-light.svg",
                            height: 50,
                            width: 50,
                            //color: Theme.of(context).textTheme.headline2!.color,
                          ),
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    child: Stack(
                      children: [
                        Image.asset((darkModeOn)
                            ? 'resources/images/notebook_background.jpg' //DARK MODE
                            : 'resources/images/notebook_background.jpg'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildBackground1(),
                        ),
                        Container(
                          // height: 5 + 25.5 * (maxPlayerNameHeight(widget.gameArgs.playerNames)+1),
                          height: 45,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildScoreBoards(),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: (!gana1 && !gana2) ? Container(
                      height: double.infinity,
                      width: double.infinity,
                      // color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _buildButtons(),
                        ),
                      ),
                    ): SizedBox(
                      height: 0,
                      width: 0,),
                  ),
                ],
              ),
            ),
          ),
          ConfettiWidget(
            confettiController: controller,
            blastDirection: pi/2,
            shouldLoop: true,
            emissionFrequency: 0.12,
            gravity: 0.2,
            numberOfParticles:15,
            minBlastForce: 10 ,
          ),
          if(gana1 || gana2 ) Center(
            child: Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text((gana1) ? widget.gameArgs.playerNames[0] : widget.gameArgs.playerNames[1], style: Theme.of(context).textTheme.headline3,),
                  Text("GANA !!!", style: Theme.of(context).textTheme.headline2,),
                  Text("🥳 🥳 🥳", style: Theme.of(context).textTheme.headline2,),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ConfettiWidget(
                confettiController: controller,
                blastDirection: pi/2,
                shouldLoop: true,
                emissionFrequency: 0.12,
                gravity: 0.2,
                numberOfParticles:15,
                minBlastForce: 10 ,
              ),

              ConfettiWidget(
                confettiController: controller,
                blastDirection: pi/2,
                shouldLoop: true,
                emissionFrequency: 0.02,
                gravity: 0.2,
                numberOfParticles:15,
                minBlastForce: 10 ,
              ),
            ],
          ),
          // if(gana1 || gana2 ) Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     child: Text("Salir"),
          //   ),
          // )
        ],
      ),
    );
  }

  List<Widget> _buildButtons() {
    List<Widget> buttonColumns = [];
    int n = widget.gameArgs.nPlayers;
    for (int i = 0; i < n; i++) {
      buttonColumns.add(Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: ElevatedButton(
                    onPressed: () async {
                      final PointsResult result =
                          await _displayEnvidoDialog(context, i);
                      setState(() {
                        widget.gameArgs.puntos![result.player] += result.points;
                      });
                    },
                    child: Text(n == 4 ? "E" : " ENVIDO "))),
            if (widget.gameArgs.flor)
              ElevatedButton(
                  onPressed: () {}, child: Text(n == 4 ? "F" : "    FLOR   ")),
            ElevatedButton(
                onPressed: () async {
                  final PointsResult result =
                  await _displayTrucoDialog(context, i);
                  setState(() {
                    widget.gameArgs.puntos![result.player] += result.points;
                  });
                },
                child: Text(n == 4 ? "T" : "  TRUCO ")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.gameArgs.puntos![i] += 1;
                  });
                }, child: Text(n == 4 ? "G" : "GANADO")),
          ],
        ),
      ));
    }
    return buttonColumns;
  }

  List<Widget> _buildScoreBoards() {
    List<Widget> scoreBoards = [];
    for (int i = 0; i < widget.gameArgs.nPlayers; i++) {
      scoreBoards.add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  // adjustText(widget.gameArgs.playerNames[i]),
                  widget.gameArgs.playerNames[i],
                  style: const TextStyle(
                    color: Color(0xFF1F1E1E),
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.gameArgs.puntos![i].toString(),
                  style: TextStyle(
                    color: Color(0xFF1F1E1E),
                    fontSize: 50,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      // if(i < widget.gameArgs.nPlayers - 1)
      //   scoreBoards.add(Container(color: Colors.black, width: 1, height: 300));
    }
    return scoreBoards;
  }

  List<Widget> _buildBackground1() {
    List<Widget> background = [];
    for (int i = 0; i < widget.gameArgs.nPlayers; i++) {
      background.add(
        Expanded(
          child: Container(
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: Theme.of(context).textTheme.headline2!.color!,
              //     width: 1,
              //   ),
              //   borderRadius: BorderRadius.circular(12),
              // ),
              ),
        ),
      );
      if (i < widget.gameArgs.nPlayers - 1) {
        background.add(Container(
          color: Colors.black,
          width: 1,
          height: 300,
        ));
      }
    }
    return background;
  }

  _displayEnvidoDialog(BuildContext context, int playerCanta) {
    return showDialog(
        context: context,
        builder: (context) {
          return EnvidoDialog(context, widget.gameArgs, playerCanta);
        }
    );
  }

  _displayTrucoDialog(BuildContext context, int playerCanta) {
    return showDialog(
        context: context,
        builder: (context) {
          return TrucoDialog(context, widget.gameArgs, playerCanta);
        }
    );
  }
}
