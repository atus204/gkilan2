// lib/models/lesson.dart

class Lesson {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String level;
  final String category;
  final String duration;
  final double rating;
  final int totalReviews;
  final int totalStudents;
  final String thumbnailUrl;
  final String videoUrl;
  final List<String> objectives;
  final List<LessonSection> sections;
  final String instructor;
  final String instructorAvatar;
  final bool isPremium;
  final int progress;
  final String publishedDate;
  final List<String> tags;

  const Lesson({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.level,
    required this.category,
    required this.duration,
    required this.rating,
    required this.totalReviews,
    required this.totalStudents,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.objectives,
    required this.sections,
    required this.instructor,
    required this.instructorAvatar,
    required this.isPremium,
    required this.progress,
    required this.publishedDate,
    required this.tags,
  });

  // ✅ fromJson (chuẩn bị cho API sau này)
  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      level: json['level'],
      category: json['category'],
      duration: json['duration'],
      rating: (json['rating'] ?? 0).toDouble(),
      totalReviews: json['totalReviews'] ?? 0,
      totalStudents: json['totalStudents'] ?? 0,
      thumbnailUrl: json['thumbnailUrl'],
      videoUrl: json['videoUrl'],
      objectives: List<String>.from(json['objectives'] ?? []),
      sections: (json['sections'] as List)
          .map((e) => LessonSection.fromJson(e))
          .toList(),
      instructor: json['instructor'],
      instructorAvatar: json['instructorAvatar'],
      isPremium: json['isPremium'] ?? false,
      progress: json['progress'] ?? 0,
      publishedDate: json['publishedDate'],
      tags: List<String>.from(json['tags'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'level': level,
      'category': category,
      'duration': duration,
      'rating': rating,
      'totalReviews': totalReviews,
      'totalStudents': totalStudents,
      'thumbnailUrl': thumbnailUrl,
      'videoUrl': videoUrl,
      'objectives': objectives,
      'sections': sections.map((e) => e.toJson()).toList(),
      'instructor': instructor,
      'instructorAvatar': instructorAvatar,
      'isPremium': isPremium,
      'progress': progress,
      'publishedDate': publishedDate,
      'tags': tags,
    };
  }
}

class LessonSection {
  final String title;
  final String content;
  final String? example;
  final String? translation;
  final List<String>? exercises;
  final String type;

  const LessonSection({
    required this.title,
    required this.content,
    this.example,
    this.translation,
    this.exercises,
    required this.type,
  });

  factory LessonSection.fromJson(Map<String, dynamic> json) {
    return LessonSection(
      title: json['title'],
      content: json['content'],
      example: json['example'],
      translation: json['translation'],
      exercises: json['exercises'] != null
          ? List<String>.from(json['exercises'])
          : null,
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'example': example,
      'translation': translation,
      'exercises': exercises,
      'type': type,
    };
  }
}
