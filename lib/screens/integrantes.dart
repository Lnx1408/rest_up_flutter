// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rest_up_flutter/Classes/integrantes_data.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';
import 'package:xml/xml.dart' as xml;

class Integrante extends StatefulWidget {
  const Integrante({super.key});

  @override
  State<Integrante> createState() => _IntegranteState();
}

class _IntegranteState extends State<Integrante> {
  Future<List<IntegrantesData>> getIntegrantesXML(BuildContext context) async {
    final xmlSource = await DefaultAssetBundle.of(context)
        .loadString("assets/data/integrantes.xml");
    List<IntegrantesData> integrantes = [];
    var raw = xml.parse(xmlSource);

    var elements = raw.findAllElements("Integrante");

    for (var item in elements) {
      integrantes.add(IntegrantesData(
          item.findElements("nombres").first.text,
          item.findElements("correo").first.text,
          item.findElements("profesion").first.text,
          item.findElements("git_account").first.text,
          item.findElements("imagen").first.text));
    }
    return integrantes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesignApp.appBarBasic("Integrantes"),
      backgroundColor: DesignApp.colorPrimario,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: getIntegrantesXML(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: _listaIntegrante(snapshot.data, context),
              );
            } else if (snapshot.hasError) {
              return const Text("Error de lectura");
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

// ----------------------------------------------

List<Widget> _listaIntegrante(data, context) {
  List<Widget> WidgetIntegrante = [];

  for (IntegrantesData integrante in data) {
    WidgetIntegrante.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          child: Container(
            color: DesignApp.colorTerciario,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  child: Image.network(
                    integrante.imagen,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
                AtributoDescripcionColumna("", integrante.nombres, context),
                AtributoDescripcion("Correo: ", integrante.correo),
                AtributoDescripcion("Profesión: ", integrante.profesion),
                AtributoDescripcion("GitHub: ", integrante.git_account),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  return WidgetIntegrante;
}

Container AtributoDescripcion(campo, descripcion) {
  return Container(
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          campo,
          textAlign: TextAlign.start,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          descripcion,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    ),
  );
}

Column AtributoDescripcionColumna(campo, descripcion, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: const EdgeInsets.only(bottom: 4.0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            descripcion,
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ],
  );
}
