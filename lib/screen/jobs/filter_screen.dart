import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedIndex = 0;

  // State variables
  String? selectedSortBy;
  List<String> selectedSalaryRanges = [];
  String? selectedDistance;
  List<String> selectedSectors = [];
  String? selectedPostedIn;

  final List<String> filterTitles = [
    'Sort By',
    'Salary',
    'Distance',
    'Sector',
    'Posted In',
    'Job Type',
    'Qualification',
    'Experience',
  ];

  final List<String> sortByOptions = [
    'Recommended',
    'Distance',
    'Salary',
    'New jobs'
  ];
  final List<String> sortByDescriptions = [
    'Jobs that are recommended for you',
    'You can see the jobs nearby',
    'See jobs according to your salary',
    'Jobs that are posted recently',
  ];

  final List<String> salaryRanges = [
    '0 - 10,000',
    '10,000 - 20,000',
    '20,000 - 30,000',
    '30,000 - 40,000',
    '40,000 - 50,000',
    'More than 50,000',
  ];

  final List<String> distanceOptions = [
    'Upto 5 Kms',
    'Upto 10 Kms',
    'Upto 20 Kms',
    'Full city',
  ];

  final List<String> sectors = [
    'DTP/Graphic Designer',
    'Accounts',
    'Bank Office',
    'Beautician/Salon',
    'Business Development',
    'Content writing',
  ];

  final List<String> postedInOptions = [
    'All',
    'last 24hrs',
    'Last 3 days',
    'Last 7 days',
  ];

  Widget buildFilterContent() {
    switch (selectedIndex) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(sortByOptions.length, (index) {
            return RadioListTile<String>(
              title: Text(sortByOptions[index]),
              subtitle: Text(sortByDescriptions[index]),
              value: sortByOptions[index],
              groupValue: selectedSortBy,
              onChanged: (value) {
                setState(() {
                  selectedSortBy = value;
                });
              },
            );
          }),
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: salaryRanges.map((range) {
            return CheckboxListTile(
              title: Text(range),
              value: selectedSalaryRanges.contains(range),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedSalaryRanges.add(range);
                  } else {
                    selectedSalaryRanges.remove(range);
                  }
                });
              },
            );
          }).toList(),
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: distanceOptions.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: selectedDistance,
              onChanged: (value) {
                setState(() {
                  selectedDistance = value;
                });
              },
            );
          }).toList(),
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search Sector',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            ...sectors.map((sector) {
              return CheckboxListTile(
                title: Text(sector),
                value: selectedSectors.contains(sector),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedSectors.add(sector);
                    } else {
                      selectedSectors.remove(sector);
                    }
                  });
                },
              );
            }),
          ],
        );
      case 4:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: postedInOptions.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: selectedPostedIn,
              onChanged: (value) {
                setState(() {
                  selectedPostedIn = value;
                });
              },
            );
          }).toList(),
        );
      default:
        return Center(child: Text('Coming soon'));
    }
  }

  void clearFilters() {
    setState(() {
      selectedSortBy = null;
      selectedSalaryRanges.clear();
      selectedDistance = null;
      selectedSectors.clear();
      selectedPostedIn = null;
    });
  }

  void applyFilters() {
    print('Sort By: $selectedSortBy');
    print('Salary: $selectedSalaryRanges');
    print('Distance: $selectedDistance');
    print('Sectors: $selectedSectors');
    print('Posted In: $selectedPostedIn');
    // Add your filter logic or API call here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filters",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: clearFilters,
                    child:
                        Text("Clear all", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  // Left panel
                  Container(
                    width: 120,
                    color: Colors.grey[100],
                    child: ListView.builder(
                      itemCount: filterTitles.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          tileColor: selectedIndex == index
                              ? Colors.white
                              : Colors.grey[100],
                          title: Text(
                            filterTitles[index],
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.blue
                                  : Colors.black,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  // Right content
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      child: buildFilterContent(),
                    ),
                  ),
                ],
              ),
            ),
            // Footer Buttons
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Close'),
                  ),
                  ElevatedButton(
                    onPressed: applyFilters,
                    child: Text('Apply'),
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
