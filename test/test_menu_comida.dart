import 'package:flutter_test/flutter_test.dart';
import 'package:rest_up_flutter/services/services_menu_comida.dart';

void main() {
  test('ObtenerDatosMenuComida', () async {
    final List<dynamic> datos = await getDatosMenuComida();

    expect(datos, isEmpty);
  });

  test("InsertarMenuComida", () async {
    final String result = await addMenuComida("Sushi", 'Deliciosa comida japonesa', "24.5", "http://www.haushaltstipps.net/wp-content/uploads/sushi.jpg");

    expect(result, "Error, no se realizó el registro");
  });

  test("ModificarMenuComida", () async {
    final String result = await updateMenuComida("123","Sushi",'Deliciosa comida japonesa', "24.5", "http://www.haushaltstipps.net/wp-content/uploads/sushi.jpg");

    expect(result, "Error, no se pudo modicar el registro");
  });

  test("EliminarMenuComida", () async {
    final String result = await deleteMenuComida("123");

    expect(result, "Error, no se pudo eliminar el registro");
  });
}
