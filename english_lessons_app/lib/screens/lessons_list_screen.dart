import 'package:flutter/material.dart';
import '../models/lesson.dart';
import 'lesson_detail_screen.dart';

// =========================
// 📚 DATA NHIỀU BÀI HỌC
// =========================
final List<Lesson> demoLessons = [
  // 🟢 SPEAKING
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
        title: "Greetings",
        content: "Hello / Hi / Good morning",
        example: "Hello! How are you?",
        type: "theory",
      ),
    ],
    instructor: "Teacher Anna",
    instructorAvatar: "",
    isPremium: false,
    progress: 0,
    publishedDate: "2026",
    tags: ["speaking"],
  ),

  Lesson(
    id: "2",
    title: "Daily Conversation",
    subtitle: "Hội thoại hàng ngày",
    description: "Giao tiếp cơ bản trong cuộc sống",
    level: "Intermediate",
    category: "Speaking",
    duration: "15 phút",
    rating: 4.7,
    totalReviews: 200,
    totalStudents: 3500,
    thumbnailUrl: "",
    videoUrl: "",
    objectives: ["Talk daily", "Ask questions"],
    sections: [
      LessonSection(
        title: "Conversation",
        content: "How are you? I'm fine",
        example: "What are you doing?",
        type: "conversation",
      ),
    ],
    instructor: "Teacher John",
    instructorAvatar: "",
    isPremium: false,
    progress: 0,
    publishedDate: "2026",
    tags: ["speaking"],
  ),

  // 🔵 VOCABULARY
  Lesson(
    id: "3",
    title: "Family Members",
    subtitle: "Thành viên gia đình",
    description: "Từ vựng về gia đình",
    level: "Beginner",
    category: "Vocabulary",
    duration: "12 phút",
    rating: 4.6,
    totalReviews: 150,
    totalStudents: 2200,
    thumbnailUrl: "",
    videoUrl: "",
    objectives: ["Father", "Mother", "Brother"],
    sections: [
      LessonSection(
        title: "Family",
        content: "Father, Mother, Brother, Sister",
        example: "My father is a doctor",
        type: "vocabulary",
      ),
    ],
    instructor: "Teacher Mary",
    instructorAvatar: "",
    isPremium: false,
    progress: 0,
    publishedDate: "2026",
    tags: ["vocabulary"],
  ),

  Lesson(
    id: "4",
    title: "Colors",
    subtitle: "Màu sắc",
    description: "Học màu sắc cơ bản",
    level: "Beginner",
    category: "Vocabulary",
    duration: "10 phút",
    rating: 4.5,
    totalReviews: 90,
    totalStudents: 1800,
    thumbnailUrl: "",
    videoUrl: "",
    objectives: ["Red", "Blue", "Green"],
    sections: [
      LessonSection(
        title: "Colors",
        content: "Red, Blue, Green, Yellow",
        example: "The sky is blue",
        type: "theory",
      ),
    ],
    instructor: "Teacher Tom",
    instructorAvatar: "",
    isPremium: false,
    progress: 0,
    publishedDate: "2026",
    tags: ["vocabulary"],
  ),

  // 🟣 GRAMMAR
  Lesson(
    id: "5",
    title: "Present Simple",
    subtitle: "Thì hiện tại đơn",
    description: "Ngữ pháp cơ bản",
    level: "Beginner",
    category: "Grammar",
    duration: "20 phút",
    rating: 4.9,
    totalReviews: 300,
    totalStudents: 5000,
    thumbnailUrl: "",
    videoUrl: "",
    objectives: ["Hiểu thì hiện tại đơn"],
    sections: [
      LessonSection(
        title: "Structure",
        content: "S + V(s/es)",
        example: "She goes to school",
        type: "grammar",
      ),
    ],
    instructor: "Teacher David",
    instructorAvatar: "",
    isPremium: false,
    progress: 0,
    publishedDate: "2026",
    tags: ["grammar"],
  ),

  // 🟠 LISTENING
  Lesson(
    id: "6",
    title: "Listening Basic",
    subtitle: "Nghe cơ bản",
    description: "Luyện kỹ năng nghe",
    level: "Intermediate",
    category: "Listening",
    duration: "25 phút",
    rating: 4.7,
    totalReviews: 180,
    totalStudents: 2600,
    thumbnailUrl: "",
    videoUrl: "",
    objectives: ["Nghe hiểu câu đơn giản"],
    sections: [
      LessonSection(
        title: "Practice",
        content: "Listen and repeat",
        example: "Hello, how are you?",
        type: "listening",
      ),
    ],
    instructor: "Teacher Lisa",
    instructorAvatar: "",
    isPremium: false,
    progress: 0,
    publishedDate: "2026",
    tags: ["listening"],
  ),
];

// =========================
// 📱 UI
// =========================
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
              subtitle: Text("${lesson.category} • ${lesson.level}"),
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