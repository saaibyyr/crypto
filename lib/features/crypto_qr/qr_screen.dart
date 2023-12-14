import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  String qrCodeData = 'https://example.com'; // Начальные данные для QR-кода

  Future<void> _scanQR() async {
    try {
      String scannedData = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Цвет сканирования
        'Отмена', // Текст для отмены сканирования
        true, // Использовать ли флэш
        ScanMode.QR, // Тип сканируемого кода
      );

      if (!mounted || scannedData.isEmpty) return;

      setState(() {
        qrCodeData = scannedData;
      });
    } catch (e) {
      print('Error while scanning QR code: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        
        title: Center(child: Text('QR Сканнер', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImageView(
              data: qrCodeData, // Данные для генерации QR-кода
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _scanQR,
              child: Text('Сканировать QR-код'),
            ),
          ],
        ),
      ),
    );
  }
}
