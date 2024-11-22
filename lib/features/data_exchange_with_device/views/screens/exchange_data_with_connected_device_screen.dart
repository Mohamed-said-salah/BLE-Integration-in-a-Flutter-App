import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

/// This page is used to exchange data with a connected device
/// It discovers the services provided by the device and sets up
/// the characteristics to send and receive data

class ExchangeDataWithConnectedDeviceScreen extends StatefulWidget {
  final BluetoothDevice device;

  const ExchangeDataWithConnectedDeviceScreen({
    super.key,
    required this.device,
  });

  @override
  State<ExchangeDataWithConnectedDeviceScreen> createState() =>
      _ExchangeDataWithConnectedDeviceScreenState();
}

/// State for [ExchangeDataWithConnectedDeviceScreen]
class _ExchangeDataWithConnectedDeviceScreenState
    extends State<ExchangeDataWithConnectedDeviceScreen> {
  BluetoothCharacteristic? targetWriteCharacteristic;
  BluetoothCharacteristic? targetNotifyCharacteristic;
  String statusMessage = "Waiting to connect...";
  String responseMessage = "No response received yet.";
  List<BluetoothService> availableServices = []; // List of discovered services

  @override
  void initState() {
    super.initState();
    _discoverServicesAndSetupCharacteristics();
  }

  /// Discover services and locate the writable and notifiable characteristics
  Future<void> _discoverServicesAndSetupCharacteristics() async {
    setState(() {
      statusMessage = "Discovering services...";
    });

    try {
      List<BluetoothService> services = await widget.device.discoverServices();
      setState(() {
        availableServices = services; // Save services to display them
      });

      for (var service in services) {
        for (var characteristic in service.characteristics) {
          // Identify writable characteristic
          if (characteristic.properties.write) {
            targetWriteCharacteristic = characteristic;
            print("Writable characteristic found: ${characteristic.uuid}");
          }
          // Identify notifiable characteristic
          if (characteristic.properties.notify) {
            targetNotifyCharacteristic = characteristic;
            await characteristic.setNotifyValue(true);
            characteristic.value.listen((value) {
              _handleResponse(value);
            });
            print("Notifiable characteristic found: ${characteristic.uuid}");
          }
        }
      }

      if (targetWriteCharacteristic != null) {
        setState(() {
          statusMessage = "Device ready for communication.";
        });
      } else {
        setState(() {
          statusMessage = "No writable characteristic found.";
        });
      }
    } catch (e) {
      setState(() {
        statusMessage = "Error discovering services: $e";
      });
    }
  }

  /// Handle incoming response from the device
  void _handleResponse(List<int> value) {
    String response = utf8.decode(value);
    setState(() {
      responseMessage = "Device response: $response";
    });
    print("Received response: $response");
  }

  /// Read the data from a given characteristic and show it in a dialog
  Future<void> _readCharacteristic(
      BluetoothCharacteristic characteristic) async {
    try {
      List<int> value = await characteristic.read();
      String decodedValue = utf8.decode(value);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Characteristic Data'),
            content: Text('Read Value: $decodedValue'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to read characteristic: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  /// Send JSON command to the writable characteristic
  Future<void> _sendJsonCommand(Map<String, dynamic> command) async {
    if (targetWriteCharacteristic == null) {
      setState(() {
        statusMessage = "Characteristic not found or not writable.";
      });
      return;
    }

    try {
      String jsonString = jsonEncode(command);
      List<int> bytes = utf8.encode(jsonString);
      const int chunkSize = 20; // Common maximum size for BLE payload

      // Split the data into chunks and send sequentially
      for (int i = 0; i < bytes.length; i += chunkSize) {
        List<int> chunk = bytes.sublist(
          i,
          i + chunkSize > bytes.length ? bytes.length : i + chunkSize,
        );

        await targetWriteCharacteristic!.write(chunk, withoutResponse: false);
        print("Chunk sent: $chunk");
      }

      setState(() {
        statusMessage = "Command sent successfully: $jsonString";
      });
    } catch (e) {
      setState(() {
        statusMessage = "Error sending command: $e";
      });
    }
  }

  /// Get the string representation of the characteristic properties
  String _getProperties(BluetoothCharacteristic characteristic) {
    final props = <String>[];
    if (characteristic.properties.read) props.add('Read');
    if (characteristic.properties.write) props.add('Write');
    if (characteristic.properties.notify) props.add('Notify');
    return props.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exchange Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display status message
            Text(
              statusMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Display response from the device
            Text(
              responseMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Send JSON button
            ElevatedButton(
              onPressed: () async {
                final jsonData = {"command": "start", "value": 42};
                await _sendJsonCommand(jsonData);
              },
              child: const Text('Send JSON to Device'),
            ),
            const SizedBox(height: 16),
            // List of available services
            Expanded(
              child: ListView.builder(
                itemCount: availableServices.length,
                itemBuilder: (context, index) {
                  final service = availableServices[index];
                  return ExpansionTile(
                    title: Text('Service: ${service.uuid}'),
                    children: service.characteristics.map((characteristic) {
                      return ListTile(
                        title: Text('Characteristic: ${characteristic.uuid}'),
                        subtitle: Text(
                          'Properties: ${_getProperties(characteristic)}',
                        ),
                        onTap: () {
                          if (characteristic.properties.read) {
                            _readCharacteristic(characteristic);
                          }
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}




/// Last Commit was about adding dialog that appears with showing details from read characteristic of any service like 180