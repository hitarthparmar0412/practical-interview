import 'package:flutter/material.dart';
import 'package:practical_ahmd/widgets/student_list_item_view.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          'Student list screen',
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        itemCount: 10,
        separatorBuilder: ((context, index) => const SizedBox(height: 10)),
        itemBuilder: ((context, index) => StudentItemview(
              studentName: 'Hitarth',
              subjectBMarks: '4545',
              onTap: () {},
              subjectAMarks: '151521',
              url:
                  'https://images.unsplash.com/photo-1660798027105-5da8ad164e27?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3R1ZGVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            
            )),
      ),
    );
  }
}
