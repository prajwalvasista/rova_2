import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rova_2/utils/constants/colors.dart';

class GstVerification extends StatefulWidget {
  static const String appRoute = '/gst_verification';
  const GstVerification({super.key});

  @override
  State<GstVerification> createState() => _GstVerificationState();
}

class _GstVerificationState extends State<GstVerification> {
  int currentStep = 0;
  int selectedValue = 0;
  int selectedValue1 = 0;
  SizedBox defaultGap = const SizedBox(height: 15);
  final _formkey = GlobalKey<FormState>();
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
      ),
      body: Theme(
        data: ThemeData(
          // colorScheme: Theme.of(context).colorScheme.copyWith(
          //       primary: const Color.fromRGBO(119, 255, 116, 1),
          //     ),
          canvasColor: AppColors.primary,
        ),
        child: Stepper(
          steps: getSteps(),
          connectorThickness: 3,
          type: StepperType.horizontal,
          currentStep: currentStep,
          onStepContinue: () {
            _formkey.currentState!.validate();
            _formkey1.currentState!.validate();
            _formkey2.currentState!.validate();
            _formkey3.currentState!.validate();
            final lastStep = currentStep == getSteps().length - 1;
            if (lastStep) {
            } else {
              setState(() {
                currentStep++;
              });
            }
          },
          onStepCancel: () {
            setState(() {
              currentStep--;
            });
          },
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          title: const Text(""),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "GST Verification",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.headingColor,
                ),
              ),
              defaultGap,
              RadioListTile(
                value: 0,
                groupValue: selectedValue,
                title: const Text(
                  "I have a GST no.",
                  style: TextStyle(
                    color: AppColors.headingColor,
                  ),
                ),
                onChanged: ((value) {
                  setState(() {
                    selectedValue = value!;
                  });
                }),
              ),
              Form(
                key: _formkey,
                child: TextFormField(
                  validator: (value) {
                    RegExp gstPattern = RegExp(
                        r'\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}');
                    if (value == null || value.isEmpty) {
                      return "Please enter GST number";
                    }
                    if (!gstPattern.hasMatch(value)) {
                      return "Please enter correct GST number";
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Enter GST no.",
                    hintStyle: const TextStyle(
                      color: AppColors.hintTextColor,
                      fontSize: 16,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: AppColors.teftFieldBorderColor,
                      ),
                    ),
                  ),
                ),
              ),
              RadioListTile(
                value: 1,
                groupValue: selectedValue,
                title: const Text(
                  "I don't have a GST no.",
                  style: TextStyle(
                    color: AppColors.headingColor,
                  ),
                ),
                onChanged: ((value) {
                  setState(() {
                    selectedValue = value!;
                  });
                }),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          title: const Text(""),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "PAN No.",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.headingColor,
                ),
              ),
              defaultGap,
              const Text(
                "Enter Your PAN No",
                style: TextStyle(
                  color: AppColors.headingColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              defaultGap,
              Form(
                key: _formkey1,
                child: TextFormField(
                  validator: (value) {
                    RegExp validatePan = RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]{1}');
                    if (value == null || value.isEmpty) {
                      return "Enter Your PAN Number";
                    }
                    if (!validatePan.hasMatch(value)) {
                      return "Enter correct PAN Number";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: AppColors.teftFieldBorderColor,
                      ),
                    ),
                  ),
                ),
              ),
              defaultGap,
              const Text(
                "Upload PAN document",
                style: TextStyle(
                  color: AppColors.headingColor,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
                  backgroundColor: MaterialStatePropertyAll(
                    AppColors.teftFieldBorderColor,
                  ),
                ),
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();
                  await imagePicker.pickImage(source: ImageSource.gallery);
                },
                child: const Text(
                  "Upload",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text(""),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Store Name",
                style: TextStyle(
                  color: AppColors.headingColor,
                  fontSize: 20,
                ),
              ),
              defaultGap,
              const Text(
                "Enter Your Store Name",
                style: TextStyle(
                  color: AppColors.headingColor,
                ),
              ),
              defaultGap,
              Form(
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: AppColors.teftFieldBorderColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 3,
          title: const Text(""),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "PickUp Address",
                style: TextStyle(
                  color: AppColors.headingColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Pin Code",
                style: TextStyle(
                  color: AppColors.tertiary,
                ),
              ),
              const SizedBox(height: 10),
              Form(
                key: _formkey2,
                child: TextFormField(
                  validator: (value) {
                    RegExp pinCodeValidate = RegExp(r'^[1-9][0-9]{5}$');
                    if (value == null || value.isEmpty) {
                      return "Enter Pin code";
                    }
                    if (!pinCodeValidate.hasMatch(value)) {
                      return "Enter correct pin code";
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.teftFieldBorderColor,
                      ),
                    ),
                  ),
                ),
              ),
              defaultGap,
              const Text(
                "City",
                style: TextStyle(
                  color: AppColors.tertiary,
                ),
              ),
              const SizedBox(height: 10),
              Form(
                key: _formkey3,
                child: TextFormField(
                  validator: (value) {
                    RegExp cityValidate =
                        RegExp(r'^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$');
                    if (value == null || value.isEmpty) {
                      return "Enter City name";
                    }
                    if (!cityValidate.hasMatch(value)) {
                      return "Please enter correct city ";
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.teftFieldBorderColor,
                      ),
                    ),
                  ),
                ),
              ),
              defaultGap,
              const Text(
                "State",
                style: TextStyle(
                  color: AppColors.tertiary,
                ),
              ),
              const SizedBox(height: 10),
              Form(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.teftFieldBorderColor,
                      ),
                    ),
                  ),
                ),
              ),
              defaultGap,
              const Text(
                "Area,Street,Building no.",
                style: TextStyle(
                  color: AppColors.tertiary,
                ),
              ),
              const SizedBox(height: 10),
              Form(
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  minLines: 3,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.teftFieldBorderColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 4,
          title: const Text(""),
          content: Column(
            children: [
              const Text(
                "Choose Shipping Preferences",
                style: TextStyle(
                  color: AppColors.headingColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              defaultGap,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: RadioListTile(
                    title: const Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "You Store,Rova Shipping(Easy ship)",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.headingColor,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: const Text(
                      "You store and pack orders at you location.\n We pick them and deliver to customers",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.subtitleColor,
                      ),
                    ),
                    value: 0,
                    groupValue: selectedValue1,
                    onChanged: (value) {
                      setState(() {
                        selectedValue1 = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: RadioListTile(
                    title: const Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "You Store,(Easy ship)",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.headingColor,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: const Text(
                      "You store and pack orders at you location.\n We pick them and deliver to customers",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.subtitleColor,
                      ),
                    ),
                    value: 1,
                    groupValue: selectedValue1,
                    onChanged: (value) {
                      setState(() {
                        selectedValue1 = value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ];
}
