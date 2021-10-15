import 'package:liga_bps/adomain/entities/atletas.dart';
import 'package:liga_bps/adomain/entities/time.dart';

class Cartola {
final List<Atletas> atletas;
final Time time;
final double pontosCampeonato;
final int capitaoId;
final double pontos;
final int rodadaAtual;
final double patrimonio;

  Cartola({
    required this.atletas,
    required this.time,
    required this.pontosCampeonato,
    required this.capitaoId,
    required this.pontos,
    required this.rodadaAtual,
    required this.patrimonio,
  });
}
