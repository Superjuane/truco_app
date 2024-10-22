import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:truco_app/utils/functions.dart';
import 'package:truco_app/utils/routes/routingArgs.dart';

class Settings1Screen extends StatefulWidget {
  const Settings1Screen({super.key});

  final String title = "Truco App";

  @override
  State<Settings1Screen> createState() => _Settings1ScreenState();
}

class _Settings1ScreenState extends State<Settings1Screen> {
  var nPlayers = 2;
  List<String> namesGenerated = [];
  bool flor = false;
  bool quince = false;
  final List<TextEditingController> myControllers = [TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController()];

  refreshNames() {
    namesGenerated = [];
    for (var i = 0; i < 4; i++) {
      namesGenerated.add(randomName());
    }
  }

  @override
  void initState() {
    super.initState();
    refreshNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,

      body: Padding(
        padding: const EdgeInsets.only(top:35.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 50,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                            child: Text("AJUSTES",
                                style: Theme.of(context).textTheme.headline1)),
                        const SizedBox(height: 15),
                        //width: MediaQuery.of(context).size.width * 0.85,
                        //height: MediaQuery.of(context).size.height * 0.35,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){
                              setState((){
                              namesGenerated = [];
                              myControllers.forEach ((c) => {c.clear()});

                              for (var i = 0; i < 4; i++) {
                                namesGenerated.add(randomName());
                              }
                              });
                            }, icon: const Icon(Icons.refresh)),
                          ],
                        ),
                        Container(
                          // width: Size.infinite.width,
                          // height: Size.infinite.height,
                          width: MediaQuery.of(context).size.width * 0.85,
                          height:MediaQuery.of(context).size.height * 0.10 * nPlayers + 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 12.0, left: 6.0, right: 6.0),
                            child: Column(
                              children: [

                                TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(21),
                                  ],
                                  controller: myControllers[0],
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context).colorScheme.secondary,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: namesGenerated[0],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(21),
                                  ],
                                  controller: myControllers[1],
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context).colorScheme.secondary,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: namesGenerated[1],
                                  ),
                                ),
                                if(nPlayers >= 3)
                                  const SizedBox(height: 10),
                                if(nPlayers >= 3)
                                  TextField(
                                    controller: myControllers[2],
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Theme.of(context).colorScheme.secondary,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: namesGenerated[2],
                                    ),
                                  ),
                                if(nPlayers == 4)
                                  const SizedBox(height: 10),
                                if(nPlayers == 4)
                                  TextField(
                                    controller: myControllers[3],
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Theme.of(context).colorScheme.secondary,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: namesGenerated[3],
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      if(nPlayers < 4)GestureDetector(
                                        onTap: () {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text(' ⚠️DE MOMENTO SOLO SE PUEDE\n '
                                                  'JUGAR CON DOS EQUIPOS ⚠️'),
                                            )
                                          );
                                          setState(() {
                                            ++nPlayers;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            const Icon(Icons.add_circle_outline),
                                            Text("Agregar equipo",
                                                style: Theme.of(context).textTheme.bodyText1),
                                          ],
                                        ),
                                      ),
                                      if(nPlayers > 2)GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            --nPlayers;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            const Icon(Icons.remove_circle_outline, color: Colors.red,),
                                            Text(" Quitar equipo",
                                                style: Theme.of(context).textTheme.bodyText1),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Jugar con flor", style: Theme.of(context).textTheme.bodyText2),
                              Switch(value: flor, activeColor: const Color(0xFF5361BD),onChanged: (value) {
                                setState(() {
                                  flor = value;
                                });
                              }),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Jugar a 15", style: Theme.of(context).textTheme.bodyText2),
                              Switch(value: quince, activeColor: const Color(0xFF5361BD),onChanged: (value) {
                                setState(() {
                                  quince = value;
                                });
                              }),
                            ],
                          ),
                        )

                      ],
                    ),
                const SizedBox(height: 50),
                Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       FloatingActionButton(
                         heroTag: "btn1",
                         onPressed: () {
                           Navigator.of(context).pop();
                         },
                         child: const Icon(Icons.arrow_back),
                       ),
                       FloatingActionButton.extended(
                         heroTag: "btn2",
                         onPressed: () {
                           List<String> namesResult = [];
                           for(int i = 0; i < nPlayers; ++i) {
                             if (myControllers[i].text == "") {
                               namesResult.add(namesGenerated[i]);
                             } else {
                               namesResult.add(myControllers[i].text);
                             }
                           }
                           //mejor no // Navigator.pushNamedAndRemoveUntil(context, '/game', (Route<dynamic> route) => false, arguments: GameArgs(nPlayers, namesResult, flor, [0,0,0,0]));
                           // Navigator.popAndPushNamed(context, '/game', arguments: GameArgs(nPlayers, namesResult, flor, [0,0,0,0]));
                           Navigator.pushNamed(context, '/game', arguments: GameArgs(2, namesResult, flor, [0,0,0,0], quince));
                         },
                         label: const Text("Empezar  Partida"),
                       ),
                     ],
                   ),
              ],
            ),
          ),


        ),
      ),
    );
  }
}
