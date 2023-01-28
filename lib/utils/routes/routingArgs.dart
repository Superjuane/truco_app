
class GameArgs{
  final int nPlayers;
  final List<String> playerNames;
  final bool flor;
  List<int>? puntos = List<int>.filled(4, 0);
  final bool quince;

  GameArgs(this.nPlayers, this.playerNames, this.flor, this.puntos, this.quince);
}

class PointsResult{
  final int player; // 0, 1, 2, 3
  final int points; // 0 - 15

  PointsResult(this.player, this.points);

}