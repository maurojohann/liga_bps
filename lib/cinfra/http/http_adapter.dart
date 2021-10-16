import 'package:liga_bps/bdata/http/http_client.dart';
import 'package:http/http.dart' as http;

class HttpAdapter implements HttpClient {
  final http.Client client;

  HttpAdapter(this.client);
  @override
  Future<String> request(
      {required String url, required String method, Map? body}) async {
    final response = await client.get(Uri.parse(url));
    return response.body;
  }
}
