import 'package:flutter_inicial/modules/dio/dio.module.global.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login.page.dart';

class LoginModule extends Module {
  static const String ROUTE = "/";

  @override
  void routes(r) {
    r.child('/',
      child: (context) => LoginPage(
              controller: Modular.get(),
              logout: r.args.data ?? false,
            ),
      transition: TransitionType.fadeIn,
    );
  }

  @override
  List<Module> get imports => [
    DioModuleGlobal(),
  ];
}
