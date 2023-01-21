
class GameArgs{
  final int nPlayers;
  final List<String> playerNames;
  final bool flor;
  List<int>? puntos = List<int>.filled(4, 0);

  GameArgs(this.nPlayers, this.playerNames, this.flor, this.puntos);
}