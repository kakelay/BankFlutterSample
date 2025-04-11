import 'package:flutter/material.dart';

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        fontFamily: 'Roboto',
      ),
      home: BankingHomePage(),
    );
  }
}

class BankingHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          // Blue gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0A74DA), Color(0xFF004D9C)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildProfileSection(),
                _buildQuickActions(),
                _buildGovernmentServicesSection(),
                _buildWebTabView(), // Web Tab View (Advertisements)
                _buildGroupWidgetMiniApp(),
                _buildGroupTheme()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Color(0xFF0A74DA)),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, So Dawin!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // View profile action
                    },
                    child: Text(
                      'View Profile >',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Default',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(
                  'Monthly Savings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Receive money action
                      },
                      icon: Icon(Icons.arrow_downward, size: 16),
                      label: Text('Receive Money'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Send money action
                      },
                      icon: Icon(Icons.arrow_upward, size: 16),
                      label: Text('Send Money'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          _buildCustomIcon(Icons.account_balance_wallet, 'Accounts'),
          _buildCustomIcon(Icons.credit_card, 'Cards'),
          _buildCustomIcon(Icons.star, 'Favorites'),
          _buildCustomIcon(Icons.payment, 'Payments'),
          _buildCustomIcon(Icons.sync_alt, 'Transfers'),
          _buildCustomIcon(Icons.account_balance, 'Government S.'),
          _buildCustomIcon(Icons.account_balance_wallet, 'E-cash'),
          _buildCustomIcon(Icons.miscellaneous_services, 'Services'),
          _buildCustomIcon(Icons.qr_code, 'ABA Scan'),
          _buildCustomIcon(Icons.person_add, 'Invite Friend'),
          _buildCustomIcon(Icons.add_circle, 'New Account'),
          _buildCustomIcon(Icons.more_horiz, 'More'),
        ],
      ),
    );
  }

  Widget _buildCustomIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey[300]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Icon(icon, size: 28, color: Color(0xFF0A74DA)),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildGovernmentServicesSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Government Services',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  // View all action
                },
                child:
                    Text('VIEW ALL >', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Number of services
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.location_city,
                        size: 40, color: Color(0xFF0A74DA)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebTabView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: Text(
              'Advertisements',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildAdCard('assets/images/ad1.png'),
                _buildAdCard('assets/images/ad1.png'),
                _buildAdCard('assets/images/ad1.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdCard(String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildGroupWidgetMiniApp() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '_buildGroupWidgetMiniApp',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 120, // Adjusted height for padding and background
            decoration: BoxDecoration(
              color: Color(0xFFECEFF1), // Light grey background
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Number of widgets
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'MiniApp ${index + 1}',
                        style: TextStyle(
                          color: Color(0xFF0A74DA),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupTheme() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '_buildGroupTheme',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 180, // Adjusted height for padding and background
           
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Number of widgets
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Theme${index + 1}',
                      style: TextStyle(
                        color: Color(0xFF0A74DA),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
