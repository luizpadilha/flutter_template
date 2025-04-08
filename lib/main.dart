import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_inicial/app.module.dart';
import 'package:flutter_inicial/app.widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  Animate.restartOnHotReload = true;
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}