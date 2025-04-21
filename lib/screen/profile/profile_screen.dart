import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.share, color: Colors.white),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.favorite_border_outlined, color: Colors.white),
          ),
          IconButton(
            onPressed: () => {},
            icon:
                Icon(Icons.notifications_active_outlined, color: Colors.white),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Icon(Icons.person_outline,
                          size: 45, color: Colors.blue),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Mittal Parmar",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                        Text("9714165502",
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold)),
                        Text("Surat | Mughal Sarai",
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 25, color: Colors.blue),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  // color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(12),
                  // border: Border.all(color: Colors.orange.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                            value: 0.7, color: Colors.orange),
                        Text("70%",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Complete Your Profile Now!",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "This helps you get more HR calls and \nbetter job opportunities.",
                          style: TextStyle(fontSize: 12),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildSection("My Activity", [
                _buildTile(Icons.flash_on, "HR Invites"),
                _buildTile(Icons.favorite_border, "Saved Jobs"),
                _buildTile(Icons.history, "My Activity"),
              ]),
              SizedBox(height: 10),
              _buildSection("Job Box", [
                _buildTile(Icons.bolt, "My Job Preference",
                    trailing: "Action Needed"),
              ]),
              SizedBox(height: 10),
              _buildSection("Tips & Support", [
                _buildTile(Icons.lightbulb_outline, "Interview Tips"),
                _buildTile(Icons.help_outline, "Help & Support"),
                _buildTile(Icons.history, "My Activity"),
                _buildTile(Icons.settings, "Settings"),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 8),
        Column(children: tiles),
      ],
    );
  }

  Widget _buildTile(IconData icon, String title, {String? trailing}) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: trailing != null
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(trailing,
                    style: TextStyle(color: Colors.red, fontSize: 12)),
              )
            : Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
