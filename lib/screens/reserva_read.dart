// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';
import 'package:rest_up_flutter/screens/reserva_insert.dart';
import 'package:rest_up_flutter/screens/reserva_update.dart';
import 'package:rest_up_flutter/services/services_reserva.dart';
import '../Templates/DesignApp.dart';

class ReservaRead extends StatefulWidget {
  const ReservaRead({super.key});

  @override
  State<ReservaRead> createState() => _ReservaReadState();
}

class _ReservaReadState extends State<ReservaRead> {
  String _usuario = "";
  @override
  Widget build(BuildContext context) {
    for (var datoUsuario in datoList.usuarioActual) {
      _usuario = datoUsuario["NombreUsuario"];
    }

    return Scaffold(
      appBar: DesignApp.appBarBasic("Historial de reservas"),
      body: FutureBuilder(
          future: getDatosReserva(_usuario),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _listReservas(snapshot);
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
            MaterialPageRoute(builder: (context) => const ReservaInsert()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView _listReservas(AsyncSnapshot<List<dynamic>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data?.length,
      itemBuilder: ((context, index) {
        return Dismissible(
          onDismissed: (direction) async {
            await deleteReserva(snapshot.data?[index]['uid']);
            snapshot.data?.removeAt(index);
          },
          confirmDismiss: (direction) async {
            bool res = false;
            res = await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                        "¿Esta seguro de eliminar la reserva del día ${snapshot.data?[index]['Fecha']}?"),
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
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "Reserva eliminada con éxito",
                              style:
                                  TextStyle(color: DesignApp.colorSecundario),
                            ),
                            backgroundColor: DesignApp.colorTerciario,
                          ));
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
                        DesignApp.tagReserva,
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width * 0.9,
                      ),
                    ),
                    AtributoDescripcionColumna(
                        "", snapshot.data?[index]['Fecha'], context),
                    AtributoDescripcion("Cantidad de personas: ",
                        snapshot.data?[index]['CantidadPersonas'], context),
                    const SizedBox(
                      height: 10,
                    ),
                    AtributoDescripcion(
                        "Precio: ", snapshot.data?[index]['Precio'], context),
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
                                    builder: (context) => ReservaUpdate(
                                          uid: snapshot.data?[index]['uid'],
                                          usuario: snapshot.data?[index]
                                              ['Usuario'],
                                          fecha: snapshot.data?[index]['Fecha'],
                                          nPersonas: snapshot.data?[index]
                                              ['CantidadPersonas'],
                                        )),
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

Container AtributoDescripcion(campo, descripcion, context) {
  return Container(
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            campo + descripcion,
            style: const TextStyle(fontSize: 15),
          ),
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
          color: DesignApp.colorSecundario,
          padding: const EdgeInsets.only(bottom: 4.0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            descripcion,
            style: TextStyle(
                fontSize: 18,
                color: DesignApp.colorPrimario,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ],
  );
}
