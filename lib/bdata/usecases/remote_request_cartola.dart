import 'package:liga_bps/adomain/entities/cartola.dart';
import 'package:liga_bps/adomain/usecases/request_cartola.dart';
import 'package:liga_bps/bdata/http/http_client.dart';

class RemoteRequestCartola implements RequestCartola {
  final HttpClient httpClient;
  final String url;
  RemoteRequestCartola({required this.url, required this.httpClient});

  @override
  Future<List<Cartola>> requestCartola(List<String> idList) async {
    List<Cartola> cartolaList = [];


    for (var id in idList) {
      cartolaList.add(await httpClient.request(url: url + id));
}

    return cartolaList;
  }
}

