import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_inicial/enums/tipo.exception.login.dart';
import 'package:flutter_inicial/exceptions/my.exception.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginRepository {

  final Dio _client = Modular.get();

  Future<Map<String, dynamic>> gerarTokenAndRetornaUser(String login, String pass, String pathApi, {bool canLancarException = true, bool isRegisteredUser = true}) async {
    try {
      String path = isRegisteredUser ? '' : pathApi;
      var response = await _client.post(
        "$path/api/auth/login",
        data: jsonEncode({
          'login': login.toUpperCase(),
          'password': pass,
        }),
      );
      print(response);
      if (response.statusCode == 200 && response.data != null && response.data['erro'] == null) {
        return response.data;
      }
      if (response.data['erro'] != null) {
        var erro = response.data['erro'] as String;
        TipoExceptionLogin? tipoExceptionLogin = getTipoExceptionLogin(erro);
        if (tipoExceptionLogin != null) {
          switch (tipoExceptionLogin) {
            case TipoExceptionLogin.USUARIO_CONTA_EXPIRADA:
              return throw MyException(msg: "Sua conta expirou, entre em contato com o suporte.");
            case TipoExceptionLogin.USUARIO_SENHA_EXPIRADA:
              return throw MyException(msg: "Sua senha expirou, entre em contato com o suporte.");
            case TipoExceptionLogin.USUARIO_PERFIL_SEM_PERMISSAO:
              return throw MyException(msg: "Sua conta não tem permissão, entre em contato com o suporte.");
          }
        }
        throw MyException(msg: erro);
      }
    } catch (erro) {
      log("Error ${erro} ");
      if (canLancarException) {
        rethrow;
      }
    }
    throw MyException(msg: 'Erro inesperado para gerar token');
  }

  TipoExceptionLogin? getTipoExceptionLogin(String name) {
    try {
      return TipoExceptionLogin.stringToTipoExceptionLogin(name);
    } catch (erro) {
      return null;
    }
  }
}
