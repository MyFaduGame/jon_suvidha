import 'package:flutter/material.dart';
import 'package:job_suvidha/screen/jobs/filter_screen.dart';
import 'package:job_suvidha/screen/jobs/job_details.dart';
import 'package:job_suvidha/screen/jobs/saved_jobs.dart';
import 'package:job_suvidha/screen/basic/notification_screen.dart';

class ViewAllJobs extends StatefulWidget {
  const ViewAllJobs({super.key});

  @override
  State<ViewAllJobs> createState() => _ViewAllJobsState();
}

class _ViewAllJobsState extends State<ViewAllJobs> {
  String selectedCity = "Surat";

  final List<String> cities = [
    "Surat",
    "Ahmedabad",
    "Vadodara",
    "Rajkot",
    "Bhavnagar",
    "Gandhinagar"
  ];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFF327FB3),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.blue.shade100,
                                  child: Icon(
                                    Icons.navigation,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                DropdownButton<String>(
                                  value: selectedCity,
                                  underline: SizedBox(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  onChanged: (String? newCity) {
                                    setState(() {
                                      selectedCity = newCity!;
                                    });
                                  },
                                  onTap: () => {},
                                  items: cities.map((String city) {
                                    return DropdownMenuItem<String>(
                                      value: city,
                                      child: Text(city),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                            const Text(
                              "Katargam",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SavedJobs(),
                                  ),
                                );
                              },
                              child: Icon(Icons.share, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SavedJobs(),
                                  ),
                                );
                              },
                              child: Icon(Icons.favorite_border,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NotificationScreen(),
                                  ),
                                );
                              },
                              child: Icon(Icons.notifications_none,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Search Job Title",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Icon(Icons.search, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Color(0xFFD3EDFF),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Job Near You',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2B6DB0),
                                  fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 2,
                              width: 80,
                              color: Color(0xFF2B6DB0),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Other Cities',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        SizedBox(width: 5),
                        // Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(Icons.filter_list, color: Colors.black),
                          label: Text("Filters",
                              style: TextStyle(color: Colors.black)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FilterScreen(),
                              ),
                            );
                          },
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Clear",
                            style: TextStyle(color: Color(0xFF2B6DB0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ...jobs.map(buildJobCard),
            const SizedBox(height: 20),
          ],
        ),
      ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                maxRadius: 25,
                child: Image.asset(
                  'assets/images/office.png',
                  scale: 3.5,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job['title'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(job['company'], style: TextStyle(color: Colors.black54)),
                ],
              ),
              const SizedBox(width: 10),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JobDetailsScreen(),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
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
          Container(
            color: Colors.grey.shade200,
            width: double.infinity,
            height: 4,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Chip(
                label: Text(
                  job['experience'],
                  style: TextStyle(color: Colors.orangeAccent),
                ),
                backgroundColor: Colors.amber.shade100,
              ),
              const SizedBox(width: 10),
              Chip(
                label: const Text(
                  "Full-Time",
                  style: TextStyle(color: Colors.blue),
                ),
                backgroundColor: Colors.lightBlue.shade50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
