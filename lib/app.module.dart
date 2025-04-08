import 'package:flutter_inicial/modules/home/home.module.dart';
import 'package:flutter_inicial/modules/login/login.module.dart';
import 'package:flutter_modular/flutter_modular.dart';
class AppModule extends Module {

  @override
  void binds(i) {
  }

  @override
  List<Module> get imports => [
  ];

  @override
  void routes(r) {
    r.module(LoginModule.ROUTE, module: LoginModule());
    r.module(HomeModule.ROUTE, module: HomeModule());
  }
}
