import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practical_ahmd/utility/utility.dart';
import 'package:practical_ahmd/widgets/app_text_field.dart';
import 'package:practical_ahmd/widgets/comman_button_widget.dart';

// import 'package:yousearch/widgets/text_field_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final dateController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final positionController = TextEditingController();
  final descriptionController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  bool status = false;
  bool switchValue = false;
  String? selectedGender;
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
                  // AppTextField(
                  //   enabled: !switchValue,
                  //   textColor: switchValue ? AppColors.red : AppColors.blue1,
                  //   onChanged: (value) {},
                  //   validator: (value) {
                  //     return null;

                  //     // if (value == null || value.isEmpty) {
                  //     //   return context.l10n.enterUserName;
                  //     // }
                  //     // return null;
                  //   },
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  //   controller: userNameController,
                  //   hintText: context.l10n.enterUserName,
                  //   labelText: context.l10n.username,
                  //   textInputAction: TextInputAction.next,
                  //   labelStyle: TextStyle(color: AppColors.grey2),
                  //   inputTextStyle: TextStyle(
                  //       color: switchValue ? AppColors.grey2 : AppColors.black),
                  //   customBorder: InputBorder.none,
                  //   suffix: !switchValue
                  //       ? const Icon(
                  //           Icons.edit,
                  //           size: 15,
                  //         )
                  //       : null,
                  // ),
                  const Divider(
                    height: 7,
                    thickness: 3,
                    color: Colors.grey,
                  ),
                  // AppTextField(
                  //   labelStyle: TextStyle(color: AppColors.grey2),
                  //   onChanged: (value) {},
                  //   enabled: false,
                  //   onTap: () {
                  //     Utility.openDatePicker(
                  //       context: context,
                  //       onSelect: (date) {
                  //         dateController.text = date.toString();
                  //         notify();
                  //       },
                  //     );
                  //   },
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  //   controller: dateController,
                  //   hintText: context.l10n.enterDateOfBirth,
                  //   labelText: context.l10n.dateOfBirth,
                  //   textInputAction: TextInputAction.next,
                  //   customBorder: InputBorder.none,
                  //   suffix: const Icon(
                  //     Icons.edit,
                  //     size: 15,
                  //   ),
                  // ),
                  const Divider(
                    height: 7,
                    thickness: 3,
                    color: Colors.grey,
                  ),
                  // AppTextField(
                  //   labelStyle: TextStyle(color: AppColors.grey2),
                  //   enabled: true,
                  //   onChanged: (value) {},
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  //   controller: phoneNumberController,
                  //   hintText: context.l10n.enterPhoneNumber,
                  //   labelText: context.l10n.phoneNumber,
                  //   customBorder: InputBorder.none,
                  //   textInputAction: TextInputAction.next,
                  //   suffix: const Icon(
                  //     Icons.edit,
                  //     size: 15,
                  //   ),
                  // ),
                  const Divider(
                    height: 7,
                    thickness: 3,
                    color: Colors.grey,
                  ),
                  // AppTextField(
                  //   labelStyle: TextStyle(color: AppColors.grey2),
                  //   onChanged: (value) {},
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  //   controller: emailController,
                  //   validator: (value) {
                  //     if (value != null &&
                  //         value.trim() != '' &&
                  //         !Utility.isValidEmail(value)) {
                  //       return context.l10n.enterValidEmail;
                  //     }

                  //     return null;
                  //   },
                  //   hintText: context.l10n.enterEmailAddress,
                  //   labelText: context.l10n.emailAddress,
                  //   customBorder: InputBorder.none,
                  //   textInputAction: TextInputAction.next,
                  //   suffix: const Icon(
                  //     Icons.edit,
                  //     size: 15,
                  //   ),
                  // ),
                  const Divider(
                    height: 7,
                    thickness: 3,
                    color: Colors.grey,
                  ),

                  // AppTextField(
                  //   labelStyle: TextStyle(color: AppColors.grey2),
                  //   onTap: () async {
                  //     isLoading.value = true;
                  //     LatLng? mylocation;
                  //     await Utility.getCurrentLocation((latlng) {
                  //       mylocation = latlng;
                  //     }).whenComplete(() {
                  //       isLoading.value = false;
                  //     });

                  //     if (mylocation != null && !isLoading.value) {
                  //       final list = await Navigator.push<List<dynamic>>(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => SetYourPositionScreen(
                  //             isFirstTime: false,
                  //             currentLatLang: LatLng(
                  //               mylocation?.latitude ?? 00,
                  //               mylocation?.longitude ?? 00,
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //       try {
                  //         GeoData? currentLatLang = list?[0] as GeoData?;
                  //         if (currentLatLang != null) {
                  //           mylocation = LatLng(currentLatLang.latitude,
                  //               currentLatLang.longitude);
                  //           positionController.text = currentLatLang.address;
                  //           notify();
                  //         }
                  //       } catch (e) {}
                  //     }
                  //   },
                  //   onChanged: (value) {},
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  //   controller: positionController,
                  //   hintText: context.l10n.enterYourPosition,
                  //   labelText: context.l10n.position,
                  //   customBorder: InputBorder.none,
                  //   textInputAction: TextInputAction.next,
                  //   suffix: const Icon(
                  //     Icons.edit,
                  //     size: 15,
                  //   ),
                  // ),
                  const Divider(
                    height: 7,
                    thickness: 3,
                    color: Colors.grey,
                  ),
                  // AppTextField(
                  //   labelStyle: TextStyle(color: AppColors.grey2),
                  //   onChanged: (value) {},
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 15,
                  //     vertical: 5,
                  //   ),
                  //   controller: descriptionController,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return context.l10n.enterDescription;
                  //     }
                  //     return null;
                  //   },
                  //   hintText: context.l10n.enterDescription,
                  //   labelText: context.l10n.description,
                  //   customBorder: InputBorder.none,
                  //   textInputAction: TextInputAction.newline,
                  //   suffix: const Icon(
                  //     Icons.edit,
                  //     size: 15,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
            ),
            child: CommonButtonWidget(
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
