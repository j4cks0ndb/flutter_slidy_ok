import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidy_ok/app/shared/auth/auth_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ReactionDisposer disposer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disposer = autorun((_){
      final  auth = Modular.get<AuthController>();
      if(auth.status == AuthStatus.login){
          //Future.delayed(Duration(seconds: 2)).then((value) => Modular.to.pushReplacementNamed('/home/'));
          Modular.to.pushReplacementNamed('/home/');
      }else if(auth.status == AuthStatus.logoff){
          Modular.to.pushReplacementNamed('/login/');
      }
      
    });
    

  } 

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Center(child: CircularProgressIndicator(),)
    );
  }
}
