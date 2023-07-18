import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  TextEditingController studentName = TextEditingController();
  TextEditingController studentAddress = TextEditingController();
  TextEditingController studentAge = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Students Page"),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  studentName.text = "";
                  studentAddress.text = "";
                  studentAge.text = "";
                },
                child: const Text("New")),
            ElevatedButton(
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    saveRecord();
                  }
                },
                child: const Text("Save"))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formGlobalKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: 250,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }
                },
                controller: studentName,
                decoration: const InputDecoration(labelText: "Name"),
              ),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: studentAddress,
                decoration: const InputDecoration(labelText: "Address"),
              ),
            ),
            SizedBox(
              width: 50,
              child: TextFormField(
                controller: studentAge,
                decoration: const InputDecoration(labelText: "Age"),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> saveRecord() async {
    try {
      Map<String, dynamic> body = {
        'student_name': studentName.text,
        'student_age': studentAge.text,
      };

      Uri url = Uri.parse("localhost:8080/student/create");

      final response = await http.post(
        url,
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
        body: jsonEncode(body),
      );

      Map<String, dynamic> data = jsonDecode(response.body);
      String msg = data["message"];
      if (msg.toLowerCase().contains("success")) {
        print("msg = $msg");
      } else {
        print("msg = $msg");
      }
    } catch (e) {
      print("msg = $e}");
    }
  }
}
