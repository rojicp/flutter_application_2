import 'package:flutter/material.dart';
import 'students.dart';
import 'counter.dart';

void main() {
  runApp(const TrainingApp());
}

class TrainingApp extends StatefulWidget {
  const TrainingApp({super.key});

  @override
  State<TrainingApp> createState() => _TrainingAppState();
}

class _TrainingAppState extends State<TrainingApp> {
  String pageCaption = "Home Page";
  String pageName = "home";

  Widget homePageButtons() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              pageName = "counter";
              pageCaption = "Counter Example";
            });

            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return CounterWidget();
            //   },
            // ));
          },
          child: const Text("Counter Example"),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              pageName = "student";
              pageCaption = "Student Page";
            });
          },
          child: const Text("Data Entry Page"),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This is a Title",
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(pageCaption),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      pageName = "home";
                      pageCaption = "Home Page";
                    });
                  },
                  child: const Icon(Icons.close)),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
        body: Builder(builder: (context) {
          switch (pageName) {
            case "counter":
              return const CounterWidget();

            case "student":
              return const StudentPage();

            default:
              return homePageButtons();
          }
        }),
      ),
    );
  }
}
