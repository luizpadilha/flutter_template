import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_inicial/exceptions/my.exception.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeRepository {

  final Dio _client = Modular.get();

  Future<int> buscarTotalUsuarios() async {
    try {
      var response = await _client.post(
        "/api/usuario/listar-usuarios",
        data: jsonEncode({
          'login': '',
          'page': 1,
          'size': 20,
        }),
      );
      if (response.statusCode != 200) {
        log("Error ${response.data} ");
        return throw MyException(msg: 'Não foi possivel buscar o registro');
      }
      Map<String, dynamic> jsonResponse = response.data;

      if (jsonResponse['totalRegistros'] != null) {
        return int.parse(jsonResponse['totalRegistros'].toString());
      }

      return 0;
    } catch (e) {
      log("Error ${e} ");
      throw MyException(msg: 'Erro converter registro, detalhes: ${e.toString()} ');
    }
  }
}
