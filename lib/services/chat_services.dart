import 'package:chat/global/environment.dart';
import 'package:chat/models/mensajes_response.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CharService with ChangeNotifier {
  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    final resp = await http.get('${Environment.apiUrl}/mensajes/$usuarioID',
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
        });
    final mensajesResp = mensajesReponseFromJson(resp.body);
    return mensajesResp.mensajes;
  }
}
