import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilix/features/home/logic/cubit.dart';
import 'package:netfilix/features/home/presentation/widget/cate_buttons.dart';
import 'package:netfilix/features/home/presentation/widget/now_watching_widget.dart';
import 'package:netfilix/features/home/presentation/widget/popular_widget.dart';
import 'package:netfilix/features/home/presentation/widget/top_rated_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  Future logout(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isLogged', false);
    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, '/SignAccount');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchAllMovies(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(57, 16, 30, 1), // Deep Blue
                  Color.fromRGBO(8, 2, 4, 1), // Lighter Blue
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  SafeArea(
                    child: Row(
                      children: [
                        Text(
                          'For Saurabh Saini',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Spacer(flex: 1),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/icons/shareIcon.png',
                            width: 22,
                            height: 18,
                          ),
                        ),
                        SizedBox(width: 15),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/icons/downloadIcon.png',
                            width: 22,
                            height: 18,
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            logout(context);
                          },
                          icon: Icon(Icons.logout, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  Catebuttons(
                    cateName: [
                      'TV Shows',
                      'Movies',
                      'Comedy Show',
                      'Action',
                      'Romance',
                    ],
                  ),

                  NowWatchingWidget(),

                  PopularWidget(),
                  TopRatedWidget(),
                  NowWatchingWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
