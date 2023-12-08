import 'dart:developer';

import 'package:get/get.dart';
import 'package:invoice/database/databse_creation.dart';
import 'package:invoice/models/invoice.dart';

class HomeController extends GetxController {
  List<Invoice> invoiceList = [];
  List<Map<String, dynamic>> invoices = [
    {
      "id": 1,
      "invoice_no": "INV-0001",
      "customer_name": "John Doe",
      "customer_address": "123 Main Street, Anytown, CA 95001",
      "ship_to_customer_gstin": "12ABCDEFGHIJ1Z1",
      "ship_to_customer_statename": "California",
      "ship_to_customer_code": 12345,
      "bill_to_customer_name": "Jane Doe",
      "bill_to_customer_address": "456 Elm Street, Anytown, CA 95001",
      "bill_to_customer_gstin": "23BCDEFGHIJK2Z2",
      "bill_to_customer_statename": "California",
      "bill_to_customer_code": 54321,
      "order_no": 20231208001,
      "invoice_date": "2023-12-08",
      "delivery_note": "Deliver with care",
      "mode_of_payment": "Online Payment",
      "destination": "New York, NY",
      "total_amount": 10000,
      "cgst": 500,
      "sgst": 500,
    },
    {
      "id": 2,
      "invoice_no": "INV-0002",
      "customer_name": "John Doe",
      "customer_address": "123 Main Street, Anytown, CA 95001",
      "ship_to_customer_gstin": "12ABCDEFGHIJ1Z1",
      "ship_to_customer_statename": "California",
      "ship_to_customer_code": 12345,
      "bill_to_customer_name": "Jane Doe",
      "bill_to_customer_address": "456 Elm Street, Anytown, CA 95001",
      "bill_to_customer_gstin": "23BCDEFGHIJK2Z2",
      "bill_to_customer_statename": "California",
      "bill_to_customer_code": 54321,
      "order_no": 20231208001,
      "invoice_date": "2023-12-08",
      "delivery_note": "Deliver with care",
      "mode_of_payment": "Online Payment",
      "destination": "New York, NY",
      "total_amount": 10000,
      "cgst": 500,
      "sgst": 500,
    }
  ];

  @override
  void onInit() async {
    log('onInit');
    await DBHelper.instance.database;

    await loadData();
    super.onInit();
  }

  init() {
    invoiceList = [];
    log('init called');
    loadData();
  }

  deleteDB() {
    DBHelper.instance.deleteDatabases();
  }

  loadData() async {
    await DBHelper.instance.initDatabase();
    var test = await DBHelper.instance
        .getInvoiceData(); // Assuming getInvoiceData is an asynchronous method
    invoiceList = test.map((element) => Invoice.fromJson(element)).toList();
    update();
  }

  void increment() async {
    // count++;
    await DBHelper.instance.insertDummyData();
    update();
    await loadData();
  }

  void delete(int id) async {
    await DBHelper.instance.delete(id);
    update();
    await loadData();
  }
}
