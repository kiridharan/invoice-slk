import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;
  static final DBHelper instance = DBHelper._();

  DBHelper._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'invoice.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Invoice (
            id INTEGER PRIMARY KEY,
            invoice_no TEXT,
            customer_id INTEGER,
            customer_address TEXT,
            customer_name TEXT,
            order_no INTEGER,
            invoice_date TEXT,
            delivery_note TEXT,
            mode_of_payment TEXT,
            destination TEXT,
            total_amount INTEGER,
            cgst INTEGER,
            sgst INTEGER,
            FOREIGN KEY (customer_id) REFERENCES Customer (id)
          )
        ''');

        await db.execute('''
        CREATE TABLE Customer (
          id INTEGER PRIMARY KEY,
          name TEXT,
          address TEXT,
          gstin TEXT,
          statename TEXT,
          code INTEGER
        )
      ''');

        await db.execute('''
          CREATE TABLE Goods (
            id INTEGER PRIMARY KEY,
            pkg INTEGER,
            description TEXT,
            hsn_sac INTEGER,
            qty INTEGER,
            per TEXT,
            amount TEXT,
            invoice_id INTEGER,
            FOREIGN KEY (invoice_id) REFERENCES Invoice (id)
          )
        ''');

        await db.execute('''
          CREATE TABLE CompanyMaster (
            name TEXT PRIMARY KEY,
            owner TEXT,
            address TEXT,
            gstin TEXT,
            statename TEXT,
            code INTEGER,
            bank_name TEXT,
            ac_no TEXT,
            branch TEXT,
            ifsc TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertDummyData() async {
    final db = await database;

    // Insert dummy data into the Invoice table
    try {
      int invoiceId = await db.insert('Invoice', {
        'invoice_no': 'INV001',
        'customer_id': 1,
        'customer_address': '123 Main Street, Anytown, CA 95001',
        'customer_name': 'John Doe',
        'invoice_date': '2023-12-08',
        'delivery_note': 'Deliver with care',
        'order_no': 123,
        'total_amount': 1000,
        'cgst': 50,
        'sgst': 50,
      });

      // Insert dummy data into the Goods table
      await db.insert('Goods', {
        'pkg': 1,
        'description': 'Product A',
        'hsn_sac': 123456,
        'qty': 5,
        'per': 'Unit',
        'amount': '200',
        'invoice_id': invoiceId,
      });

      await db.insert('Goods', {
        'pkg': 2,
        'description': 'Product B',
        'hsn_sac': 789012,
        'qty': 10,
        'per': 'Unit',
        'amount': '300',
        'invoice_id': invoiceId,
      });
    } on Exception catch (e) {
      log(e.toString());
    }

    // Insert dummy data into the Customer table
    log("done");
  }

  Future<List<Map<String, dynamic>>> getInvoiceData() async {
    final db = await database;
    return db.query('Invoice');
  }

  //delete data
  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete('Invoice', where: 'id = ?', whereArgs: [id]);
  }

  // delete database
  Future<void> deleteDatabases() async {
    try {
      final path = join(await getDatabasesPath(), 'invoice.db');
      await deleteDatabase(path);
      log("message");
    } on Exception catch (e) {
      print(e);
    }
  }
}
