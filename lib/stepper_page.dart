import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'global_page.dart';

class registration extends StatefulWidget {
  const registration({Key key}) : super(key: key);

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  final ImagePicker picker = ImagePicker();

  int initialStepValue = 0;
  File imgFile;
  TextStyle titleStyle = TextStyle(fontSize: 20, color: Colors.indigoAccent);
  DateTime initialDate = DateTime.now();
  String selectedDate = "";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper App"),
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
                  });
                },
                onStepContinue: () {
                  if (initialStepValue < 2 && formKey.currentState.validate()) {
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
                      (initialStepValue != 2)
                          ? ElevatedButton(
                              onPressed: details.onStepContinue,
                              child: Text("Next"))
                          : ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pushNamed('home_page');
                                });
                              },
                              child: Text("Add")),
                      SizedBox(width: 20),
                      (initialStepValue != 0)
                          ? OutlinedButton(
                              onPressed: details.onStepCancel,
                              child: Text("Cancel"))
                          : Container(),
                    ],
                  );
                },
                steps: [
                  Step(
                    state: StepState.editing,
                    title: Text("Registration"),
                    content: Padding(
                      padding: EdgeInsets.all(10),
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
                                  child: (imgFile != null)
                                      ? Text("")
                                      : Text("ADD"),
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                              Positioned(
                                top: 73,
                                left: 223,
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
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: name,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Please enter your name";
                              } else if (val.length < 2) {
                                return "Enter your full name";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.name = val;
                              });
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: "Full Name",
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Please enter your email address";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.email = val;
                              });
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.mark_email_read),
                              hintText: "Email Address",
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phone,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Please enter your phone number";
                              } else if (val.length != 10) {
                                return "Enter valid phone number";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.phone = val;
                              });
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.phone),
                              hintText: "Mobile Number",
                            ),
                          ),
                          SizedBox(height: 20),
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
                                      helpText: "Choose your destination date",
                                      confirmText: "confirm",
                                      cancelText: "Dismiss",
                                      selectableDayPredicate: (DateTime day) {
                                        if ((day.isBefore(DateTime.now()
                                            .add(Duration(days: 0))))) {
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
                                child: Text("Select Date")),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: address,
                            maxLines: 2,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Please enter your address";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.address = val;
                              });
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.home_filled),
                              hintText: "Full House Address",
                            ),
                          ),
                          TextFormField(
                            controller: pincode,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Please enter pincode";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.pincode = val;
                              });
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.pin),
                              hintText: "Pincode",
                            ),
                          ),
                          TextFormField(
                            controller: password,
                            obscureText: true,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Please enter your password";
                              } else if (val.length != 8) {
                                return "Enter valid password";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.password = val;
                              });
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.password_outlined),
                              hintText: "Password",
                            ),
                          ),
                          TextFormField(
                            controller: confirmPassword,
                            obscureText: true,
                            validator: (val) {
                              if (val.isEmpty)
                                return 'Please re-enter your password';
                              if (val != password.text)
                                return 'Password doesn\'t match';
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.confirmPassword = val;
                              });
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.password_sharp),
                              hintText: "Confirm Password",
                            ),
                          ),
                        ],
                      ),
                    ),
                    isActive: (initialStepValue >= 0) ? true : false,
                  ),
                  Step(
                      state: StepState.editing,
                      title: Text("Login"),
                      content: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Please enter your email address";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.email = val;
                              });
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.mark_email_read),
                              hintText: "Email Address",
                            ),
                          ),
                          TextFormField(
                            controller: password,
                            obscureText: true,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Please enter valid password";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.password = val;
                              });
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.password_outlined),
                              hintText: "Password",
                            ),
                          ),
                        ],
                      ),
                      isActive: (initialStepValue >= 1) ? true : false),
                  Step(
                      state: StepState.editing,
                      title: Text("Home"),
                      content: Text("Confirm?"),
                      isActive: (initialStepValue >= 2) ? true : false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
