import 'package:flutter/material.dart';
import 'package:job_suvidha/screen/authentication/select_location_screen.dart';
import 'package:job_suvidha/widgets/common_scaffold.dart';

class LocationInitlaScreen extends StatefulWidget {
  const LocationInitlaScreen({super.key});

  @override
  State<LocationInitlaScreen> createState() => _LocationInitlaScreenState();
}

class _LocationInitlaScreenState extends State<LocationInitlaScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.arrow_back),
                    Text(
                      "Location",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 12),
                  ],
                ),
                const SizedBox(height: 40),

                // Illustration
                Image.asset(
                  'assets/images/location_illustration.png', // Replace with your image asset path
                  height: 200,
                ),
                const SizedBox(height: 40),

                // Prompt
                const Text(
                  "Which City do you want to work in ?",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                const Text(
                  "आप किस शहर में काम करना चाहते हैं?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 100),

                // Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocationCityScreen(),
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
                    "YOUR LOCATION",
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
      ),
    );
  }
}
