// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/screens/promociones.dart';
import 'package:rest_up_flutter/screens/promocion_editar.dart';
import 'package:rest_up_flutter/services/services_promociones.dart';

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
              return _listPromociones(snapshot);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: DesignApp.colorSecundario,
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Promociones()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView _listPromociones(AsyncSnapshot<List<dynamic>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data?.length,
      itemBuilder: ((context, index) {
        return Dismissible(
          onDismissed: (direction) async {
            await deletePromocion(snapshot.data?[index]['uid']);
            snapshot.data?.removeAt(index);
          },
          confirmDismiss: (direction) async {
            bool res = false;
            res = await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                        "¿Esta seguro de eliminar ${snapshot.data?[index]['Nombre']}?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          return Navigator.pop(
                            context,
                            false,
                          );
                        },
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          return Navigator.pop(context, true);
                        },
                        child: const Text('Si, estoy seguro'),
                      )
                    ],
                  );
                });
            return res;
          },
          background: Container(
            color: Colors.red,
            child: const Icon(
              Icons.delete,
              size: 100,
            ),
          ),
          direction: DismissDirection.endToStart,
          key: Key(snapshot.data?[index]['uid']),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                        snapshot.data?[index]['Imagen'],
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width * 0.9,
                      ),
                    ),
                    AtributoDescripcionColumna(
                        "", snapshot.data?[index]['Nombre'], context),
                    AtributoDescripcion(
                        "Días: ", snapshot.data?[index]['Dias']),
                    AtributoDescripcion("Restricciones: ",
                        snapshot.data?[index]['Restricciones']),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: DesignApp.colorPrimario,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PromocionActualizar(
                                        uid: snapshot.data?[index]['uid'],
                                        nombre: snapshot.data?[index]['Nombre'],
                                        dias: snapshot.data?[index]['Dias'],
                                        restricciones: snapshot.data?[index]
                                            ['Restricciones'],
                                        imagen: snapshot.data?[index]
                                            ['Imagen'])),
                              );
                            },
                            icon: Icon(
                              FontAwesomeIcons.solidPenToSquare,
                              color: DesignApp.colorSecundario,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
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
