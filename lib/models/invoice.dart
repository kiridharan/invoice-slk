class Invoice {
  int? id;
  String? invoiceNo;
  int? customerId;
  String? customerAddress;
  String? customerName;
  int? orderNo;
  String? invoiceDate;
  String? deliveryNote;
  String? modeOfPayment;
  String? destination;
  int? totalAmount;
  int? cgst;
  int? sgst;

  Invoice(
      {this.id,
      this.invoiceNo,
      this.orderNo,
      this.invoiceDate,
      this.customerId,
      this.customerAddress,
      this.customerName,
      this.deliveryNote,
      this.modeOfPayment,
      this.destination,
      this.totalAmount,
      this.cgst,
      this.sgst});

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceNo = json['invoice_no'];
    customerId = json['customer_id'];
    customerAddress = json['customer_address'];
    customerName = json['customer_name'];
    orderNo = json['order_no'];
    invoiceDate = json['invoice_date'];
    deliveryNote = json['delivery_note'];
    modeOfPayment = json['mode_of_payment'];
    destination = json['destination'];
    totalAmount = json['total_amount'];
    cgst = json['cgst'];
    sgst = json['sgst'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['invoice_no'] = invoiceNo;
    data['customer_id'] = customerId;
    data['customer_address'] = customerAddress;
    data['customer_name'] = customerName;
    data['order_no'] = orderNo;
    data['invoice_date'] = invoiceDate;
    data['delivery_note'] = deliveryNote;
    data['mode_of_payment'] = modeOfPayment;
    data['destination'] = destination;
    data['total_amount'] = totalAmount;
    data['cgst'] = cgst;
    data['sgst'] = sgst;
    return data;
  }
}
