import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart' show QRCodeReader;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leitor de QR Code',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Leitor de QR Code'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _captureQR() {
    Future<String> result = QRCodeReader().scan();
    result.then((qrtext) => _showDialog(qrtext));
  }

  void _showDialog(String qrtext) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Texto do QR Code"),
            content: new Text(qrtext),
            actions: [
              new TextButton(
                child: new Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Ler QR Code'),
              onPressed: () => _captureQR(),
            )
          ],
        ),
      ),
    );
  }
}
