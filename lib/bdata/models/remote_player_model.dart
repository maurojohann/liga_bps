import 'dart:convert';

import 'package:liga_bps/adomain/entities/player.dart';

class RemotePlayerModel {
  final int atletaId;
  final int rodadaId;
  final int clubeId;
  final double pontosNum;
  final String apelido;
  final String apelidoAbreviado;
  final String nome;

  RemotePlayerModel({
    required this.atletaId,
    required this.rodadaId,
    required this.clubeId,
    required this.pontosNum,
    required this.apelido,
    required this.apelidoAbreviado,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'atleta_id': atletaId,
      'rodada_id': rodadaId,
      'clube_id': clubeId,
      'pontos_num': pontosNum,
      'apelido': apelido,
      'apelido_abreviado': apelidoAbreviado,
      'nome': nome,
    };
  }

  factory RemotePlayerModel.fromMap(Map<String, dynamic> map) {
    return RemotePlayerModel(
      atletaId: map['atleta_id'],
      rodadaId: map['rodada_id'],
      clubeId: map['clube_id'],
      pontosNum: map['pontos_num'].toDouble(),
      apelido: map['apelido'],
      apelidoAbreviado: map['apelido_abreviado'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RemotePlayerModel.fromJson(String source) =>
      RemotePlayerModel.fromMap(json.decode(source));

  Player toEntity() => Player(
      atletaId: atletaId,
      rodadaId: rodadaId,
      clubeId: clubeId,
      pontosNum: pontosNum,
      apelido: apelido,
      apelidoAbreviado: apelidoAbreviado,
      nome: nome);
}
