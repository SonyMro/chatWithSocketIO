import 'package:chat/global/environment.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/models/usuarios_response.dart';
import 'package:chat/services/auth_services.dart';
import 'package:http/http.dart' as http;

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get('${Environment.apiUrl}/usuarios/all',
          headers: {
            'Content-type': 'application/json',
            'x-token': await AuthService.getToken()
          });
      final usuariosReponse = usuariosReponseFromJson(resp.body);
      return usuariosReponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}
