import 'package:flutter/material.dart';

class settings_page extends StatefulWidget {
  const settings_page({Key? key}) : super(key: key);

  @override
  _settings_pageState createState() => _settings_pageState();
}

class _settings_pageState extends State<settings_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        // Custom back button
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white, // Change the color of the back arrow
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 65.0,
                width: 370.0,
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality for the button here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 50, 50, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.share_sharp,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Share Alpha AI',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 310.0,
              width: 370.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 50, 50, 50),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 10.0), // Add padding at the top
                  _buildRow('Twitter', Icons.share, 'Follow on Twitter'),
                  _buildDivider(), // Add a horizontal divider
                  _buildRow('Reddit', Icons.share, 'Follow on Reddit'),
                  _buildDivider(), // Add a horizontal divider
                  _buildRow('Star', Icons.thumb_up, 'Like Us'),
                  _buildDivider(), // Add a horizontal divider
                  _buildRow('Codeway', Icons.info, 'About Us'),
                  SizedBox(height: 10.0), // Add padding at the bottom
                ],
              ),
            ),
             SizedBox(height: 30.0),
            Container(
              height: 230.0,
              width: 370.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 50, 50, 50),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 10.0), // Add padding at the top
                  _buildRow('Twitter', Icons.percent, 'Promo Code'),
                  _buildDivider(), // Add a horizontal divider
                  _buildRow('Reddit', Icons.email, 'E-mail Support'),
                  _buildDivider(), // Add a horizontal divider
                  _buildRow('Star', Icons.front_loader, 'Restore Purchases'),
                  
                ],
              ),
            ),
             SizedBox(height: 30.0),
             Container(
              height: 230.0,
              width: 370.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 50, 50, 50),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 10.0), // Add padding at the top
                  _buildRow('Twitter', Icons.privacy_tip, 'Privacy Policy'),
                  _buildDivider(), // Add a horizontal divider
                  _buildRow('Reddit', Icons.pages, 'Terms of Service'),
                  _buildDivider(), // Add a horizontal divider
                  _buildRow('Star', Icons.book, 'Community Guidelines'),
                  
                ],
              ),
            ),
            SizedBox(height: 30.0)
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String iconName, IconData iconData, String label) {
    return Container(
      height: 50.0, // Adjusted the height of individual rows
      child: Row(
        children: [
          Container(
            width: 40.0,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 50, 50, 50),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1.0,
      color: Color.fromARGB(255, 27, 27, 27),
      margin: EdgeInsets.symmetric(vertical: 10.0),
    );
  }
}
