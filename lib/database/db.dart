import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database? _database;
Future<Database> get database async {
  if (_database != null) return _database!;
  // Initialize the DB first time it is accessed
  _database = await dataBase();
  return _database!;
}

Future<Database> dataBase() async {
  return await openDatabase(
    // Establecer la ruta a la base de datos. Nota: Usando la función `join` del
    // complemento `path` es la mejor práctica para asegurar que la ruta sea correctamente
    // construida para cada plataforma.
    join(await getDatabasesPath(), 'scholarship_database.db'),
    // Cuando la base de datos se crea por primera vez, crea una tabla para almacenar los elementos
    /*onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE scholarships(id INTEGER PRIMARY KEY, bd TEXT, titulo TEXT, cierre TEXT, requisitos TEXT, categorias TEXT, enlace TEXT, imagen TEXT, date TEXT)",
      );
    },*/
    // Establece la versión. Esto ejecuta la función onCreate y proporciona una
    // ruta para realizar actualizacones y defradaciones en la base de datos.
    version: 2,
    onUpgrade: (db, int oldVersion, int newVersion) {
      return db.execute('ALTER TABLE scholarships ADD date TEXT');
    },
  );
}

Future<void> insert(dynamic element) async {
  // Obtiene una referencia de la base de datos
  final Database db = await database;
  Map<String, Object?> temp = Map.from(element);
  temp['bd'] = 'T';
  temp['date'] = DateTime.now().toString();
  // Inserta el elemento en la tabla correcta. También puede especificar el
  // `conflictAlgorithm` para usar en caso de que el mismo elemento se inserte dos veces.
  // En este caso, reemplaza cualquier dato anterior.
  await db.insert(
    'scholarships',
    temp,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Map<String, dynamic>>> getElements() async {
  // Obtiene una referencia de la base de datos
  final Database db = await database;

  // Consulta la tabla por todos los elementos.
  final List<Map<String, dynamic>> maps = await db.query('scholarships');

  // Convierte List<Map<String, dynamic> en List<Dog>.
  return maps;
}

Future<void> updateDog(Dog dog) async {
  // Obtiene una referencia de la base de datos
  final Database db = await database;

  // Actualiza el Dog dado
  await db.update(
    'dogs',
    dog.toMap(),
    // Aseguúrate de que solo actualizarás el Dog con el id coincidente
    where: "id = ?",
    // Pasa el id Dog a través de whereArg para prevenir SQL injection
    whereArgs: [dog.id],
  );
}

Future<void> delete(dynamic element) async {
  // Obtiene una referencia de la base de datos
  final Database db = await database;

  // Elimina el Dog de la base de datos
  await db.delete(
    'scholarships',
    // Utiliza la cláusula `where` para eliminar un elemento específico
    where: "id = ?",
    // Pasa el id Dog a través de whereArg para prevenir SQL injection
    whereArgs: [element['id']],
  );
}

/*var fido = Dog(
    id: 0,
    name: 'Fido',
    age: 35,
  );*/

// Inserta un dog en la base de datos
//await insertDog(fido);

// Imprime la lista de dogs (solamente Fido por ahora)
//print(await dogs());

// Actualiza la edad de Fido y lo guarda en la base de datos
/*final fido2 = Dog(
    id: fido.id,
    name: fido.name,
    age: fido.age + 7,
  );*/
//await updateDog(fido2);

// Imprime la información de Fido actualizada
//print(await dogs());

// Elimina a Fido de la base de datos
// await deleteDog(fido);

// Imprime la lista de dos (vacía)
//print(await dogs());

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({required this.id, required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Implementa toString para que sea más fácil ver información sobre cada perro
  // usando la declaración de impresión.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
