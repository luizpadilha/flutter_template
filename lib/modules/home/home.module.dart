import 'package:flutter_inicial/modules/dio/dio.module.global.dart';
import 'package:flutter_inicial/modules/home/home.module.global.dart';
import 'package:flutter_inicial/modules/home/home.page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  static const String ROUTE = "/home/";

  @override
  void routes(r) {
    r.child('/',
      child: (context) => HomePage(
              controller: Modular.get(),
            ),
      transition: TransitionType.fadeIn,
    );
  }

  @override
  List<Module> get imports => [
    HomeModuleGlobal(),
    DioModuleGlobal(),
  ];
}
