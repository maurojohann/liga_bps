import 'package:liga_bps/adomain/entities/cartola.dart';

abstract class RequestCartola {
  Future<List<Cartola>> requestCartola(List<String> id);
}
