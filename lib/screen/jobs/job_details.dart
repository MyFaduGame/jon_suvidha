import 'package:flutter/material.dart';
import 'package:job_suvidha/screen/home/home_screen.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({super.key});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Widget buildInfoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 14),
          children: [
            TextSpan(
                text: "$title: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, String content) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFF4F6FA),
        borderRadius: BorderRadius.circular(8),
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black87, fontSize: 14),
          children: [
            TextSpan(
                text: "$title\n",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: content),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              color: Color(0xFF327FB3),
              child: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
                tabs: [
                  Tab(text: "Job Details"),
                  Tab(text: "Company Details"),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Job Details Tab
                  Column(
                    children: [
                      SizedBox(
                        height: screenHeight / 1.3,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Additional Information Box
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0xFFE6F1FA),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.info_outline,
                                            size: 20, color: Colors.blue),
                                        SizedBox(width: 6),
                                        Text(
                                          "Additional Information",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    buildInfoTile(
                                        "Job Timings", "8:00 AM – 8:00 PM"),
                                    buildInfoTile("Job Type",
                                        "Full Time / Monday To Saturday"),
                                    buildInfoTile("Department",
                                        "Office / Admin / Computer Operator"),
                                    buildInfoTile("Role", "Office Help / Peon"),
                                    buildInfoTile("Job Address",
                                        "Minibazar Varachha Rode, Surat"),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),

                              buildSection("Interview Type Video",
                                  "Lorem Ipsum Dolor Sit Amet,"),
                              buildSection("Industry Type", "Graphic Designer"),
                              buildSection(
                                  "Perks And Benefits", "Travel Allowance"),
                              buildSection("Interview Details",
                                  "Contact Person: Monthan, Owner"),
                            ],
                          ),
                        ),
                      ),
                      // Bottom Buttons
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 90,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xFFC8F6D0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.phone,
                                            color: Color(0xFF319F43)),
                                        SizedBox(width: 5),
                                        Text(
                                          "Share",
                                          style: TextStyle(
                                              color: Color(0xFF319F43)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 110,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xFFFFDADD)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.videocam, color: Colors.red),
                                        SizedBox(width: 5),
                                        Text(
                                          "Online \nInterView",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 110,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xFFE4F4FF)),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            color: Color(0xFF327FB3),
                                            size: 20,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "Schedule \nInterView",
                                            style: TextStyle(
                                              color: Color(0xFF327FB3),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
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
                                backgroundColor: Colors.blue[700],
                                minimumSize: Size(double.infinity, 48),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Center(
                                  child: Text("APPLY",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Company Details Tab (placeholder)
                  Center(child: Text("Company Details coming soon")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
