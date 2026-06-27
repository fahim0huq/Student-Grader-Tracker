import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/subject.dart';
import '../providers/navigation_provider.dart';
import '../providers/subject_provider.dart';
class AddSubjectScreen extends StatefulWidget {
  const AddSubjectScreen({super.key});

  @override
  State<AddSubjectScreen> createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _markController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _markController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();
    final mark = int.parse(_markController.text.trim());

    context.read<SubjectProvider>().addSubject(
      Subject(name: name, mark: mark),
    );

    _nameController.clear();
    _markController.clear();
    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added \"$name\"')),
    );

    context.read<NavigationProvider>().setIndex(1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text('Add a new subject', style: theme.textTheme.titleLarge)),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Subject name',
                  prefixIcon: Icon(Icons.book_outlined),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _markController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Mark (0 - 100)',
                  prefixIcon: Icon(Icons.grade_outlined),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Mark cannot be empty';
                  }
                  final parsed = int.tryParse(value.trim());
                  if (parsed == null) {
                    return 'Mark must be a whole number';
                  }
                  if (parsed < 0 || parsed > 100) {
                    return 'Mark must be between 0 and 100';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.save),
                label: const Text('Save subject'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}