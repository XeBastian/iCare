import 'package:flutter/material.dart';
import 'package:icare/models/subject_model.dart';

class LessonCard extends StatelessWidget {
  final Subject subject;
  final VoidCallback onTapEnroll;
  final VoidCallback onTap;
  final int? index;
  const LessonCard({Key? key, required this.subject, required this.index, required this.onTapEnroll, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Leions'),
      subtitle: const Text('Kill is'),
      trailing: ActionChip(
        label: const Text('nothing'),
        onPressed: onTapEnroll,
      ),
      onTap: onTap,
    );
  }
}
