import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ConnectionChecker {
  Future<bool> checkConnection() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (e) {
      debugPrint("Error : $e");
      return false;
    }
  }
}
