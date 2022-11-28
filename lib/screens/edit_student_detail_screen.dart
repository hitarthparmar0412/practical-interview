import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practical_ahmd/utility/utility.dart';
import 'package:practical_ahmd/widgets/app_text_field.dart';
import 'package:practical_ahmd/widgets/comman_button_widget.dart';

// import 'package:yousearch/widgets/text_field_widget.dart';

class EditStudentProfileScreen extends StatefulWidget {
  const EditStudentProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditStudentProfileScreen> createState() =>
      _EditStudentProfileScreenState();
}

class _EditStudentProfileScreenState extends State<EditStudentProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final subjectAController = TextEditingController();
  final subjectBController = TextEditingController();
  final subjectCController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  bool status = false;
  bool switchValue = false;

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  ValueNotifier<String?> profileImage = ValueNotifier<String?>('');
  ValueNotifier<File?> profileImageFile = ValueNotifier<File?>(null);

  @override
  void initState() {
    super.initState();
  }

  notify() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, bottom: 40, top: 25),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_sharp,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  'Add Student',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () async {
                              final image = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              if (image?.path != null) {
                                profileImageFile.value = File(image!.path);
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: ValueListenableBuilder<File?>(
                                    valueListenable: profileImageFile,
                                    builder: ((context, value, child) {
                                      if (value != null) {
                                        return Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: FileImage(
                                                value,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      }

                                      return SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Utility.imageLoader(
                                            url: (switchValue)
                                                ? ""
                                                : '', //user?.imageUrl ?? '',
                                            placeholder: '',
                                            fit: BoxFit.cover,
                                            context: context),
                                      );
                                    }),
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[200],
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Text(
                        'Student info',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  AppTextField(
                    onChanged: (value) {},
                    controller: fullNameController,
                    hintText: 'Enter name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter full name';
                      }
                      return null;
                    },
                    labelText: 'Full name',
                    labelStyle: const TextStyle(color: Colors.grey),
                    customBorder: InputBorder.none,
                    textInputAction: TextInputAction.next,
                    suffix: const Icon(
                      Icons.edit,
                      size: 15,
                    ),
                  ),
                  const Divider(
                    height: 7,
                    thickness: 3,
                    color: Colors.grey,
                  ),
                  AppTextField(
                    textColor: Colors.grey,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter subject a marks';
                      }
                      return null;
                    },
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    controller: subjectAController,
                    hintText: 'Enter subject A marks',
                    labelText: 'Subject A',
                    textInputAction: TextInputAction.next,
                    labelStyle: const TextStyle(color: Colors.grey),
                    inputTextStyle: const TextStyle(color: Colors.grey),
                    customBorder: InputBorder.none,
                    suffix: const Icon(
                      Icons.edit,
                      size: 15,
                    ),
                  ),
                  const Divider(
                    height: 7,
                    thickness: 3,
                    color: Colors.grey,
                  ),
                  AppTextField(
                    textColor: Colors.grey,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter subject a marks';
                      }
                      return null;
                    },
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    controller: subjectBController,
                    hintText: 'Enter subject B marks',
                    labelText: 'Subject B',
                    textInputAction: TextInputAction.next,
                    labelStyle: const TextStyle(color: Colors.grey),
                    inputTextStyle: const TextStyle(color: Colors.grey),
                    customBorder: InputBorder.none,
                    suffix: const Icon(
                      Icons.edit,
                      size: 15,
                    ),
                  ),
                  const Divider(
                    height: 7,
                    thickness: 3,
                    color: Colors.grey,
                  ),
                  AppTextField(
                    textColor: Colors.grey,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter subject a marks';
                      }
                      return null;
                    },
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    controller: subjectCController,
                    hintText: 'Enter subject C marks',
                    labelText: 'Subject C',
                    textInputAction: TextInputAction.next,
                    labelStyle: const TextStyle(color: Colors.grey),
                    inputTextStyle: const TextStyle(color: Colors.grey),
                    customBorder: InputBorder.none,
                    suffix: const Icon(
                      Icons.edit,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const Divider(
                    height: 7,
                    thickness: 3,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
          CommonButtonWidget(
            innerPaddding: const EdgeInsets.all(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 11,
                offset: const Offset(0, 5),
              ),
            ],
            text: 'Set',
            fontSize: 15,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                // profileApiCall();
              }
            },
          ),
          ValueListenableBuilder<bool>(
            builder: (context, value, child) {
              if (value) {
                return Align(
                  alignment: Alignment.center,
                  child: Utility.progress(),
                );
              }
              return const SizedBox();
            },
            valueListenable: isLoading,
          )
        ],
      ),
    );
  }
}
