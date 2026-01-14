import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: NotesScreen()));

class NotesScreen extends StatefulWidget {
  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final _ctrl = TextEditingController();
  final _notes = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('заметки')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(controller: _ctrl, decoration: const InputDecoration(hintText: '...')),
            ElevatedButton(
              onPressed: () {
                if (_ctrl.text.trim().isNotEmpty) {
                  setState(() {
                    _notes.add(_ctrl.text.trim());
                    _ctrl.clear();
                  });
                }
              },
              child: const Text('ок'),
            ),
            Expanded(
              child: _notes.isEmpty
                  ? const Center(child: Text('нет'))
                  : ListView.builder(
                      itemCount: _notes.length,
                      itemBuilder: (c, i) => Text(_notes[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
