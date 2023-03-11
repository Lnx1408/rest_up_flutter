import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getDatosUsuario() async {
  List datos = [];

  QuerySnapshot queryUsuario = await db.collection('Usuario').get();

  for (var documento in queryUsuario.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final elements = {
      "NombreUsuario": data['NombreUsuario'],
      "Email": data['Email'],
      "Password": data['Password'],
      "Imagen": data['Imagen'],
      "uid": documento.id,
    };
    datos.add(elements);
  }
  return datos;
}

Future<List> getDatoUser(String nombreUsuario) async {
  List datos = [];

  QuerySnapshot queryUsuario = await db.collection('Usuario').get();

  for (var documento in queryUsuario.docs) {
    if (documento["NombreUsuario"] == nombreUsuario) {
      final Map<String, dynamic> data =
          documento.data() as Map<String, dynamic>;
      final usuario = {
        "NombreUsuario": data['NombreUsuario'],
        "Email": data['Email'],
        "Imagen": data['Imagen'],
        "uid": documento.id,
      };
      datos.add(usuario);
      return datos;
    }
  }
  return datos;
}

Future<bool> isUser(String username, String password) async {
  List datos = await getDatosUsuario();
  bool isCorrect = false;
  for (var usuario in datos) {
    if (usuario["NombreUsuario"] == username &&
        usuario["Password"] == password) {
      return isCorrect = true;
    }
  }
  return isCorrect;
}

//guardar en base de datos
Future<void> addUsuario(
    String nombreUsuario, String email, String pass, String imagen) async {
  await db.collection("Usuario").add({
    "NombreUsuario": nombreUsuario,
    "Email": email,
    "Password": pass,
    "Imagen": imagen,
  });
}

//actualizar
Future<void> updatePassword(String uid, String pass) async {
  await db.collection("Usuario").doc(uid).set({
    "Password": pass,
  });
}
