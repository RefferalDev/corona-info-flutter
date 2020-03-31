

import 'package:corona/repositories/corona_repository.dart';
import 'package:corona/services/network_client.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentServices,
  ...dependentServices
];

List<SingleChildWidget> independentServices = [
  Provider(
    create: (_) => NetworkClient()
  ),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<NetworkClient, CoronaRepository>(
    update: (context, client, service) => CoronaRepository(client),
  )
];

