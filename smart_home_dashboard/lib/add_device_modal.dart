import 'package:flutter/material.dart';
import 'main.dart'; // Import to access the Device model and types

class AddDeviceForm extends StatefulWidget {
  final Function(Device newDevice) onAddDevice;

  const AddDeviceForm({super.key, required this.onAddDevice});

  @override
  State<AddDeviceForm> createState() => _AddDeviceFormState();
}

class _AddDeviceFormState extends State<AddDeviceForm> {
  final _formKey = GlobalKey<FormState>();
  String _deviceName = '';
  String _deviceType = 'Light'; // Default value
  String _roomName = '';

  final List<String> deviceTypes = ['Light', 'Fan', 'AC', 'Camera'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Determine initial level based on type
      int initialLevel = 0;
      if (['Light', 'Fan', 'AC'].contains(_deviceType)) {
        initialLevel = 50; // Default level if controllable
      }

      final newDevice = Device(
        id: DateTime.now().millisecondsSinceEpoch.toString(), // Simple unique ID
        name: _deviceName,
        type: _deviceType,
        room: _roomName,
        isOn: false, // Default OFF as requested
        level: initialLevel,
      );

      widget.onAddDevice(newDevice);
      Navigator.of(context).pop(); // Close the dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Device', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Device Name Input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Device Name',
                  prefixIcon: Icon(Icons.label_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a device name.';
                  }
                  return null;
                },
                onSaved: (value) => _deviceName = value!,
              ),
              const SizedBox(height: 20),

              // Room Name Input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Room Name',
                  prefixIcon: Icon(Icons.meeting_room_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the room name.';
                  }
                  return null;
                },
                onSaved: (value) => _roomName = value!,
              ),
              const SizedBox(height: 20),

              // Device Type Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Device Type',
                  prefixIcon: Icon(Icons.category_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                value: _deviceType,
                items: deviceTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _deviceType = newValue!;
                  });
                },
                onSaved: (value) => _deviceType = value!,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo.shade600,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text('Add Device'),
        ),
      ],
    );
  }
}