import 'package:flutter/material.dart';
import '../models/lesson.dart';
import 'lesson_detail_screen.dart';

// 👉 DATA CÓ SẴN
final List<Lesson> demoLessons = [
  Lesson(
    id: "1",
    title: "Basic Greetings",
    subtitle: "Chào hỏi cơ bản",
    description: "Học cách chào hỏi trong tiếng Anh",
    level: "Beginner",
    category: "Speaking",
    duration: "10 phút",
    rating: 4.8,
    totalReviews: 120,
    totalStudents: 2000,
    thumbnailUrl: "",
    videoUrl: "",
    objectives: ["Hello", "Hi", "How are you"],
    sections: [
      LessonSection(
        title: "Hello",
        content: "Dùng để chào hỏi",
        example: "Hello! How are you?",
        type: "theory",
      ),
    ],
    instructor: "Teacher Anna",
    instructorAvatar: "",
    isPremium: false,
    progress: 0,
    publishedDate: "2026",
    tags: ["basic"],
  ),
];

class LessonsListScreen extends StatelessWidget {
  const LessonsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Danh sách bài học")),

      body: ListView.builder(
        itemCount: demoLessons.length,
        itemBuilder: (context, index) {
          final lesson = demoLessons[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(lesson.title),
              subtitle: Text(lesson.subtitle),
              trailing: const Icon(Icons.arrow_forward_ios),

              // 🔥 CLICK XEM CHI TIẾT
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LessonDetailScreen(lesson: lesson),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}