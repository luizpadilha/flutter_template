import 'package:dio/dio.dart';
import 'package:flutter_inicial/modules/dio/dio.instance.dart';
import 'package:flutter_inicial/modules/login/login.controller.dart';
import 'package:flutter_inicial/modules/login/login.repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DioModuleGlobal extends Module {

  @override
  void exportedBinds(i) {
    i.addInstance<Dio>(DioInstance().dio);
    i.add(LoginRepository.new);
    i.addSingleton(LoginController.new);
  }
}