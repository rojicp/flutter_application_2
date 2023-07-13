import 'package:flutter/material.dart';

void main() {
  runApp(const TrainingApp());
}

class TrainingApp extends StatefulWidget {
  const TrainingApp({super.key});

  @override
  State<TrainingApp> createState() => _TrainingAppState();
}

class _TrainingAppState extends State<TrainingApp> {
  double count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This is a Title",
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  count++;
                });

                print(count);
              },
              child: const Row(
                children: [Icon(Icons.add), Text("Add")],
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  count = 0;
                });

                print(count);
              },
              child: const Icon(Icons.restore),
            ),
          ],
        ),
        appBar: AppBar(
          title: Row(
            children: [
              const Text("My First Page"),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    count++;
                    setState(() {});
                  },
                  child: const Text("Plus")),
              const SizedBox(
                width: 5,
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });

                  print(count);
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Below given the current count",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              count.toString(),
              style: const TextStyle(
                  fontSize: 55, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        )),
      ),
    );
  }
}
