import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.watch<SubjectProvider>();
    final subjects = provider.subjects;

    if (subjects.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inbox_outlined,
                size: 64, color: theme.colorScheme.primary),
            const SizedBox(height: 12),
            Text('No subjects yet', style: theme.textTheme.titleMedium),
            const SizedBox(height: 4),
            Text('Add one from the Add tab',
                style: theme.textTheme.bodyMedium),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return Dismissible(
          key: ValueKey(subject.id),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: theme.colorScheme.error,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.delete, color: theme.colorScheme.onError),
          ),
          onDismissed: (_) {
            context.read<SubjectProvider>().removeById(subject.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Removed \"${subject.name}\"')),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: theme.colorScheme.primary,
                child: Text(
                  subject.grade,
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(subject.name),
              subtitle: Text('Mark: ${subject.mark}'),
              trailing: Text(
                'Grade ${subject.grade}',
                style: theme.textTheme.labelLarge,
              ),
            ),
          ),
        );
      },
    );
  }
}