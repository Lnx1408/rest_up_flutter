import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getDatosReserva(String usuario) async {
  List datos = [];

  QuerySnapshot queryReserva = await db.collection('Reserva').get();

  for (var documento in queryReserva.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    if (data['Usuario'] == usuario) {
      final elements = {
        "Usuario": data['Usuario'],
        "Fecha": data['Fecha'],
        "CantidadPersonas": data['CantidadPersonas'],
        "Precio": data['Precio'],
        "uid": documento.id,
      };
      datos.add(elements);
    }
  }
  return datos;
}

//guardar en base de datos
Future<void> addReserva(
    String usuario, String fecha, String nPersonas, String precio) async {
  await db.collection("Reserva").add({
    "Usuario": usuario,
    "Fecha": fecha,
    "CantidadPersonas": nPersonas,
    "Precio": precio,
  });
}

//actualizar
Future<void> updateReserva(
    String uid, String fecha, String nPersonas, String precio) async {
  await db.collection("Reserva").doc(uid).set({
    "Fecha": fecha,
    "CantidadPersonas": nPersonas,
    "Precio": precio,
  });
}

//eliminar desde firebase
Future<void> deleteReserva(String id) async {
  await db.collection("Reserva").doc(id).delete();
}
