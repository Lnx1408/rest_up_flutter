import 'package:flutter/material.dart';

import '../Templates/DesignApp.dart';
import 'UsuarioLogin.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignApp.colorPrimario,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(DesignApp.splash),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                child: Center(
                  child: Image.asset(
                    DesignApp.logoWhite,
                  ),
                ),
              ),
              Text(
                "Rest\nUp".toUpperCase(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: DesignApp.colorAcent,
                  fontSize: 65.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Italiana",
                ),
              ),
              Text(
                "Bienvenidos".toUpperCase(),
                style: TextStyle(
                  color: DesignApp.colorAcent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Italiana",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
