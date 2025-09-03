import 'package:planets_app/domain/planet.dart';

class PlanetsResponse {
  final String msg;
  final List<Planet> data;

  PlanetsResponse({required this.data, this.msg = ''});

  factory PlanetsResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    var msg = json['msg'];
    List<Planet> planetsList = list.map((i) => Planet.fromJson(i)).toList();
    return PlanetsResponse(data: planetsList, msg: msg);
  }
}
