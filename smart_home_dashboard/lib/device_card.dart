import 'package:flutter/material.dart';
import 'main.dart'; // Import to access the Device model

class DeviceCard extends StatelessWidget {
  final Device device;
  final Function(String id) onToggle;
  final VoidCallback onTap;

  const DeviceCard({
    super.key,
    required this.device,
    required this.onToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = device.isOn ? Colors.white : Colors.indigo.shade600;
    final Color secondaryColor = device.isOn ? Colors.indigo.shade100 : Colors.grey.shade600;

    return InkWell(
      onTap: onTap, // Navigates to details screen
      // Visual feedback on tap (InkWell provides the ripple effect)
      borderRadius: BorderRadius.circular(24.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        elevation: 8,
        color: device.isOn ? Colors.indigo.shade700 : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Row for Icon and Toggle Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: device.isOn ? Colors.white.withOpacity(0.2) : Colors.indigo.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(device.icon, size: 28, color: primaryColor),
                  ),
                  // Toggle Switch
                  Switch(
                    value: device.isOn,
                    onChanged: (newValue) => onToggle(device.id),
                    activeColor: Colors.lightGreenAccent,
                    activeTrackColor: Colors.lightGreenAccent.withOpacity(0.5),
                    inactiveThumbColor: Colors.grey.shade300,
                    inactiveTrackColor: Colors.grey.shade200,
                  ),
                ],
              ),

              // Device Name and Status Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(device.name, style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: device.isOn ? Colors.white : Colors.black87,
                    overflow: TextOverflow.ellipsis,
                  )),
                  const SizedBox(height: 4),
                  Text(
                    device.isOn ? '${device.type} is ON' : '${device.type} is OFF',
                    style: TextStyle(
                      fontSize: 14,
                      color: secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (device.isControllable && device.isOn)
                    Text(
                      'Level: ${device.level}%',
                      style: TextStyle(
                        fontSize: 12,
                        color: device.isOn ? Colors.white.withOpacity(0.7) : Colors.grey.shade400,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}