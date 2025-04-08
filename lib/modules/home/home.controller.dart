import 'package:flutter_inicial/modules/home/home.repository.dart';
import 'package:flutter_inicial/viewobject/home.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeController extends Store<Home> {
  final HomeRepository repo = Modular.get();

  HomeController() : super(Home());

  Future<void> initPage() async {
    await carregarTotalUsuarios();
  }

  void atualizarPagina() {
    update(state, force: true);
  }

  Future<void> carregarTotalUsuarios() async {
    state.totalUsuarios = await buscarTotalUsuarios();
    update(state);
  }

  Future<int> buscarTotalUsuarios() async {
    return await repo.buscarTotalUsuarios();
  }


}
