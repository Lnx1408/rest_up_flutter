// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';
import 'package:rest_up_flutter/screens/promociones.dart';
import 'package:rest_up_flutter/screens/ubicacion_gps.dart';
import 'UsuarioLogin.dart';
import 'integrantes.dart';

void main() => runApp(const MenuPrincipal());

// ignore: must_be_immutable
class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<StatefulWidget> createState() => _MenuPrincipalState();
}

void volverLogin(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Login()));
}

void navigateToIntegrantes(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Integrante()));
}

void navigateToUbicacionGPS(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const UbicacionRestaurante()),
  );
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  void navigateToPromociones() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Promociones()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignApp.colorPrimario,
      appBar: DesignApp.appBarBasic('Bienvenido a RestUp'),
      drawer: panelNavegacion(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                createCardButton(context, "Menú", DesignApp.imgMenuComidas,
                    () => navigateToPromociones()),
                createCardButton(
                    context,
                    "Promociones",
                    DesignApp.imgMenuPromociones,
                    () => navigateToPromociones()),
                createCardButton(context, "Reservas", DesignApp.imgMenuReservas,
                    () => navigateToPromociones()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector createCardButton(BuildContext context, String texto,
      String imagen, Function() navigateTo) {
    return GestureDetector(
      onTap: () {
        navigateTo();
      },
      child: Card(
        color: DesignApp.colorSecundario,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
              child: Image.asset(
                imagen,
                height: 125,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    texto,
                    style: TextStyle(
                      color: DesignApp.colorPrimario,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Drawer panelNavegacion(context) {
  var drawerHeader = UserAccountsDrawerHeader(
    accountName: const Text(
      "Usuario",
    ),
    accountEmail: const Text(
      "Something@xd.com",
    ),
    currentAccountPicture: CircleAvatar(
      backgroundColor: DesignApp.colorPrimario,
      child: const FlutterLogo(size: 42.0),
    ),
  );
  final drawerItems = ListView(
    children: [
      drawerHeader,
      /*ListTile(
        title: const Text(
          "FeedBack",
        ),
        leading: const Icon(FontAwesomeIcons.solidCommentDots),
        onTap: () {
          Navigator.pop(context);
        },
      ),*/
      ListTile(
        title: const Text(
          "Encuéntranos",
        ),
        leading: const Icon(FontAwesomeIcons.locationDot),
        onTap: () {
          navigateToUbicacionGPS(context);
        },
      ),
      ListTile(
        title: const Text(
          "Acerca de",
        ),
        leading: const Icon(FontAwesomeIcons.info),
        onTap: () {
          navigateToIntegrantes(context);
        },
      ),
      const SizedBox(
        child: Divider(
          color: Colors.white,
          height: 2.0,
        ),
      ),
      ListTile(
        title: const Text(
          "Cerrar Sesion",
        ),
        leading: const Icon(FontAwesomeIcons.rightToBracket),
        onTap: () {
          volverLogin(context);
        },
      ),
    ],
  );
  return Drawer(
    backgroundColor: DesignApp.colorTerciario,
    child: drawerItems,
  );
}
