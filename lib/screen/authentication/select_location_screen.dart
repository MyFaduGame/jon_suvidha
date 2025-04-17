import 'package:flutter/material.dart';
import 'package:job_suvidha/screen/profile/base_profile.dart';
import 'package:job_suvidha/widgets/common_scaffold.dart';

class LocationCityScreen extends StatefulWidget {
  const LocationCityScreen({super.key});

  @override
  State<LocationCityScreen> createState() => _LocationCityScreenState();
}

class _LocationCityScreenState extends State<LocationCityScreen> {
  String? selectedCity;

  final List<String> cities = [
    'Ahmedabad',
    'Bangalore',
    'Mumbai',
    'Delhi',
    'Pune',
    'Chennai',
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button & title
              Row(
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 12),
                  Text(
                    "Location",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Illustration
              Center(
                child: Image.asset(
                  'assets/images/location_illustration.png', // Replace with your asset
                  height: 200,
                ),
              ),
              const SizedBox(height: 24),

              // Prompts
              const Center(
                child: Column(
                  children: [
                    Text(
                      "Which City do you want to work in ?",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "आप किस शहर में काम करना चाहते हैं?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Dropdown
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButtonFormField<String>(
                  value: selectedCity,
                  hint: const Text("select city"),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  decoration: const InputDecoration(border: InputBorder.none),
                  items: cities.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BaseProfile(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF337AB7),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
