// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';
import 'login.dart';

//void main() => runApp(const MenuPrincipal());

// ignore: must_be_immutable
/*class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<StatefulWidget> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  void volverLogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  void campo1() {
    String valor = datoText.middleVar;
    print('presiono el campo1 $valor sd');
  }

  void campo2() {
    String valor = datoText.middleVar;
    print('presiono el campo2 $valor xd');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu principal',
      home: Scaffold(
        backgroundColor: DesignApp.colorPrimario,
        appBar: AppBar(
          title: const Text('Bienvenido a RestUp'),
          backgroundColor: DesignApp.colorTerciario,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              verticalDirection: VerticalDirection.down,
              children: [
                DesignApp.crearTextField("Nuevo Text 1", "Este texto 2", false,
                    FontAwesomeIcons.solidCalendar, () => campo1()),
                SizedBox(
                  height: 15.0,
                  child: Divider(color: DesignApp.colorTransparente),
                ),
                DesignApp.crearTextField("Nuevo Text 2", "Este texto 2", true,
                    FontAwesomeIcons.solidBell, () => campo2()),
                SizedBox(
                  height: 15.0,
                  child: Divider(color: DesignApp.colorTransparente),
                ),
                DesignApp.crearBoton(
                    "Cerrar Sesion", () => volverLogin(context))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
////clase menu
const bool flag = false;
void main() => runApp(const MenuPrincipal());

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});
  static const titu = 'Principal';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: flag,
      title: titu,
      home: Menu(title: titu),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key, required this.title}); //: super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      // menu
      body: const Center(child: Text('Nuevo')),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              //Navigator.push(
              //context, MaterialPageRoute(builder, (context) => const MyApp())),
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      )),
    );
  }
}
