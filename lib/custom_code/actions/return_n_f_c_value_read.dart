// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:nfc_manager/nfc_manager.dart';
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<String?> returnNFCValueRead() async {
  try {
    bool isAvailable = await NfcManager.instance.isAvailable();
    var _taggy;
    //We first check if NFC is available on the device.
    if (isAvailable) {
      //If NFC is available, start an NFC session and listen for NFC tags to be discovered.

      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          // Process NFC tag, When an NFC tag is discovered, print its data to the container .
          //var tagData = 'NFC Tag Detected: ${tag.data}';
          _taggy = '${tag.data}';
          //return await '${tag.data}';
        },
      );
      return await _taggy;
    } else {
      return await 'NFC not available.';
    }
  } catch (e) {
    return await 'Error reading NFC: $e';
  }
}
