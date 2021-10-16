import 'dart:convert';

import 'package:liga_bps/adomain/entities/team.dart';

class RemoteTeamModel {
  final String nomeCartola;
  final String fotoPerfil;
  final String nome;
  final String urlEscudoSvg;
  final String slug;
  final int timeId;

  RemoteTeamModel({
    required this.nomeCartola,
    required this.fotoPerfil,
    required this.nome,
    required this.urlEscudoSvg,
    required this.slug,
    required this.timeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome_cartola': nomeCartola,
      'foto_perfil': fotoPerfil,
      'nome': nome,
      'url_escudoSvg': urlEscudoSvg,
      'slug': slug,
      'time_id': timeId,
    };
  }

  factory RemoteTeamModel.fromMap(Map<String, dynamic> map) {
    return RemoteTeamModel(
      nomeCartola: map['nome_cartola'],
      fotoPerfil: map['foto_perfil'],
      nome: map['nome'],
      urlEscudoSvg: map['url_escudoSvg'] ?? '',
      slug: map['slug'],
      timeId: map['time_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteTeamModel.fromJson(String source) =>
      RemoteTeamModel.fromMap(json.decode(source));

  Team toEntity() => Team(
      nomeCartola: nomeCartola,
      fotoPerfil: fotoPerfil,
      nome: nome,
      urlEscudoSvg: urlEscudoSvg,
      slug: slug,
      timeId: timeId);
}
