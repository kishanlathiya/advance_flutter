import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker picker = ImagePicker();
  int initialStepValue = 0;
  File imgFile;
  TextStyle titleStyle = const TextStyle(fontSize: 20, color: Colors.indigoAccent);
  DateTime initialDate = DateTime.now();
  String selectedDate = "";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Your Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Stepper(
                currentStep: initialStepValue,
                onStepTapped: (val) {
                  setState(() {
                    initialStepValue = val;
                    print(initialStepValue);
                  });
                },
                onStepContinue: () {
                  if (initialStepValue < 3 && formKey.currentState.validate()) {
                    setState(() {
                      ++initialStepValue;
                    });
                  }
                },
                onStepCancel: () {
                  if (initialStepValue > 0) {
                    setState(() {
                      --initialStepValue;
                    });
                  }
                },
                controlsBuilder: (context, details) {
                  return Row(
                    children: [
                      (initialStepValue != 3)
                          ? ElevatedButton(
                              onPressed: details.onStepContinue,
                              child: const Text("Next"))
                          : ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pushNamed('temp_page');
                                });
                              },
                              child: const Text("Add")),
                      const SizedBox(width: 20),
                      (initialStepValue != 0)
                          ? OutlinedButton(
                              onPressed: details.onStepCancel,
                              child: const Text("Cancel"))
                          : Container(),
                    ],
                  );
                },
                steps: [
                  Step(
                    state: StepState.editing,
                    title: const Text("Profile Photo"),
                    content: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: CircleAvatar(
                                  backgroundImage: (imgFile != null)
                                      ? FileImage(imgFile)
                                      : null,
                                  radius: 60,
                                  backgroundColor: Colors.grey,
                                  child: (imgFile != null)
                                      ? const Text("")
                                      : const Text("ADD"),
                                ),
                              ),
                              Positioned(
                                top: 70,
                                left: 220,
                                child: FloatingActionButton(
                                  onPressed: () async {
                                    XFile image = await picker.pickImage(
                                        source: ImageSource.camera);
                                    setState(() {
                                      imgFile = File(image.path);
                                      Global.myImage = imgFile;
                                    });
                                  },
                                  mini: true,
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isActive: (initialStepValue >= 0) ? true : false,
                  ),
                  Step(
                      state: StepState.editing,
                      title: const Text("Account"),
                      content: Column(
                        children: [
                          TextFormField(
                            controller: name,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Please enter your name";
                              } else if (val.length < 2) {
                                return "Enter full name";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.name = val;
                              });
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: "Full Name",
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "please enter  email address";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.email = val;
                              });
                            },
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.mark_email_read),
                              hintText: "Email address",
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phone,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "please enter  phone no";
                              } else if (val.length != 10) {
                                return "enter valid length phone no...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.phone = val;
                              });
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.phone),
                              hintText: "Mobile number",
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                      isActive: (initialStepValue >= 1) ? true : false),
                  Step(
                      state: StepState.editing,
                      title: const Text("DOB"),
                      content: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Date", style: titleStyle),
                              Text("$selectedDate", style: titleStyle),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  DateTime pickerDate = await showDatePicker(
                                      context: context,
                                      initialDate: initialDate,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2030),
                                      initialDatePickerMode: DatePickerMode.day,
                                      initialEntryMode:
                                          DatePickerEntryMode.calendarOnly,
                                      helpText: "Choose your DOB",
                                      confirmText: "confirm",
                                      cancelText: "Dismiss",
                                      selectableDayPredicate: (DateTime day) {
                                        if (
                                            (day.isBefore(DateTime.now()
                                                .add(const Duration(days: 0))))) {
                                          return true;
                                        }
                                        return false;
                                      });
                                  setState(() {
                                    if (pickerDate != null) {
                                      selectedDate =
                                          "${pickerDate.day}/${pickerDate.month}/${pickerDate.year}";
                                    }
                                  });
                                },
                                child: const Text("Add DOB")),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                      isActive: (initialStepValue >= 2) ? true : false),
                  Step(
                      state: StepState.editing,
                      title: const Text("Address"),
                      content: Column(
                        children: [
                          TextFormField(
                            controller: address,
                            maxLines: 3,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "please enter  address";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.address = val;
                              });
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.home_filled),
                              hintText: "Full House Address",
                            ),
                          ),
                          TextFormField(
                            controller: pincode,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "please enter valid pincode";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.pincode = val;
                              });
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.pin),
                              hintText: "Pincode",
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                      isActive: (initialStepValue >= 3) ? true : false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
