import 'package:flutter/material.dart';

import '../../../../../constants/fonts/font_families_names.dart';

class BackToFindDevicesScreenButton extends StatelessWidget {
  const BackToFindDevicesScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(12),
          child: Ink(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Return to find nearby devices',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: FontFamiliesNames.hostGroteskRegular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.bluetooth_searching_sharp,
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
