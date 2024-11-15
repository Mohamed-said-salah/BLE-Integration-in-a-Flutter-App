# Flutter BLE Integration App 📱
The app is designed to scan, connect, and communicate with nearby BLE devices. It showcases Flutter development skills in BLE integration, as well as UI/UX design, and follows clean architecture principles.

# Languages and frameworks 📑
 * Flutter: version 3.24.5
 * Dart
   
## Packages & Plugins 🔎
 * Flutter Blue Plus (handle ble scanning and connections)
 * Geolocator   (handle location services)
 * Flutter Bloc (for state managment)
 * Equatable 
 * Permission Handler
 * Lottie

## Features 🥇
 * BLE Device Scanning: Scans for nearby BLE devices and displays them in a list.
 * Device Connection: Allows users to select and connect to a BLE device from the list.
 * Data Exchange: Supports data exchange in JSON format with the connected BLE device.
 * Connection Handling: Manages BLE connection states (connected, disconnected, reconnecting).
 * User-Friendly Interface: Intuitive UI for easy navigation and real-time status updates.

## IDEs 💻
 * VS code
 * Android Studio

## Get the App 📱
 * Get the apk of the app from [**Drive**](https://drive.google.com/file/d/1mUKyTPygvfdWe33nLk1Q_TXUvot1iPRU/view?usp=sharing)

## Setup 💽
To get a local copy up and running, follow these instructions.

Prerequisites

 * Flutter SDK: Ensure Flutter is installed on your system. Flutter installation guide
 * Android Studio or Visual Studio Code for development and testing.
 * clone the repository and run the app on any plugged ios or android Emulator or physical device.

## Installation
   ``` bash 
      # Clone the repository
      git clone https://github.com/Mohamed-said-salah/BLE-Integration-in-a-Flutter-App.git
      cd flutter_ble_integration
   ```
   ``` bash
      # Install dependencies
      flutter pub get
   ```
   ``` bash
      # Run the application on an Android device or emulator
      flutter run
   ```

   ``` bash
      # Build the APK
      flutter build apk --release
   ```

## Project Structure
   ``` bash
      .
      └── lib/
          ├── services/
          │   └── permissions.services.dart
          ├── features/
          │   ├── services_and_permissions/
          │   │   ├── data/
          │   │   │   ├── repos
          │   │   │   └── models
          │   │   ├── views/
          │   │   │   ├── screens/
          │   │   │   │   ├── enable_bluetooth_screen.dart
          │   │   │   │   ├── enable_location_screen.dart
          │   │   │   │   ├── request_bluetooth_permissions_screen.dart
          │   │   │   │   └── request_location_permissions_screen.dart
          │   │   │   └── widgets/
          │   │   │       └── buttons/...
          │   │   └── view_models/
          │   │       ├── bluetooth/
          │   │       │   ├── bluetooth_status_cubit.dart
          │   │       │   └── bluetooth_status_state.dart
          │   │       └── location/
          │   │           ├── location_status_cubit.dart
          │   │           └── location_status_state.dart
          │   ├── scan_near_by_devices/...
          │   └── data_exchange/...
          ├── constants/...
          └── main.dart
   ```

## ScreenShots 🖼️
<div align='center'>
  <img height="460px" src="https://github.com/Mohamed-said-salah/quote-generator-mobile-app/blob/main/quote_generator_screen_shots/Home%20screen-portrait.png?raw=true">
  <img height="460px" src="https://github.com/Mohamed-said-salah/quote-generator-mobile-app/blob/main/quote_generator_screen_shots/Favorite%20screen-portrait.png?raw=true">
  <img height="460px" src="https://github.com/Mohamed-said-salah/quote-generator-mobile-app/blob/main/quote_generator_screen_shots/Favorite%20screen%20while%20using%20search-portrait.png?raw=true">
<hr/>
</div>



