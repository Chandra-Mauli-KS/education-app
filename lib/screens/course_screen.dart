import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/course.dart';
import '../models/course_detail_screen.dart';
import '../widget/custom_icon_button.dart';

class CourseScreen extends StatefulWidget {
  final Category category;
  const CourseScreen({super.key, required this.category});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late List<Course> filteredCourses;

  @override
  void initState() {
    super.initState();
    filteredCourses = courses
        .where((course) => course.categoryName == widget.category.name)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 AppBar Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  CustomIconButton(
                    child: const Icon(Icons.arrow_back),
                    height: 40,
                    width: 40,
                    ontap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.category.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🔸 Course List
            Expanded(
              child: filteredCourses.isEmpty
                  ? const Center(child: Text("No courses found."))
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      itemCount: filteredCourses.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final course = filteredCourses[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    CourseDetailScreen(course: course),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 6,
                                  offset: const Offset(2, 4),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 🖼 Course Image with error handling
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    course.image.isNotEmpty
                                        ? course.image
                                        : 'https://via.placeholder.com/150',
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 70,
                                        height: 70,
                                        color: Colors.grey.shade300,
                                        alignment: Alignment.center,
                                        child: const Icon(Icons.broken_image,
                                            color: Colors.grey),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),

                                // 📝 Course Info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        course.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'by ${course.author}',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      LinearProgressIndicator(
                                        value: course.completedPercentage,
                                        backgroundColor: Colors.grey[300],
                                        color: Colors.deepPurple,
                                        minHeight: 6,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
