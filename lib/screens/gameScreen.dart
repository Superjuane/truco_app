import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/routes/routingArgs.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.gameArgs});
  final String title = "Truco App";
  final GameArgs gameArgs;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Row(
                  children: [
                    Text("TRUCO", style: Theme.of(context).textTheme.headline2),
                  ],
                ),

                 widget.gameArgs.flor ? SvgPicture.asset(
                  "resources/icons/flower-svgrepo-com.svg",
                  height: 50,
                  width: 50,
                  color: Theme.of(context).textTheme.headline2!.color,
                ) : SvgPicture.asset((darkModeOn) ?
                   "resources/icons/flower-svgrepo-com-not-dark.svg"
                   : "resources/icons/flower-svgrepo-com-not-light.svg",
                   height: 50,
                   width: 50,
                   //color: Theme.of(context).textTheme.headline2!.color,
                 ),

              ]),
              SizedBox(
                child: Stack(
                  children: [
                    Image.asset((darkModeOn)
                        ? 'resources/images/notebook_background.jpg' //DARK MODE
                        : 'resources/images/notebook_background.jpg'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _buildScoreBoards(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildScoreBoards() {
    List<Widget> scoreBoards = [];
    for (int i = 0; i < widget.gameArgs.nPlayers; i++) {
      scoreBoards.add(
        Expanded(
          child: Column(
            children: [
              Text(
                widget.gameArgs.playerNames[i],
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                widget.gameArgs.puntos![i].toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      );
    }
    return scoreBoards;
  }
}
