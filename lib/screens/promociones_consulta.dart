import 'package:cloud_firestore/cloud_firestore.dart';
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
      appBar: DesignApp.appBarBasic("Consulta de promociones"),
      body: FutureBuilder(
          future: getDatosPromociones(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  return Text(snapshot.data?[index]['Nombre'] +
                      "\t" +
                      snapshot.data?[index]['Dias']);
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

Widget _listPromociones(data, index) {
  return Text("data");
}
