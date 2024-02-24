import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back when the back arrow is pressed
            },
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_picture.jpg'), // Replace with your image path
              ),
              SizedBox(height: 20),
              Text(
                'KVR Traders ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Address: 123 Main St, City, Country',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Phone: +1234567890',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Email: kvrtraders@example.com',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'About Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We understand that buying or selling a property can be a complex process,'
                    ' which is why we strive to make it as smooth and hassle-free as possible. '
                    'Whether you are a first-time homebuyer, seasoned investor, or looking to sell your property, '
                    'we are here to guide you every step of the way.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
