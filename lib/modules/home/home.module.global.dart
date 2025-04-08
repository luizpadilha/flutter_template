import 'package:flutter_inicial/modules/home/home.controller.dart';
import 'package:flutter_inicial/modules/home/home.repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModuleGlobal extends Module {

  @override
  void exportedBinds(i) {
    i.add(HomeRepository.new);
    i.addSingleton(HomeController.new);
  }

}