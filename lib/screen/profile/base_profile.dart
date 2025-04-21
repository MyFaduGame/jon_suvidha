import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_suvidha/screen/profile/education_screen.dart';
import 'package:job_suvidha/widgets/common_scaffold.dart';

class BaseProfile extends StatefulWidget {
  const BaseProfile({super.key});

  @override
  State<BaseProfile> createState() => _BaseProfileState();
}

class _BaseProfileState extends State<BaseProfile> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();

  String? gender;
  File? _profileImage;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back and Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      weight: 5,
                      size: 25,
                    ),
                  ),
                  const Text(
                    "Profile",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
              const SizedBox(height: 20),

              // Card Header
              Container(
                width: double.infinity,
                height: 100,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                    color: const Color(0xFFF4F5F9),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Let ‘s build your resume !",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Enter Your Details so that employers can find you easily for a job.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Profile Image
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : null,
                      backgroundColor: Colors.grey.shade300,
                      child: _profileImage == null
                          ? const Icon(Icons.person,
                              size: 40, color: Colors.white)
                          : null,
                    ),
                    TextButton.icon(
                      onPressed: pickImage,
                      icon: const Icon(Icons.camera_alt, color: Colors.blue),
                      label: const Text(
                        "Add Photo",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Full Name
              const Text("Full Name"),
              const SizedBox(height: 6),
              TextField(
                controller: fullNameController,
                decoration: buildInputDecoration("Enter your name"),
              ),
              const SizedBox(height: 14),

              // Email
              const Text("Email (Optional)"),
              const SizedBox(height: 6),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: buildInputDecoration("example@gmail.com"),
              ),
              const SizedBox(height: 14),

              // Age
              const Text("Age"),
              const SizedBox(height: 6),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: buildInputDecoration("Your age"),
              ),
              const SizedBox(height: 16),

              // Gender
              const Text("Gender"),
              const SizedBox(height: 8),
              Row(
                children: [
                  buildGenderOption("Male"),
                  const SizedBox(width: 20),
                  buildGenderOption("Female"),
                ],
              ),
              const SizedBox(height: 20),

              // Subtitle
              const Center(
                child: Text(
                  "Build your profile and see jobs in 3 minutes",
                  style: TextStyle(
                      color: Color(0xFF327FB3), fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 25),

              // NEXT button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EducationDetailsScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E6DB7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "NEXT",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGenderOption(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: gender,
          activeColor: Colors.blue,
          onChanged: (val) {
            setState(() {
              gender = val;
            });
          },
        ),
        Text(value),
      ],
    );
  }

  InputDecoration buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
