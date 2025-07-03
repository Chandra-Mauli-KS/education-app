
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/course.dart';
import '../models/course_detail_screen.dart';
import '../widget/custom_icon_button.dart';

class CourseScreen extends StatefulWidget {
  final Category category;
  const CourseScreen({super.key, required this.category});
  @override
  State<CourseScreen> createState() {
    return _CourseScreenState();
  }
}

class _CourseScreenState extends State<CourseScreen> {
  late List<Course> filteredCourse;

  @override
  void initState() {
    filteredCourse = courses.where((value) {
      return value.categoryName == widget.category.name;
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  CustomIconButton(
                    child: const Icon(Icons.arrow_back),
                    height: 35.0,
                    width: 35.0,
                    ontap: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    'Development',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                  child: ListView.separated(
                itemBuilder: (context, index) {
                  final course = filteredCourse[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CourseDetailScreen(course: course);
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              course.image,
                              width: 60.0,
                              fit: BoxFit.cover,
                              height: 60.0,
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course.name,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Author ${course.author}',
                                style: const TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              LinearProgressIndicator(
                                value: course.completedPercentage,
                                backgroundColor: Colors.black12,
                                color: Colors.deepPurple,
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: filteredCourse.length,
                padding: const EdgeInsets.symmetric(vertical: 20),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
