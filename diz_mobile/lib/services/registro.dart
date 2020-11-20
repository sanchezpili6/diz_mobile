import 'package:diz/services/RegisterUser.dart';
import 'package:http/http.dart' as http;

String correo='', contrasena='', telefono='', nombrePila='', apellidoP='', apellidoM='', genero='';
DateTime cumple;

Future<RegisterUser> registerUser(user) async {
  String url = 'http://35.239.19.77:8000/clients/';
  Map<String, String> headers = {"Content-type": "application/json"};
  final response = await http.post(url, headers: headers, body: user);

  if (response.statusCode == 201) {
    print("Status = " + response.statusCode.toString());
  } else {
    print("Status = " + response.statusCode.toString());
    return null;
  }
}