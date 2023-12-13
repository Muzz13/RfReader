// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'package:nfc_manager/nfc_manager.dart';

class NFCReadWidget extends StatefulWidget {
  const NFCReadWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  _NFCReadWidgetState createState() => _NFCReadWidgetState();
  final double? width;
  final double? height;
}

class _NFCReadWidgetState extends State<NFCReadWidget> {
  var _taggy;

  @override
  void initState() {
    super.initState();
    initializeNFC();
  }

  Future<void> initializeNFC() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      // We first check if NFC is available on the device.
      if (isAvailable) {
        // If NFC is available, start an NFC session and listen for NFC tags to be discovered.
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            // Process NFC tag, When an NFC tag is discovered, update the state with the tag's data.
            setState(() {
              _taggy = '${tag.data}';
            });
          },
        );
      } else {
        // Handle the case when NFC is not available.
        setState(() {
          _taggy = 'NFC not available.';
        });
      }
    } catch (e) {
      // Handle errors when reading NFC.
      setState(() {
        _taggy = 'Error reading NFC: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFC Reader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'NFC Tag Data:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _taggy ?? 'Waiting for NFC tag...',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
