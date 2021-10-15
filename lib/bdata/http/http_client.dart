import 'package:liga_bps/adomain/entities/cartola.dart';

abstract class HttpClient {
  Future<Cartola> request({
    String url
  });
}
