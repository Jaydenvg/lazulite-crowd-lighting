# Build Instructions

## Prerequisites

- Python 3.10 or later
- Git
- nRF Connect SDK (download when network access restored)
- ARM GCC toolchain
- Flutter SDK (for app)

## Install west and SDK

pip install west
cd ~
git clone https://github.com/nrfconnect/nrf.git nrf-sdk
cd nrf-sdk
python -m west update

## Build Master Firmware

cd lazulite-crowd-lighting
west build -b nrf52840dk_nrf52840 firmware/master

Output binary: build/zephyr/zephyr.elf

## Flash to Board

west flash

Requires nRF52840 DK connected via USB.

## Build Flutter App

cd lazulite-crowd-lighting/app
flutter pub get
flutter run -d android

Or for iOS:

flutter run -d ios

## Monitor Serial Output

Master firmware logs to UART at 115200 baud.

On Linux/Mac:

minicom -D /dev/ttyACM0 -b 115200

On Windows: use PuTTY or Arduino IDE Serial Monitor

## Verify Build

Master main.c compiles without errors
Flutter app builds and installs on device
Serial monitor shows "PixaPulse Master Node Starting" on boot