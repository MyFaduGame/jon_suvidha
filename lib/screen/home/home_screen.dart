import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> jobs = [
    {
      "title": "UI/UX",
      "company": "Mr. Ghanshyam Patel",
      "salary": "₹25,000 – ₹35,000 / Month",
      "location": "Varachha - 1.3 Kms",
      "experience": "Fresher",
    },
    {
      "title": "Graphic designer",
      "company": "Mitesh Infosoft",
      "salary": "₹20,000 – ₹25,000 / Month",
      "location": "Pal Gam - 4.8 Kms",
      "experience": "1-2 Years",
    },
    {
      "title": "UI/UX",
      "company": "Mr. Ghanshyam Patel",
      "salary": "₹25,000 – ₹35,000 / Month",
      "location": "Varachha - 1.3 Kms",
      "experience": "Fresher",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            buildTopBar(),
            const SizedBox(height: 12),
            buildSearchBar(),
            const SizedBox(height: 20),
            buildQuickFilters(),
            const SizedBox(height: 20),
            buildActionNeeded(),
            const SizedBox(height: 20),
            buildJobSectionHeader(),
            const SizedBox(height: 10),
            ...jobs.map(buildJobCard).toList(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  side: const BorderSide(color: Colors.blue),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("VIEW ALL JOB"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopBar() {
    return Row(
      children: [
        Icon(Icons.location_on, color: Colors.blue),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Surat", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Katargam",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        const Spacer(),
        Icon(Icons.favorite_border),
        const SizedBox(width: 10),
        Icon(Icons.notifications_none),
      ],
    );
  }

  Widget buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search the best jobs for you!",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }

  Widget buildQuickFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildQuickFilter("Resume", Icons.description, Colors.pinkAccent),
        buildQuickFilter("Training", Icons.school, Colors.orange),
        buildQuickFilter("Result", Icons.assignment_turned_in, Colors.green),
      ],
    );
  }

  Widget buildQuickFilter(String title, IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 6),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget buildActionNeeded() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Immediate action needed",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text("All Company Logo"),
        ),
      ],
    );
  }

  Widget buildJobSectionHeader() {
    return Row(
      children: const [
        Text("Apply to these jobs",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Spacer(),
        Text("View All", style: TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget buildJobCard(Map<String, dynamic> job) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(child: Icon(Icons.work, color: Colors.blue)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  job['title'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Icon(Icons.more_horiz)
            ],
          ),
          const SizedBox(height: 8),
          Text(job['company'], style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.currency_rupee, size: 16, color: Colors.blue),
              const SizedBox(width: 4),
              Text(job['salary'], style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.redAccent),
              const SizedBox(width: 4),
              Text(job['location']),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Chip(
                label: Text(job['experience']),
                backgroundColor: Colors.orange.shade100,
              ),
              const SizedBox(width: 8),
              Chip(
                label: const Text("Full-Time"),
                backgroundColor: Colors.blue.shade100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
