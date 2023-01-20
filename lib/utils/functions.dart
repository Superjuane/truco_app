import 'dart:math';

String randomName() {
  // Create a random number generator
  final random = Random();
  List<String> list1 = ["Computadoras", "Pájaros", "Cementos", "Flores", "Cuchillos", "Lápices", "Teléfonos", "Ruedas", "Pinturas", "Guitarras", "Cámaras", "Pescados","Relojes", "Mapas", "Autos", "Fotos", "Niñas", "Números", "Papeles", "Colores", "Mesas", "Palabras", "Maderas", "Cuadros", "Botellas", "Pañuelos", "Zapatos", "Edificios", "Moscas", "Caballos", "Libros", "Ancianos"];
  List<String> list2 = ["Rápidos", "Grandes", "Pequeños", "Verdes", "Azules", "Viejos", "Nuevos", "Cortos", "Largos", "Fuerte", "Débiles", "Bonitos", "Feos", "Calientes", "Fríos", "Raros", "Comunes", "Ricos", "Pobres", "Altos", "Bajos", "Lujosos", "Desgastados", "Famosos", "Desconocidos", "Alegres", "Tristes", "Locos", "Simples", "Difíciles", "Fáciles", "Duros", "Suaves", "Dulces", "Amargos", "Dormidos", "Despiertos", "Vivos", "Muertos", "Rojos"];
  // Get a random index from each list
  int index1 = random.nextInt(list1.length);
  int index2 = random.nextInt(list2.length);

  // Get the strings at the random indexes
  String string1 = list1[index1];
  String string2 = list2[index2];

  // Concatenate the strings and return the result
  return "$string1 $string2";
}