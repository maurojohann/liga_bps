import 'package:flutter/material.dart';
import 'package:liga_bps/bdata/http/http_client.dart';
import 'package:liga_bps/bdata/models/remote_cartola_model.dart';
import 'package:liga_bps/bdata/usecases/remote_request_cartola.dart';
import 'package:liga_bps/cinfra/http/http_adapter.dart';
import 'package:http/http.dart';

import 'adomain/entities/cartola.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Cartola> cartolas = [];

  @override
  void initState() {
    final Client client = Client();
    final HttpClient httpClient = HttpAdapter(client);

    final RemoteRequestCartola remoteRequests = RemoteRequestCartola(
        url: 'https://api.cartolafc.globo.com/time/id/',
        httpClient: httpClient);

    requestCartola(remoteRequests);

    super.initState();
  }

  Future<List<Cartola>> requestCartola(
      RemoteRequestCartola remoteRequests) async {
    cartolas = await remoteRequests.requestCartola(['26050244']);
    setState(() {
      cartolas;
    });

    return cartolas;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(cartolas.isEmpty ? '' : cartolas[0].team.nome),
    );
  }
}
