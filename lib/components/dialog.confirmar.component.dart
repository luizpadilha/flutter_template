import 'package:flutter/material.dart';
import 'package:flutter_inicial/components/alert.dialog.component.dart';

abstract class ShowDialogConfirmarComponent {
  
  static Future<bool?> showDialogConfirmar(BuildContext context, {required Widget content}) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogComponent(
          content: content,
        );
      },
    );
  }

}