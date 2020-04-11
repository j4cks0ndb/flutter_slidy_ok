import 'package:slidy_ok/app/pages/splash/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:slidy_ok/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:slidy_ok/app/app_widget.dart';
import 'package:slidy_ok/app/modules/home/home_module.dart';
import 'package:slidy_ok/app/pages/splash/splash_page.dart';
import 'package:slidy_ok/app/shared/auth/repositories/auth_repository.dart';
import 'package:slidy_ok/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:slidy_ok/app/shared/utils/constants.dart';

import 'modules/login/login_module.dart';
import 'shared/auth/auth_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashPage()),
        Router('/home', module: HomeModule()),
        Router('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
