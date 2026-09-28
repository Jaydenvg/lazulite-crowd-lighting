# PixaPulse Flutter App

iOS and Android app for audience phones. Listens to BLE broadcasts from master/satellites.

## Features

- Zone selection (0-15 or follow nearest)
- Real-time colour and effect rendering
- Haptic feedback
- Coverage telemetry (optional)
- HMAC-SHA256 packet verification

## Structure

- lib/main.dart: entry point
- lib/ble_scanner.dart: BLE scanning and packet decode
- lib/state_renderer.dart: colour and effect rendering
- lib/telemetry.dart: coverage monitoring and reporting

## Build

flutter pub get
flutter run

## Testing

6+ handsets: iPhone 14, iPhone 11, Pixel 7, Samsung A13, Xiaomi Redmi, OnePlus 9