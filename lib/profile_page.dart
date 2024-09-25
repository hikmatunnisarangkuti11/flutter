import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: const Color.fromARGB(255, 255, 64, 239),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                ),
                const Positioned(
                  top: 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('image/atun.png'), // Profile image
                  ),
                ),
              ],
            ),
            const Text(
              'Hikmatunnisa Rangkuti',
              style: TextStyle(
                fontSize: 24,
                height: 5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 0), // Space between avatar and content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Set the maximum width/height of all cards to the size of the largest content
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoCard(
                        'About',
                        'A motivated and forward-thinking student with 1 year of experience in a SaaS environment. Involved in several systems projects in the fields of information, health, and finance. Generate fresh ideas and positive energy. A team player with high enthusiasm, good communication, and analytical skills.',
                        constraints.maxWidth,
                      ),
                      const SizedBox(height: 10),
                      _buildInfoCard(
                        'History',
                        '2022 - Now\nInformation Technology\nSoftware Engineering and Game Development\nSMK WIKRAMA BOGOR',
                        constraints.maxWidth,
                      ),
                      const SizedBox(height: 10),
                      _buildInfoCard(
                        'Skill',
                        'PHP. Python. MySQL. SQL\nLaravel. React JS. Flutter',
                        constraints.maxWidth,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build info cards with consistent size
  Widget _buildInfoCard(String title, String description, double maxWidth) {
    return SizedBox(
      width: maxWidth, // Set the width to match the largest card
      child: Card(
        color: const Color.fromARGB(255, 255, 64, 239), // Pink color for the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white, // Set text color to white for contrast
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white, // Set text color to white for contrast
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
