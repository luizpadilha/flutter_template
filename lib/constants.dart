import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

get baseUrl => 'http://192.168.0.2:8091';
//get baseUrl => 'http://192.168.0.104:8081';

bool platformIsIos(BuildContext context) {
  return Theme.of(context).platform == TargetPlatform.iOS;
}

bool isTablet(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  final larguraTela = mediaQuery.size.width;
  return larguraTela > 600;
}

const colorPrimary = Color(0xFF31588E);
const colorSecond = Color(0xFF27ACB6);
const colorTertiary = Color(0xFF8A989A);

const String KEY_USERLOGIN = "userlogin";
const String KEY_USERPASSWORD = "passwordlogin";
const String KEY_EXPIRYDATE = "expirylogin";
const String KEY_EXPIRYTOKENDATE = "expirytoken";
const String KEY_TOKEN = "tokenlogin";


