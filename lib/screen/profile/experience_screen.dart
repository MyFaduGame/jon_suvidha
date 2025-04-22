import 'package:flutter/material.dart';
import 'package:job_suvidha/screen/profile/job_preference.dart';

class WorkExperienceScreen extends StatefulWidget {
  const WorkExperienceScreen({super.key});

  @override
  State<WorkExperienceScreen> createState() => _WorkExperienceScreenState();
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
  String? experienceOption; // "Yes" or "No"
  String? selectedExperience;
  final jobTitleController = TextEditingController();
  final companyNameController = TextEditingController();
  bool currentlyWorking = false;

  final List<String> experienceOptions = [
    "6 Months",
    "1 Year",
    "2 Years",
    "3+ Years"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF6FF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      StepIcon(
                        label: "Experience",
                        stepNumber: "2",
                        isActive: true,
                      ),
                      StepIcon(label: "Preference", stepNumber: "3"),
                      StepIcon(label: "See Jobs", icon: Icons.person),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                const Text(
                  "Get personalised job recommendations based on your work experience.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Do you have any work experience?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    radioOption("Yes"),
                    radioOption("No"),
                  ],
                ),
                const SizedBox(height: 20),
                if (experienceOption == "Yes") ...[
                  buildDropdown(
                    label: "Total years of experience",
                    value: selectedExperience,
                    items: experienceOptions,
                    onChanged: (val) =>
                        setState(() => selectedExperience = val),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Latest Job Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  buildTextField("Job Title", jobTitleController),
                  const SizedBox(height: 10),
                  buildTextField("Company Name", companyNameController),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: currentlyWorking,
                        onChanged: (val) =>
                            setState(() => currentlyWorking = val!),
                      ),
                      const Text("Currently Working Here"),
                    ],
                  ),
                ],
                const SizedBox(
                  height: 100,
                ),
                // const Spacer(),
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
                        if (experienceOption == "No") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobPreferenceScreen()),
                          );
                        } else if (experienceOption == "Yes") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobPreferenceScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please select an option.")),
                          );
                        }
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
          ],
        ),
      ),
    );
  }

  Widget radioOption(String label) {
    return Row(
      children: [
        Radio<String>(
          value: label,
          groupValue: experienceOption,
          onChanged: (val) => setState(() => experienceOption = val),
          activeColor: Colors.blue,
        ),
        Text(label),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget buildDropdown<T>({
    required String label,
    required T? value,
    required List<T> items,
    required void Function(T?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget buildButton(String label, {required VoidCallback onTap}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: label == "Next" ? Colors.blue : Colors.white,
        foregroundColor: label == "Next" ? Colors.white : Colors.blue,
        side: BorderSide(color: Colors.blue),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: onTap,
      child: Text(label),
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
