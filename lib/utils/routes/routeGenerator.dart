import 'package:flutter/material.dart';

import 'package:truco_app/screens/initialScreen.dart';
import 'package:truco_app/screens/gameScreen.dart';
import 'package:truco_app/screens/settings1Screen.dart';
import 'package:truco_app/utils/routes/routingArgs.dart';


class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /*'/': (context) => const InitialScreen(),
        //   '/settings1': (context) => const Settings1Screen(),
        //   '/game': (context) => const GameScreen(GameArgs),*/
      case '/':
        return MaterialPageRoute(builder: (_) => const InitialScreen());
      case '/settings1':
        return MaterialPageRoute(builder: (_) => const Settings1Screen());
      case '/game':
        final gameArgs = settings.arguments as GameArgs;
        return MaterialPageRoute(builder: (_) => GameScreen(gameArgs: gameArgs));
      default:
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(title: const Text("ERROR")),
        body: const Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}
