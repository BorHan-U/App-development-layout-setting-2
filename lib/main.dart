// Create a Grid Layout of IoT (Internet of Things) devices in a particular house.
// Keep it simple to just 4-6 devices.
// Each device will have an icon on its own.
// When you press the icon, toggle the image and toggle the text underneath between on and off.

// Modify your current app to now have tabs.
// You can implement tab by having a tabController.
// Refer to: https://flutter.dev/docs/cookbook/design/tabs
// This will give you a hint on how to implement a layout with tabs.
// The end result should look something like the image given.

import 'package:flutter/material.dart';
import 'device.dart';
import 'device_container.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Device> devices = [
    Device("Light", Icons.light, "KitchenRoom"),
    Device("Television", Icons.tv, "DrawingRoom"),
    Device("Smart Laundry", Icons.local_laundry_service, "KitchenRoom"),
    Device("Refrigerator", Icons.kitchen, "KitchenRoom"),
    Device("Voice recorder", Icons.keyboard_voice, "DrawingRoom"),
    Device("Air Condition", Icons.ac_unit, "DrawingRoom"),
  ];

  late List<Device> DrawingRoom =
      devices.where((device) => device.category == "DrawingRoom").toList();
  late List<Device> KitchenRoom =
      devices.where((device) => device.category == "KitchenRoom").toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Borhan's IoT Smart Home App"),
            bottom: const TabBar(
              tabs: [
                Tab(text: "All"),
                Tab(text: "DrawingRoom"),
                Tab(text: "KitchenRoom"),
              ],
            ),
          ),
          body: TabBarView(children: [
            //*** Tap 1 ***//
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: GridView.count(
                childAspectRatio: (140 / 100),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: devices.map((device) {
                  return DeviceContainer(device);
                }).toList(),
              ),
            ),

            //*** Tap 2 ***//
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: GridView.count(
                childAspectRatio: (140 / 100),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: DrawingRoom.map((device) {
                  return DeviceContainer(device);
                }).toList(),
              ),
            ),

            //*** Tap 3 ***//
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: GridView.count(
                childAspectRatio: (140 / 100),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: KitchenRoom.map((device) {
                  return DeviceContainer(device);
                }).toList(),
              ),
            ),
          ])),
    ));
  }
}
