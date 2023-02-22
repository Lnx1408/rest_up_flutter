// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';

import '../Classes/MenuRestaurante.dart';
import '../Templates/DesignApp.dart';
import 'package:xml/xml.dart' as xml;

class menuComidas extends StatefulWidget {
  const menuComidas({super.key});

  @override
  State<menuComidas> createState() => _menuComidasState();
}

class _menuComidasState extends State<menuComidas> {
  Future<List<MenuRestaurante>> getMenuFromXML(BuildContext context) async {
    final xmlString =
        await DefaultAssetBundle.of(context).loadString("assets/data/menu.xml");
    List<MenuRestaurante> menus = [];

    var raw = xml.parse(xmlString);

    var elements = raw.findAllElements("menu");

    for (var item in elements) {
      menus.add(MenuRestaurante(
          item.findElements("plato").first.text,
          double.parse(item.findElements("precio").first.text),
          item.findElements("imagen").first.text));
    }

    return menus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesignApp.appBarBasic("Menú"),
      backgroundColor: DesignApp.colorPrimario,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(DesignApp.fondoPrincipal_2),
            repeat: ImageRepeat.repeat,
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: getMenuFromXML(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: _listMenus(snapshot.data),
              );
            } else if (snapshot.hasError) {
              return const Text("Error de lectura");
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }
          },
        ),
      ),
    );
  }
}

List<Widget> _listMenus(data) {
  List<Widget> menus = [];
  menus.add(
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.black54,
        child: Text(
          "Extraido desde el XML",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: DesignApp.colorAcent,
          ),
        ),
      ),
    ),
  );
  for (var menu in data) {
    menus.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text(
                          "Plato: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Text(
                        menu.plato,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text(
                          "Precio: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Text(
                        "\$${menu.precio}",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Image.network(
                  menu.imagen,
                  fit: BoxFit.contain,
                  height: 100,
                  width: 150,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  return menus;
}
