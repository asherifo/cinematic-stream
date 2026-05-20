import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAccount extends StatelessWidget {
  const AddAccount({super.key});

  Future login(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isLogged', true);
    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, '/HomePage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Who's Watching?",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 50),
                  InkWell(
                    onTap: () {
                      // ignore: avoid_print
                      print("Edit your Account");
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          heightFactor: 2,
          child: Container(
            width: 231,
            height: 289,
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        login(context);
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/1.png",
                            height: 105,
                            width: 105,
                          ),
                          Text(
                            'Saurabh S...',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/HomePage');
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/2.png",
                            height: 105,
                            width: 105,
                          ),
                          Text(
                            'Children',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/HomePage');
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 105,
                        width: 105,
                        color: Colors.transparent,
                        child: Center(
                          child: Container(
                            height: 105,
                            width: 105,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(7.84),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Add Profile',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
