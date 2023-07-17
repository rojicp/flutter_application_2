import 'package:flutter/material.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Students Page"),
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: const Text("New")),
            ElevatedButton(onPressed: () {}, child: const Text("Save"))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: 250,
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Name"),
              ),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Address"),
              ),
            ),
            SizedBox(
              width: 50,
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Age"),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
