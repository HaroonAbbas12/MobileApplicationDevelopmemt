import 'package:flutter/material.dart';
import 'main.dart'; // Import to access the Device model

class DeviceDetailsScreen extends StatefulWidget {
  final Device device;
  final Function(String id, int level) onUpdateLevel;
  final Function(String id) onToggleStatus;

  const DeviceDetailsScreen({
    super.key,
    required this.device,
    required this.onUpdateLevel,
    required this.onToggleStatus,
  });

  @override
  State<DeviceDetailsScreen> createState() => _DeviceDetailsScreenState();
}

class _DeviceDetailsScreenState extends State<DeviceDetailsScreen> {
  late Device _device;
  late double _currentLevel;

  @override
  void initState() {
    super.initState();
    _device = widget.device;
    _currentLevel = _device.level.toDouble();
  }

  void _handleLevelChange(double newLevel) {
    setState(() {
      _currentLevel = newLevel;
    });
    // Update state in main dashboard immediately
    widget.onUpdateLevel(_device.id, newLevel.round());
  }

  void _handleToggle() {
    widget.onToggleStatus(_device.id);
    // Since the state updates in the main list, we need to refresh the local state
    setState(() {
      if (!_device.isOn) {
        _currentLevel = 0;
      } else if (_currentLevel == 0 && _device.isControllable) {
        // When turning on, set to a default level if currently 0
        _currentLevel = 50.0;
        widget.onUpdateLevel(_device.id, 50);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isControllable = _device.isControllable;
    final String controlType = _device.type == 'Light' ? 'Brightness' : 'Speed';

    return Scaffold(
      appBar: AppBar(
        title: Text(_device.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context), // Back button
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Larger Device Image/Icon
            Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 30, top: 20),
              decoration: BoxDecoration(
                color: _device.isOn ? Colors.indigo.shade50 : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                _device.icon,
                size: 100,
                color: _device.isOn ? Colors.indigo.shade600 : Colors.grey.shade400,
              ),
            ),

            // Current Status Card
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(
                  _device.isOn ? Icons.check_circle_outline : Icons.cancel_outlined,
                  color: _device.isOn ? Colors.green : Colors.red,
                  size: 32,
                ),
                title: Text(
                  'Current Status: ${_device.isOn ? 'ON' : 'OFF'}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text('Room: ${_device.room}'),
              ),
            ),

            const SizedBox(height: 20),

            // Toggle Button
            ElevatedButton(
              onPressed: _handleToggle,
              style: ElevatedButton.styleFrom(
                backgroundColor: _device.isOn ? Colors.red.shade400 : Colors.green.shade400,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 5,
              ),
              child: Text(
                _device.isOn ? 'TURN OFF' : 'TURN ON',
                style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 30),

            // Slider Control
            if (isControllable) ...[
              Text(
                '$controlType Control',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    Text(
                      '${controlType}: ${_currentLevel.round()}%',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _device.isOn ? Colors.indigo.shade600 : Colors.grey,
                      ),
                    ),
                    Slider(
                      value: _currentLevel,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: '${_currentLevel.round()}%',
                      onChanged: _device.isOn ? _handleLevelChange : null,
                      activeColor: Colors.indigo.shade600,
                      inactiveColor: _device.isOn ? Colors.indigo.shade100 : Colors.grey.shade300,
                    ),
                    Text(
                      _device.isOn ? 'Drag to adjust $controlType' : 'Turn the device ON to control $controlType',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}