# Field Testing Plan

## Equipment Required

6+ handsets: iPhone 14, iPhone 11, Pixel 7, Samsung A13, Xiaomi Redmi, OnePlus 9 (one Android 11)
Master node (nRF52840 + antenna)
Satellite node (nRF52840 + antenna)
nRF52840 dongle (reference receiver)
Lighting stand to reach 4m, 8m, 12m
Open field minimum 150m long
10 to 20 colleagues
240 fps phone camera for slow motion

## Test Metric

Packet Reception Rate (PRR): percentage of 1-second windows with 1 or more packets received
RSSI: signal strength per handset per distance
Latency: time from master state change to app render

## Seven Test Runs

Run 1: Extended vs Legacy Advertising
Master broadcasts legacy BLE advert (31-byte payload)
Satellite at 2m height
Handsets at 10m, 25m, 50m
Record PRR per handset
Decision gate: if legacy reaches 95%+ at 50m and extended reaches 50% or less, ship legacy

Run 2: PA Off vs On
Master PA disabled at 10m, 25m, 50m, 100m
Record RSSI at reference dongle
Master PA enabled at same distances
Compare RSSI
Decision gate: if PA on is 6 dB higher than PA off, PA is working

Run 3: Coded PHY vs Legacy
Master Coded PHY at 10m, 25m, 50m, 100m
Record PRR and RSSI
Master 1 Mbps PHY at same distances
Compare
Decision gate: if Coded reaches 20%+ more at 100m, keep as fallback

Run 4: Height 1m vs 4m vs 8m, Clear Field
No people, clear ground
Satellite at 1m: test at 10m, 25m, 50m, 100m, 150m
Satellite at 4m: same distances
Satellite at 8m: same distances
Record PRR and RSSI
Decision gate: if 8m reaches 100m+ with 95%+ PRR, proceed

Run 5: Body Loss 10 to 20 People Between TX and RX
10 people stand between satellite and handsets
Broadcast at 50m, 100m
Satellite at 1m, 4m, 8m
Repeat with 20 people
Record PRR
Decision gate: if body loss at 4m is less than 5 dB, architecture viable

Run 6: Phone Orientation and Body Shielding
Handset on tripod at 4m height, 50m distance
Same handset at ear (vertical)
Same handset in hand at side (horizontal)
Record PRR per orientation
Decision gate: document user guidance if orientation causes 5 dB loss

Run 7: Android Location Permission Gate
Android 11 with location denied
Master broadcasts
Record PRR
Same device with location granted
Compare
Decision gate: if PRR less than 50% without permission, upgrade fallback

## Bench Tests

1-hour command stream: 20 commands per second for 1 hour
Monitor: no dropped commands, no LED hangs, BLE keeps broadcasting
Expected: 72000 commands processed, zero failures

3-hour effects soak test: effects 14, 16, 17 in loop
5 handsets running simultaneously
Monitor: memory usage, frame rate, crash logs
Expected: memory stable, 60 fps maintained

## Post-Test Analysis

Plot coverage maps (RSSI by distance and height)
Generate PRR curves
Build handset compatibility matrix
Identify limiting factors
Write recommendations for Phase 3
