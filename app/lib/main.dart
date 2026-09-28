import 'package:flutter/material.dart';

void main() {
  runApp(const PixaPulseApp());
}

class PixaPulseApp extends StatelessWidget {
  const PixaPulseApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PixaPulse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color currentColor = Colors.black;
  String currentEffect = 'None';
  String zone = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PixaPulse'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: currentColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Effect: $currentEffect',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Zone: $zone',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentColor = Colors.red;
                  currentEffect = 'Fade';
                });
              },
              child: const Text('Test Red Fade'),
            ),
          ],
        ),
      ),
    );
  }
}