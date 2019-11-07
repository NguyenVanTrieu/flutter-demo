import 'dart:async';

import 'package:demo_flutter_app/src/data/storage/secure_storage.dart';
import 'package:demo_flutter_app/src/network/uri_config.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class Authentication {
  final authorizationEndpoint = Uri.parse(UriConfig.URI_AUTHORIZTION_ENDPOIT);

  final identifier = "client";
  final secret = "secret_client";

  Future<bool> login(String username, String password) async {
    var c = Completer<bool>();
    try {
      await oauth2
          .resourceOwnerPasswordGrant(authorizationEndpoint, username, password,
          identifier: identifier, secret: secret)
          .then((client) {
        SecureStorage().storage.write(key: 'jwt', value: client.credentials.toJson());
        c.complete(true);
      });
    } catch (e) {
      c.completeError(false);
    }

    return c.future;
  }
}
