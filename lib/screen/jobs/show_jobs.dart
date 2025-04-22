import 'package:flutter/material.dart';
import 'package:job_suvidha/screen/home/home_screen.dart';

class JobInfoScreen extends StatefulWidget {
  const JobInfoScreen({super.key});

  @override
  State<JobInfoScreen> createState() => _JobInfoScreenState();
}

class _JobInfoScreenState extends State<JobInfoScreen> {
  String selectedProficiency = 'Thoda English';
  String? selectedCity;

  final List<String> cities = [
    'Mumbai (25 jobs)',
    'Delhi (5 jobs)',
    'Pune (10 jobs)',
    'Indore (10 jobs)',
    'Rajkot (10 jobs)',
    'Nashik (10 jobs)',
    'Patna (10 jobs)',
    'Bhopal (10 jobs)',
  ];

  List<String> proficiencyOptions = [
    'No English',
    'Thoda English',
    'Good English',
    'Fluent English'
  ];

  Widget _buildTextField(String hintText, String titleText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadSection() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.picture_as_pdf, size: 32, color: Colors.red),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Upload Your Resume",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Upload PDF or Docx", style: TextStyle(fontSize: 12)),
                ],
              )
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              OutlinedButton.icon(
                icon: Icon(Icons.schedule),
                label: Text("Upload Later"),
                onPressed: () {},
              ),
              SizedBox(width: 12),
              ElevatedButton.icon(
                icon: Icon(Icons.file_upload),
                label: Text("Upload"),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF6FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              color: const Color(0xFF327FB3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      StepIcon(label: "Education", stepNumber: "1"),
                      StepIcon(label: "Experience", stepNumber: "2"),
                      StepIcon(label: "Preference", stepNumber: "3"),
                      StepIcon(
                        label: "See Jobs",
                        icon: Icons.person,
                        isActive: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Additional info like language preferences, resume, etc. helps us to filter relevant jobs for you.",
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  SizedBox(height: 25),
                  Text("English Proficiency",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: proficiencyOptions.map((option) {
                        final selected = selectedProficiency == option;
                        return ChoiceChip(
                          label: Text(option),
                          selected: selected,
                          onSelected: (_) =>
                              setState(() => selectedProficiency = option),
                          labelStyle: TextStyle(
                              color: selected ? Colors.blue : Colors.black87,
                              fontWeight: FontWeight.bold),
                          selectedColor: Colors.transparent,
                          backgroundColor: Colors.white,
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Prefered Location",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCity,
                        hint: Text("Select a city"),
                        isExpanded: true,
                        items: cities.map((city) {
                          return DropdownMenuItem(
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
                  ),
                  SizedBox(height: 16),
                  _buildTextField("Example, Aadhar", "Assets"),
                  SizedBox(height: 16),
                  _buildTextField("English,Hindi,Gujarati", "Languages Knows"),
                  SizedBox(height: 16),
                  Text("Resume (Optional)",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Resume increases chances of hiring by 3x",
                      style: TextStyle(color: Colors.green, fontSize: 12)),
                  SizedBox(height: 10),
                  _buildUploadSection(),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF327FB3)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Back",
                          style: TextStyle(
                            color: Color(0xFF327FB3),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF327FB3),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "See Jobs",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepIcon extends StatelessWidget {
  final String label;
  final String? stepNumber;
  final IconData? icon;
  final bool isActive;

  const StepIcon({
    super.key,
    required this.label,
    this.stepNumber,
    this.icon,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: isActive ? Colors.white : Colors.white54,
          child: icon != null
              ? Icon(icon, size: 16, color: const Color(0xFF1E6DB7))
              : Text(
                  stepNumber ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF1E6DB7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.white),
        )
      ],
    );
  }
}
