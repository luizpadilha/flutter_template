enum TipoExceptionLogin {
  USUARIO_SENHA_EXPIRADA(),
  USUARIO_CONTA_EXPIRADA(),
  USUARIO_PERFIL_SEM_PERMISSAO();


  const TipoExceptionLogin();

  @override
  String toString() {
    return name;
  }

  static TipoExceptionLogin stringToTipoExceptionLogin(String value) {
    return TipoExceptionLogin.values.firstWhere((e) => e.name == value);
  }
}
