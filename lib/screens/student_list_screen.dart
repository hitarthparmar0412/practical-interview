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
        body: ListView.builder(
            itemBuilder: ((context, index) => StudentItemview(
                  doctorName: 'Hitarth',
                  doctorNumber: '4545',
                  onTap: () {},
                  pricriptionNumber: '151521',
                  url: '',
                  isDoctorList: false,
                ))));
  }
}
