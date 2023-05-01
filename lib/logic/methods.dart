
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
/*
void go_to({required context, required Widget widget}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}*/

void go_no_back({
  context,
  widget,
}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}

Future<String> QRScanner() async{
    String qrCode ;
    try{
      qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#5fa693', 
        'Return', 
        true, 
        ScanMode.QR
      );
      
    }on PlatformException{
      qrCode = 'failed'; 
    }
    return qrCode;
  }