import 'package:flutter/material.dart';
import 'package:flutter_inicial/components/alert.component.dart';
import 'package:flutter_inicial/components/carregando.component.dart';
import 'package:flutter_inicial/components/icon.button.component.dart';
import 'package:flutter_inicial/components/label_field.component.dart';
import 'package:flutter_inicial/components/pop.scope.component.dart';
import 'package:flutter_inicial/components/scaffold.component.dart';
import 'package:flutter_inicial/modules/home/home.controller.dart';
import 'package:flutter_inicial/modules/login/login.module.dart';
import 'package:flutter_inicial/viewobject/home.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({
    required this.controller,
  });

  static const String ROUTE = "/home/";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future _future;

  @override
  void initState() {
    super.initState();
    _future = _carregarDados(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  HomeController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;

    return PopScopeComponent(
      child: ScaffoldComponent(
        isHome: true,
        isDrawer: false,
        isActionHome: false,
        isActionVoltar: false,
        titleAppBar: 'Inicio',
        actions: [
          IconButtonComponent(
            icon: Icons.exit_to_app,
            iconColor: Colors.white,
            onPressed: () {
              Modular.to.pushNamedAndRemoveUntil(
                  LoginModule.ROUTE, (route) => route.isFirst,
                  arguments: true);
            },
          ),
          IconButtonComponent(
            icon: Icons.sync,
            iconColor: Colors.white,
            onPressed: () async {
              await _carregarDados(context);
            },
          ),
        ],
        body: FutureBuilder(
          future: _future,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Carregando(inverterCor: true));
            } else {
              return Padding(
                padding: EdgeInsets.all(deviceSize.width * 0.02),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: TripleBuilder<HomeController, Home>(
                        store: controller,
                        builder: (ctx, triple) {
                          var state = triple.state;
                          return triple.isLoading
                              ? const Center(child: Carregando(inverterCor: true))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    LabelAndFieldComponent(
                                      label: "Total usuario",
                                      field: state.totalUsuarios.toString(),
                                      inline: true,
                                      subtitle: false,
                                    ),
                                  ],
                                );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }


  Future<void> _carregarDados(BuildContext context) async {
    try {
      controller.setLoading(true);
      return await controller.initPage();
    } catch (erro) {
      AlertComponent.show(context,
          title: "Ops!",
          subTitle: "Erro ao carregar tela",
          style: AlertStyle.error);
    } finally {
      controller.setLoading(false);
    }
  }
}
