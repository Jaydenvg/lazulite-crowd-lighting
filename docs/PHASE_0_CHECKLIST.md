# Phase 0 Completion Checklist

## Design Documents

- Protocol v2 specification (20-byte BLE payload, HMAC, sequence number, shared clock)
- Firmware architecture (threading model, state machine, UART logging)
- Flutter app architecture (BLE scanning, state rendering, telemetry)
- Hardware choices (nRF52840, antenna, backhaul options)
- Build instructions (SDK setup, compilation, flashing, app install)
- Field testing plan (7 runs, decision gates, bench tests)

## Code Skeletons

- Master firmware: main.c, prj.conf, CMakeLists.txt
- Satellite firmware: main.c, prj.conf, CMakeLists.txt
- Flutter app: pubspec.yaml, main.dart, README.md
- Root CMakeLists.txt for build system

## Repository Setup

- GitHub repo: github.com/Jaydenvg/lazulite-crowd-lighting
- Folder structure: firmware/master, firmware/satellite, app, docs
- .gitignore configured for C/C++ and Flutter
- All documents and code committed

## Outstanding Blockers

- nRF Connect SDK not downloadable (network access issue, needs IT)

## Phase 0 Success Criteria

All documentation written and in repo: YES
All code skeletons committed: YES
Architecture decisions documented: YES
Testing plan ready: YES
SDK blocker identified and escalated: YES

## Next Steps (Phase 1)

1. Get nRF SDK working (IT to unblock network access)
2. Implement master firmware: USB parser, BLE broadcaster, state machine
3. Implement satellite firmware: backhaul listener, BLE re-broadcaster
4. Implement Flutter app: BLE scanning, HMAC verification, state rendering
5. Run bench tests (1-hour command stream, 3-hour effects soak)
6. Gate: single-cell system works indoors at 50m range

## Questions for Harsh and Client

1. Backhaul strategy: Ethernet PoE, WiFi mesh, or directional radio?
2. First pilot event: venue, date, expected crowd size?
3. Bluetooth SIG company ID: do we have one or need to apply?
4. SDK access: can IT unblock github.com/nrfconnect/nrf?