import 'package:flutter/material.dart';

import '../models/category.dart';
import 'course_screen.dart';


class FeaturedScreen extends StatelessWidget {
  const FeaturedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                gradient: LinearGradient(colors: [
                  Color(0xFF493D9E),
                  Color(0xffB2A5FF),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Hello, \nGood Morning',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white30),
                      child: const Icon(
                        Icons.notifications,
                        size: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45.0,
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0))),
                        hintText: 'Search for Topic',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.mic),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Row(
              children: [
                const Text(
                  'Explore Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text('See All')
              ],
            ),
          ),
          SizedBox(
            height: 400,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemBuilder: (context, index) {
                final category = categoryList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CourseScreen(
                          category: category,
                        );
                      },
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 7,
                            spreadRadius: 2,
                          )
                        ]),
                    child: Column(
                      children: [
                        Image.asset(
                          category.coverImage,
                          height: 140.0,
                        ),
                        Text(
                          category.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text("${category.noOfCourses} Course")
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
