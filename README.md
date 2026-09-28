# Lazulite Crowd Lighting

BLE broadcast platform for audience phones. Master node sends colour, effects, and haptics to phones via satellite relays.

## Architecture

- Master node (nRF52840) sends state over backhaul to satellites
- Satellites (nRF52840) broadcast BLE advertisements to phones
- Phones (Flutter app) listen and render locally

## Phases

- Phase 0: Design (weeks 1-2)
- Phase 1: Prototype single cell (weeks 3-8)
- Phase 2: Field test (week 9)
- Phase 3: Satellite build (weeks 10-18)
- Phase 4: Pilot event (week 19)

## Folders

- `firmware/` : nRF52840 firmware (master and satellite)
- `app/` : Flutter app (iOS and Android)
- `docs/` : Protocol specs and architecture docs