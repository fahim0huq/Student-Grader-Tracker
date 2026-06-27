import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';


class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.watch<SubjectProvider>();
    final passing = provider.passingSubjects.length;
    final hasData = provider.totalSubjects > 0;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Result Summary', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 20),
          _SummaryCard(
            label: 'Total subjects',
            value: '${provider.totalSubjects}',
            icon: Icons.menu_book,
          ),
          _SummaryCard(
            label: 'Average mark',
            value: hasData ? provider.averageMark.toStringAsFixed(1) : '—',
            icon: Icons.calculate,
          ),
          _SummaryCard(
            label: 'Passing subjects',
            value: '$passing',
            icon: Icons.check_circle_outline,
          ),
          _SummaryCard(
            label: 'Overall grade',
            value: hasData ? provider.overallGrade : '—',
            icon: Icons.emoji_events_outlined,
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _SummaryCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: theme.colorScheme.primary),
        title: Text(label, style: theme.textTheme.titleMedium),
        trailing: Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}