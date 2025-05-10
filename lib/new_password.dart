import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmVisible = false;

  bool hasMinLength = false;
  bool hasNumber = false;
  bool hasUpperLower = false;

  void validatePassword(String password) {
    setState(() {
      hasMinLength = password.length >= 8;
      hasNumber = RegExp(r'[0-9]').hasMatch(password);
      hasUpperLower = RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(password);
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  Widget buildValidationText(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.cancel,
          color: isValid ? Colors.green : Colors.red,
          size: 18,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isValid ? Colors.green : Colors.red,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBE3DD),
      appBar: AppBar(
        backgroundColor: Color(0xe8cb5e48),
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Please check your email',
                        style: TextStyle(
                          color: Color(0xe8cb5e48),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          shadows: [
                            Shadow(
                              blurRadius: 4,
                              color: Colors.black26,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'This password should be different from the previous password',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xe8cb5e48), fontSize: 15),
                ),
                const SizedBox(height: 30),

                /// New Password Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    onChanged: validatePassword,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'New Password',
                      labelStyle: TextStyle(color: Color(0xe8cb5e48)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                /// Confirm Password Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: confirmController,
                    obscureText: !isConfirmVisible,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Color(0xe8cb5e48)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isConfirmVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isConfirmVisible = !isConfirmVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Validation Indicators
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildValidationText(
                        "At least 8 characters",
                        hasMinLength,
                      ),
                      buildValidationText("At least 1 number", hasNumber),
                      buildValidationText(
                        "Both upper and lower case letters",
                        hasUpperLower,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// Reset Button
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final pass = passwordController.text;
                        final confirm = confirmController.text;

                        if (pass != confirm) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Passwords do not match")),
                          );
                        } else if (!hasMinLength ||
                            !hasNumber ||
                            !hasUpperLower) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Password does not meet criteria"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Password reset successfully!"),
                            ),
                          );
                          // Navigate or perform reset logic
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xe8cb5e48),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Reset Password',
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
    );
  }
}
