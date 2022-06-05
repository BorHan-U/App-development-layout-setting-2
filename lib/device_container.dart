import 'package:flutter/material.dart';
import 'device.dart';

class DeviceContainer extends StatefulWidget {
  late Device device;

  //constructor
  DeviceContainer(Device device) {
    this.device = device;
  }

  @override
  State<DeviceContainer> createState() => _DeviceContainerState();
}

class _DeviceContainerState extends State<DeviceContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                widget.device.power[0]
                    ? Icon(
                        widget.device.icon,
                        color: Colors.blue,
                        size: 40,
                      )
                    : Icon(
                        widget.device.icon,
                        color: Colors.grey,
                        size: 40,
                      ),
                ToggleButtons(
                  children: const <Widget>[
                    Icon(Icons.power_settings_new),
                  ],
                  isSelected: widget.device.power,
                  color: Colors.grey,
                  selectedColor: Colors.green,
                  fillColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  selectedBorderColor: Colors.green,
                  onPressed: (int index) {
                    setState(() {
                      widget.device.power[index] = !widget.device.power[index];
                    });
                  },
                ),
              ]),
          SizedBox(
            height: 10,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "${widget.device.name}",
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: widget.device.power[0]
                      ? const Text(
                          "On",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.green),
                        )
                      : const Text(
                          "Off",
                          textAlign: TextAlign.left,
                        ),
                ),
              ]),
        ],
      ),
    );
  }
}
