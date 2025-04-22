import 'package:flutter/material.dart';
import 'package:job_suvidha/screen/jobs/job_details.dart';
import 'package:job_suvidha/screen/jobs/saved_jobs.dart';
import 'package:job_suvidha/screen/basic/notification_screen.dart';
import 'package:job_suvidha/screen/jobs/view_all_jobs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    size: 20),
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
                            style: TextStyle(color: Colors.grey),
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
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Icon(Icons.favorite_border,
                                  color: Colors.blue),
                            ),
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
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Icon(Icons.notifications_none,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Service Vendor Partner",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                            'assets/images/splash_screen_logo.png',
                            fit: BoxFit.contain),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 60,
                        height: 60,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/splash_screen_logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.only(left: 12),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "All Company Logo",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios,
                                  size: 14, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 20,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 20,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 20,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Quick Filters',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFFFFFF), Color(0xFFD1B8FF)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child:
                            Image.asset('assets/images/reume.png', height: 24),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          'Resume',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFFFFFF), Color(0xFFA6D4FF)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child:
                            Image.asset('assets/images/group.png', height: 24),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          'Training',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFFFFFF), Color(0xFFA8F0DB)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child:
                            Image.asset('assets/images/clock.png', height: 24),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          'Result',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Search the best jobs for you!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFD3EDFF), // light blue background
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Job Title',
                  hintStyle: const TextStyle(color: Colors.black54),
                  prefixIcon: null,
                  suffixIcon: const Icon(Icons.search, color: Colors.black54),
                  filled: true,
                  fillColor: const Color(0xFFD8F0FF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Apply to these jobs",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Top 5 jobs that match your profile",
                          style: TextStyle(
                            fontSize: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewAllJobs(),
                          ),
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Text("View All",
                              style: TextStyle(color: Colors.blue))),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ...jobs.map(buildJobCard),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAllJobs(),
                    ),
                  );
                },
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
                child: const Text("VIEW ALL JOB →"),
              ),
            ),
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
