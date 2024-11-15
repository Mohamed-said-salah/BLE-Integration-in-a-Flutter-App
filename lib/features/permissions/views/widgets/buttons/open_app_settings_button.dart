import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

import '../../../../../constants/fonts/font_families_names.dart';

class OpenAppSettingsButton extends StatefulWidget {
  const OpenAppSettingsButton({super.key});

  @override
  State<OpenAppSettingsButton> createState() => _OpenAppSettingsButtonState();
}

class _OpenAppSettingsButtonState extends State<OpenAppSettingsButton> {
  bool _isOpenning = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        child: InkWell(
          onTap: () async {
            if (!_isOpenning) {
              setState(() {
                _isOpenning = true;
              });
              await openAppSettings();
              Navigator.pop(context);
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
                    'Open App Settings',
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
                    Icons.settings,
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
