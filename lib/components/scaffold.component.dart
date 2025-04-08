import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inicial/components/icon.button.component.dart';
import 'package:flutter_inicial/modules/home/home.page.dart';
import 'package:flutter_modular/flutter_modular.dart';
class ScaffoldComponent extends StatelessWidget {
  final String titleAppBar;
  final Widget? widgetTitleAppBar;
  final bool isHome;
  final bool isDrawer;
  final bool extendBody;
  final bool isActionHome;
  final bool isActionVoltar;
  final bool isAppBar;
  final Widget body;
  List<Widget>? actions;
  final void Function()? onPressedFloatingActionButton;
  final void Function()? onTapGestureDetector;

  ScaffoldComponent({
    required this.titleAppBar,
    this.widgetTitleAppBar,
    required this.body,
    this.isHome = false,
    this.isDrawer = false,
    this.isAppBar = true,
    this.isActionHome = false,
    this.extendBody = false,
    this.isActionVoltar = false,
    this.actions,
    this.onPressedFloatingActionButton,
    this.onTapGestureDetector,
    super.key,
  });

  void _onTapGestureDetectorPadrao(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var deviceSize = mediaQuery.size;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        if (onTapGestureDetector == null) {
          _onTapGestureDetectorPadrao(context);
        } else {
          onTapGestureDetector!();
        }
      },
      child: Scaffold(
        appBar: !isAppBar ? null :AppBar(
          toolbarHeight: deviceSize.height * 0.08,
          title: widgetTitleAppBar ?? Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              style: textTheme.titleMedium,
              titleAppBar,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          actions: _actions(deviceSize),
          leading: _leading(deviceSize),
        ),
        drawer: null,
        extendBody: extendBody,
        body: body,
        backgroundColor: const Color(0xFFEAF6F6),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  List<Widget> _actions(var deviceSize) {
    List<Widget> actions = [];
    if (this.actions != null) {
      actions.addAll(this.actions!);
    }
    return actions;
  }

  Widget? _leading(var deviceSize) {
    if (isActionHome) {
      return _actionHome(deviceSize);
    }
    if (isActionVoltar) {
      return _actionVoltar(deviceSize);
    }
    if (isDrawer) {
      return _actionDrawer(deviceSize);
    }
    return null;
  }



  Widget _actionHome(var deviceSize) {
    return IconButtonComponent(
      iconColor: Colors.white,
      icon: Icons.home,
      onPressed: () {
        Modular.to.pushReplacementNamed(HomePage.ROUTE, arguments: null);
      },
    );
  }

  Widget _actionVoltar(Size deviceSize) {
    return IconButtonComponent(
      iconColor: Colors.white,
      icon: Icons.arrow_back,
      onPressed: () {
        Modular.to.pop();
      },
    );
  }

  Widget _actionDrawer(var deviceSize) {
    return Builder(builder: (context) {
      return IconButtonComponent(
        iconColor: Colors.white,
        icon: Icons.menu,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      );
    });
  }
}
