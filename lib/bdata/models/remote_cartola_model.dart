import 'dart:convert';

import 'package:liga_bps/adomain/entities/cartola.dart';

import 'remote_player_model.dart';
import 'remote_team_model.dart';

class RemoteCartolaModel {
  final List<RemotePlayerModel> players;
  final RemoteTeamModel team;
  final double pontosCampeonato;
  final int capitaoId;
  final double pontos;
  final int rodadaAtual;
  final double patrimonio;

  RemoteCartolaModel({
    required this.players,
    required this.team,
    required this.pontosCampeonato,
    required this.capitaoId,
    required this.pontos,
    required this.rodadaAtual,
    required this.patrimonio,
  });

  Map<String, dynamic> toMap() {
    return {
      'atletas': players.map((x) => x.toMap()).toList(),
      'time': team.toMap(),
      'pontos_campeonato': pontosCampeonato,
      'capitao_id': capitaoId,
      'pontos': pontos,
      'rodada_atual': rodadaAtual,
      'patrimonio': patrimonio,
    };
  }

  factory RemoteCartolaModel.fromMap(Map<String, dynamic> map) {
    return RemoteCartolaModel(
      players: List<RemotePlayerModel>.from(
          map['atletas']?.map((x) => RemotePlayerModel.fromMap(x))),
      team: RemoteTeamModel.fromMap(map['time']),
      pontosCampeonato: map['pontos_campeonato'],
      capitaoId: map['capitao_id'],
      pontos: map['pontos'],
      rodadaAtual: map['rodada_atual'],
      patrimonio: map['patrimonio'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteCartolaModel.fromJson(String source) =>
      RemoteCartolaModel.fromMap(json.decode(source));

  Cartola toEntity() => Cartola(
        player: players.map((e) => e.toEntity()).toList(),
        team: team.toEntity(),
        pontosCampeonato: pontosCampeonato,
        capitaoId: capitaoId,
        pontos: pontos,
        rodadaAtual: rodadaAtual,
        patrimonio: patrimonio,
      );
}
