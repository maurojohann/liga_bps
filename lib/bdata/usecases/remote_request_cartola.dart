import 'package:liga_bps/adomain/entities/cartola.dart';
import 'package:liga_bps/adomain/helpers/domain_error.dart';
import 'package:liga_bps/adomain/usecases/request_cartola.dart';
import 'package:liga_bps/bdata/http/http_client.dart';
import 'package:liga_bps/bdata/http/http_error.dart';
import 'package:liga_bps/bdata/models/remote_cartola_model.dart';

class RemoteRequestCartola implements RequestCartola {
  final HttpClient httpClient;
  final String url;
  RemoteRequestCartola({required this.url, required this.httpClient});

  @override
  Future<List<Cartola>> requestCartola(List<String> idList) async {
    List<Cartola> cartolaList = [];

    try {
      for (var id in idList) {
        final httpResponse =
            await httpClient.request(url: url + id, method: 'get');

        cartolaList.add(RemoteCartolaModel.fromJson(httpResponse).toEntity());
      }
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredencials
          : DomainError.unexpected;
    }

    return cartolaList;
    
  }
}
