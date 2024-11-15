import 'package:ble_integration_in_flutter_app/services/permissions.services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../constants/fonts/font_families_names.dart';

class EnableLocationButton extends StatelessWidget {
  const EnableLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        child: InkWell(
          onTap: () async {
            final locatoinPermissionStatus =
                await PermissionsServices.requestLocation();

            if (locatoinPermissionStatus == PermissionStatus.granted) {
              Geolocator.openLocationSettings();
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Ink(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 78, 177, 223),
                  Color.fromARGB(255, 102, 158, 221),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enable Location',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: FontFamiliesNames.hostGroteskRegular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.location_on_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
