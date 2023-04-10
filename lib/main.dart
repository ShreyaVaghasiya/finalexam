import 'dart:io';

import 'package:finalexam/Utils/AppUtil.dart';
import 'package:finalexam/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Future<void> copyDatabase() async {
  // Get the directory for storing the database file
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'stock.db');

  // Check if the database file already exists
  bool fileExists = await databaseExists(path);

  if (!fileExists) {
    // If the file doesn't exist, copy it from the assets folder
    ByteData data = await rootBundle.load(join('assets/Database/stock.db'));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await copyDatabase();
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'stock.db');
  Database database = await openDatabase(path);

  AppUtil.stockList = await database.rawQuery('SELECT * FROM stockTable');

  for (var row in AppUtil.stockList) {
    // print(row);
    print(AppUtil.stockList);
  }
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => HomePage(),
    },
  ));
}
