import 'package:flutter/material.dart';

//Local Imports
import 'package:job_suvidha/screen/profile/experience_screen.dart';

class EducationDetailsScreen extends StatefulWidget {
  const EducationDetailsScreen({super.key});

  @override
  State<EducationDetailsScreen> createState() => _EducationDetailsScreenState();
}

class _EducationDetailsScreenState extends State<EducationDetailsScreen> {
  String? selectedQualification;
  String? selectedDegree;
  String? selectedBranch;
  String? selectedCollege;

  final TextEditingController degreeController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  final List<String> qualifications = [
    "Less Than Tenth",
    "Tenth",
    "Twelth and Above",
    "Graduate and Above"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF6FF),
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
                      StepIcon(
                          label: "Education", stepNumber: "1", isActive: true),
                      StepIcon(label: "Experience", stepNumber: "2"),
                      StepIcon(label: "Preference", stepNumber: "3"),
                      StepIcon(label: "See Jobs", icon: Icons.person),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Providing your education details can give employers a better understanding of your strengths as a candidate.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 25),

            const Text(
              "What's your highest qualification ?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF327FB3),
              ),
            ),
            const SizedBox(height: 20),

            // Qualification Buttons
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.6,
              children: qualifications.map((q) {
                final isSelected = selectedQualification == q;
                return OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedQualification = q;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor:
                        isSelected ? Colors.blue.shade50 : Colors.white,
                    side: BorderSide(
                      color: isSelected ? Colors.blue : Colors.grey.shade400,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    q,
                    style: TextStyle(
                      color: isSelected ? Colors.blue : Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            if (selectedQualification == "Graduate and Above") ...[
              buildDropdown<String>(
                label: "Degree",
                value: selectedDegree,
                items: [
                  "B.Com",
                  "B.Sc",
                  "B.A",
                  "BBA",
                  "B.Tech",
                  "M.Com",
                  "M.Sc",
                  "MBA"
                ],
                onChanged: (val) => setState(() => selectedDegree = val),
              ),
              buildDropdown<String>(
                label: "Branch / Field of Study",
                value: selectedBranch,
                items: [
                  "Commerce",
                  "Science",
                  "Arts",
                  "Engineering",
                  "Management"
                ],
                onChanged: (val) => setState(() => selectedBranch = val),
              ),
              buildDropdown<String>(
                label: "College Name",
                value: selectedCollege,
                items: [
                  "Delhi University",
                  "Mumbai University",
                  "IIT Bombay",
                  "IIM Ahmedabad",
                  "Other"
                ],
                onChanged: (val) => setState(() => selectedCollege = val),
              ),
              buildTextField("Passing Year", yearController,
                  keyboardType: TextInputType.number),
            ] else ...[
              const SizedBox(height: 150), // Empty space
            ],

            const SizedBox(height: 25),

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
                        builder: (context) => WorkExperienceScreen(),
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
                    "Next",
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
    );
  }

  Widget buildDropdown<T>({
    required String label,
    required T? value,
    required List<T> items,
    required void Function(T?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: value,
            isExpanded: true,
            hint: Text("Select $label"),
            items: items
                .map((item) => DropdownMenuItem<T>(
                      value: item,
                      child: Text(item.toString()),
                    ))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {String? hint, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
