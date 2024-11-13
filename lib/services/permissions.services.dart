import 'package:permission_handler/permission_handler.dart';

enum PermissionStatus {
  granted,
  denied,
  permanentlyDenied,
}

abstract class PermissionsServices {
  /// -- request bluetooth permissions
  static Future<PermissionStatus> requestBluetooth() async {
    // 1. bluetooth
    // request bluetooth permissions if not granted
    if (!await Permission.bluetooth.isGranted) {
      // request the permission
      final status = await Permission.bluetooth.request();

      // return denied or permanently denied if not granted
      if (status.isDenied) {
        return PermissionStatus.denied;
      } else if (status.isPermanentlyDenied) {
        return PermissionStatus.permanentlyDenied;
      }
    }

    // 2. bluetooth scan
    // request bluetooth scan permissions if not granted
    if (!await Permission.bluetoothScan.isGranted) {
      // request the permission
      final status = await Permission.bluetoothScan.request();

      // return denied or permanently denied if not granted
      if (status.isDenied) {
        return PermissionStatus.denied;
      } else if (status.isPermanentlyDenied) {
        return PermissionStatus.permanentlyDenied;
      }
    }

    // 3. bluetooth connect
    // request bluetooth connect permissions if not granted
    if (!await Permission.bluetoothConnect.isGranted) {
      // request the permission
      final status = await Permission.bluetoothConnect.request();

      // return denied or permanently denied if not granted
      if (status.isDenied) {
        return PermissionStatus.denied;
      } else if (status.isPermanentlyDenied) {
        return PermissionStatus.permanentlyDenied;
      }
    }

    return PermissionStatus.granted;
  }

  //
  /// -- request bluetooth permissions
  static Future<PermissionStatus> requestLocation() async {
    // request location permissions if not granted
    if (!await Permission.location.isGranted) {
      // request the permission
      final status = await Permission.location.request();

      // return denied or permanently denied if not granted
      if (status.isDenied) {
        return PermissionStatus.denied;
      } else if (status.isPermanentlyDenied) {
        return PermissionStatus.permanentlyDenied;
      }
    }

    return PermissionStatus.granted;
  }
}
