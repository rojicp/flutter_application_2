import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  double count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            "Below given the current count",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            count.toString(),
            style: const TextStyle(
                fontSize: 55, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(
              width: 10,
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
        )
      ],
    ));
  }
}
