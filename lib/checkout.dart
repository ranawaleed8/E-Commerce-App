import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Purchase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBE3DD),
      appBar: AppBar(
        backgroundColor: Color(0xe8cb5e48),
        title: const Text(
          "Shipping address",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Container(
                    //padding: EdgeInsets.all(12),
                    color: Color(0xFFFBF3C1),
                    child: Text(
                      'Please enter your real information.',
                      style: TextStyle(color: Color(0xe8cb5e48), fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Location*",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xe8cb5e48),
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    items:
                        ['Egypt', 'Saudi Arabia', 'UAE']
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(color: Color(0xe8cb5e48)),
                                ),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {},
                    value: 'Egypt',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 16),
                  buildTextField(
                    "First Name*",
                    "Please provide your real name for customs clearance",
                  ),
                  SizedBox(height: 16),
                  buildTextField(
                    "Last Name*",
                    "Please provide your real name for customs clearance",
                  ),
                  SizedBox(height: 16),
                  buildTextField(
                    "Phone Number*",
                    "EG +20  Need Correct Phone Number for delivery.",
                  ),
                  SizedBox(height: 16),
                  buildTextField("State/Province*", ""),
                  SizedBox(height: 16),
                  buildTextField("City*", ""),
                  SizedBox(height: 16),
                  buildTextField("Post/Zip Code*", ""),
                  SizedBox(height: 16),
                  buildTextField("Address Line 1*", ""),
                  SizedBox(height: 16),
                  buildTextField("Address Line 2*", ""),

                  SizedBox(height: 25),

                  // Sign In Button
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xe8cb5e48),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(String label, String hint, {Widget? prefix}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xe8cb5e48)),
      ),
      TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xe8cb5e48), fontSize: 13),
          prefix: prefix,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    ],
  );
}
