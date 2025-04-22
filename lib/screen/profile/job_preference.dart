import 'package:flutter/material.dart';
import 'package:job_suvidha/screen/jobs/show_jobs.dart';

class JobPreferenceScreen extends StatefulWidget {
  const JobPreferenceScreen({super.key});

  @override
  State<JobPreferenceScreen> createState() => _JobPreferenceScreenState();
}

class _JobPreferenceScreenState extends State<JobPreferenceScreen> {
  String searchQuery = "";
  Map<String, bool> selectedPreferences = {};

  final List<Map<String, String>> jobBasedOnExperience = [
    {
      "title": "Office / Admin / Computer Operator",
      "desc": "Administrative and office support roles"
    },
    {
      "title": "Customer Support",
      "desc":
          "Calling customers/informing them about products/services, resolving calls"
    },
    {
      "title": "Sales & Business Development",
      "desc": "Sales, business development and customer support roles"
    },
  ];

  final List<Map<String, String>> allDepartments = [
    {
      "title": "Teaching & Training",
      "desc": "It seems like you're interested in teaching and training"
    },
    {
      "title": "Design, Editing & Architecture",
      "desc":
          "It seems like you're interested in design, editing and architecture"
    },
    {
      "title": "Software Engineering",
      "desc": "Web dev, mobile apps, enterprise software, etc."
    },
    {
      "title": "Customer Support",
      "desc":
          "Calling customers/informing them about products/services, resolving calls"
    },
    {
      "title": "Sales & Business Development",
      "desc": "Sales, business development and customer support roles"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF6FF),
      body: Column(
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
                    StepIcon(
                      label: "Preference",
                      stepNumber: "3",
                      isActive: true,
                    ),
                    StepIcon(label: "See Jobs", icon: Icons.person),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Select preferred department / area of work",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  buildSearchBar(),
                  const SizedBox(height: 20),
                  buildSection("Your Job preference based on experience"),
                  ...jobBasedOnExperience
                      .where((job) => job["title"]!
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()))
                      .map(buildJobOption),
                  const SizedBox(height: 20),
                  buildSection("All Departments"),
                  ...allDepartments
                      .where((job) => job["title"]!
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()))
                      .map(buildJobOption),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                        builder: (context) => JobInfoScreen(),
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
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search Job Title",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onChanged: (value) {
        setState(() {
          searchQuery = value;
        });
      },
    );
  }

  Widget buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildJobOption(Map<String, String> job) {
    final title = job["title"]!;
    final desc = job["desc"]!;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(Icons.work, color: Colors.blue),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(desc),
      trailing: Checkbox(
        value: selectedPreferences[title] ?? false,
        onChanged: (val) {
          setState(() {
            selectedPreferences[title] = val ?? false;
          });
        },
      ),
    );
  }

  Widget buildButton(
      String label, Color bgColor, Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        side: BorderSide(color: Colors.blue),
      ),
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
