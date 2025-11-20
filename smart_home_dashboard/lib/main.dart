import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Needed for SystemUiOverlayStyle
import 'device_card.dart';
import 'details_screen.dart';
import 'add_device_modal.dart';

// --- Device Model ---
class Device {
  final String id;
  String name;
  final String type; // 'Light', 'Fan', 'AC', 'Camera'
  String room;
  bool isOn;
  int level; // 0-100

  Device({
    required this.id,
    required this.name,
    required this.type,
    required this.room,
    this.isOn = false,
    this.level = 0,
  });

  IconData get icon {
    switch (type) {
      case 'Light':
        return Icons.lightbulb_outline;
      case 'Fan':
        return Icons.air;
      case 'AC':
        return Icons.ac_unit;
      case 'Camera':
        return Icons.videocam_outlined;
      default:
      // Fallback icon for safety, although the current logic should prevent this
        return Icons.devices_other;
    }
  }

  bool get isControllable => ['Light', 'Fan', 'AC'].contains(type);
}

// --- Main Application Widget ---
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Customizing the system UI (status bar) for a modern look
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Smart Home Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC), // Light grey background
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 1,
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.indigo),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo.shade600,
          elevation: 8,
        ),
        cardTheme: CardThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
          elevation: 6,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// --- Home Page (Dashboard) Widget ---
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Global State for all devices
  final List<Device> _devices = [
    Device(id: 'l1', name: 'Living Room Light', type: 'Light', room: 'Living Room', isOn: true, level: 75),
    Device(id: 'f1', name: 'Master Bedroom Fan', type: 'Fan', room: 'Master Bedroom', isOn: false, level: 0),
    Device(id: 'a1', name: 'Kitchen AC', type: 'AC', room: 'Kitchen', isOn: true, level: 40),
    Device(id: 'c1', name: 'Front Door Camera', type: 'Camera', room: 'Entrance', isOn: true),
    Device(id: 's1', name: 'Security Sensor', type: 'Camera', room: 'Hallway', isOn: true),
  ];

  // --- State Management Functions ---

  void _toggleDeviceStatus(String id) {
    setState(() {
      try {
        final device = _devices.firstWhere((d) => d.id == id);
        device.isOn = !device.isOn;
        // UX: If turned off, reset controllable level
        if (!device.isOn && device.isControllable) {
          device.level = 0;
        }
      } catch (e) {
        print('Error: Device with ID $id not found. $e');
      }
    });
  }

  void _updateDeviceLevel(String id, int level) {
    setState(() {
      try {
        final device = _devices.firstWhere((d) => d.id == id);
        device.level = level;
        // UX: If level changes above 0, ensure it is ON
        if (level > 0 && !device.isOn) {
          device.isOn = true;
        }
      } catch (e) {
        print('Error: Device with ID $id not found. $e');
      }
    });
  }

  void _addNewDevice(Device newDevice) {
    setState(() {
      _devices.add(newDevice);
    });
  }

  // --- Navigation and Dialog Handlers ---

  void _navigateToDetails(BuildContext context, Device device) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeviceDetailsScreen(
          device: device,
          onUpdateLevel: _updateDeviceLevel,
          onToggleStatus: _toggleDeviceStatus,
        ),
      ),
    );
    // Ensure the main dashboard rebuilds if state was changed in details screen
    setState(() {});
  }

  void _showAddDeviceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AddDeviceForm(onAddDevice: _addNewDevice),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine screen width for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 900
        ? 4 // Desktop
        : screenWidth > 600
        ? 3 // Tablet
        : 2; // Mobile

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Home Dashboard'),
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              child: const Icon(Icons.person, color: Colors.indigo),
            ),
          ),
        ],
      ),
      body: _devices.isEmpty
          ? const Center(
        child: Text(
          'No devices added yet. Tap + to add one!',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.85,
        ),
        itemCount: _devices.length,
        itemBuilder: (context, index) {
          final device = _devices[index];
          return DeviceCard(
            device: device,
            onToggle: _toggleDeviceStatus,
            onTap: () => _navigateToDetails(context, device),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDeviceDialog,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}