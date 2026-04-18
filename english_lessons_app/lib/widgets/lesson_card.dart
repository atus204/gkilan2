// lib/widgets/lesson_card.dart

import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../theme/app_theme.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final VoidCallback onTap;

  const LessonCard({
    super.key,
    required this.lesson,
    required this.onTap,
  });

  Color get levelColor {
    switch (lesson.level) {
      case 'Beginner':
        return AppTheme.beginnerColor;
      case 'Intermediate':
        return AppTheme.intermediateColor;
      case 'Advanced':
        return AppTheme.advancedColor;
      default:
        return AppTheme.textGray;
    }
  }

  Color get categoryColor =>
      AppTheme.categoryColors[lesson.category] ?? AppTheme.highlightColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            _buildThumbnail(),
            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBadgeRow(),
                  const SizedBox(height: 10),
                  _buildTitle(),
                  const SizedBox(height: 6),
                  _buildSubtitle(),
                  const SizedBox(height: 12),
                  _buildStats(),
                  const SizedBox(height: 12),
                  if (lesson.progress > 0) _buildProgressBar(),
                  const SizedBox(height: 12),
                  _buildFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Stack(
        children: [
          Image.network(
            lesson.thumbnailUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              height: 180,
              color: AppTheme.accentColor,
              child: const Icon(Icons.school, size: 60, color: AppTheme.textLight),
            ),
          ),
          // Gradient overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),
          // Duration badge
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.75),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time, size: 12, color: AppTheme.textLight),
                  const SizedBox(width: 4),
                  Text(
                    lesson.duration,
                    style: const TextStyle(
                      color: AppTheme.textLight,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Premium badge
          if (lesson.isPremium)
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.goldColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.workspace_premium, size: 12, color: Colors.black),
                    SizedBox(width: 4),
                    Text(
                      'PREMIUM',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          // Play button overlay
          Positioned.fill(
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppTheme.highlightColor.withOpacity(0.85),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.highlightColor.withOpacity(0.5),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeRow() {
    return Row(
      children: [
        _badge(lesson.level, levelColor),
        const SizedBox(width: 8),
        _badge(lesson.category, categoryColor),
        const Spacer(),
        Row(
          children: [
            const Icon(Icons.star, color: AppTheme.goldColor, size: 14),
            const SizedBox(width: 3),
            Text(
              lesson.rating.toStringAsFixed(1),
              style: const TextStyle(
                color: AppTheme.goldColor,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _badge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      lesson.title,
      style: const TextStyle(
        color: AppTheme.textLight,
        fontSize: 17,
        fontWeight: FontWeight.w700,
        height: 1.3,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      lesson.subtitle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: AppTheme.textGray,
        fontSize: 12.5,
        height: 1.4,
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        const Icon(Icons.people_outline, size: 14, color: AppTheme.textGray),
        const SizedBox(width: 4),
        Text(
          '${_formatNumber(lesson.totalStudents)} học viên',
          style: const TextStyle(color: AppTheme.textGray, fontSize: 12),
        ),
        const SizedBox(width: 16),
        const Icon(Icons.comment_outlined, size: 14, color: AppTheme.textGray),
        const SizedBox(width: 4),
        Text(
          '${_formatNumber(lesson.totalReviews)} đánh giá',
          style: const TextStyle(color: AppTheme.textGray, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lesson.progress == 100 ? '✅ Hoàn thành' : 'Tiến độ học',
              style: TextStyle(
                color: lesson.progress == 100 ? AppTheme.successColor : AppTheme.textGray,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${lesson.progress}%',
              style: TextStyle(
                color: lesson.progress == 100 ? AppTheme.successColor : AppTheme.highlightColor,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: lesson.progress / 100,
            backgroundColor: AppTheme.surfaceColor,
            valueColor: AlwaysStoppedAnimation(
              lesson.progress == 100 ? AppTheme.successColor : AppTheme.highlightColor,
            ),
            minHeight: 5,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundImage: NetworkImage(lesson.instructorAvatar),
          backgroundColor: AppTheme.surfaceColor,
        ),
        const SizedBox(width: 8),
        Text(
          lesson.instructor,
          style: const TextStyle(
            color: AppTheme.textLight,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppTheme.highlightColor),
      ],
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }
}
