import 'package:liga_bps/adomain/entities/player.dart';
import 'package:liga_bps/adomain/entities/team.dart';

class Cartola {
final List<Player> player;
final Team team;
final double pontosCampeonato;
final int capitaoId;
final double pontos;
final int rodadaAtual;
final double patrimonio;

  Cartola({
    required this.player,
    required this.team,
    required this.pontosCampeonato,
    required this.capitaoId,
    required this.pontos,
    required this.rodadaAtual,
    required this.patrimonio,
  });
}
