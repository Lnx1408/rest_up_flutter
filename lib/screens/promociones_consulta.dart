// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rest_up_flutter/services/services.dart';

import '../Templates/DesignApp.dart';

class PromocionConsulta extends StatefulWidget {
  const PromocionConsulta({super.key});

  @override
  State<PromocionConsulta> createState() => _PromocionConsultaState();
}

class _PromocionConsultaState extends State<PromocionConsulta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesignApp.appBarBasic("Lista de promociones"),
      body: FutureBuilder(
          future: getDatosPromociones(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  return _listPromociones(snapshot.data, index, context);
                }),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Widget _listPromociones(data, index, context) {
  return Padding(
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
                data?[index]['Imagen'],
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
            AtributoDescripcionColumna("", data?[index]['Nombre'], context),
            AtributoDescripcion("Días: ", data?[index]['Dias']),
            AtributoDescripcion(
                "Restricciones: ", data?[index]['Restricciones']),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
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
