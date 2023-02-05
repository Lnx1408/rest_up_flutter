import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(const MenuPrincipal());

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  void volverLogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu principal',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bienvenido a RestUp'),
        ),
        body: Center(
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text(
                    'Salir',
                    style: TextStyle(color: Colors.white70, fontSize: 25.0),
                  ),
                  onPressed: () {
                    volverLogin(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
