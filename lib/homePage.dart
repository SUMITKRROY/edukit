import 'package:edukit/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodycolor,
      appBar: AppBar(
        backgroundColor: AppColors.appbarcolor,
      ),
      body: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (!snapshot.hasData) {
            // Return a loading indicator if data is not yet available
            return CircularProgressIndicator();
          }

          SharedPreferences prefs = snapshot.data!;
          String firstName = prefs.getString('firstName') ?? '';
          String lastName = prefs.getString('lastName') ?? '';
          String email = prefs.getString('email') ?? '';

          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Data',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name: $firstName',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Last Name: $lastName',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Email: $email',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      // You can add more Text widgets for other user info if needed
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSubjectContainer('Math'),
                    _buildSubjectContainer('Science'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSubjectContainer('History'),
                    _buildSubjectContainer('English'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        // Clear SharedPreferences data
                        await prefs.clear();
                        // Navigate to login screen
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: Text('Logout'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the edit page
                        Navigator.pushNamed(context, '/edit');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      child: Text('Edit'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubjectContainer(String subject) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        subject,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
