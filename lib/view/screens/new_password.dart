import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reval/view/screens/log_in.dart';
import 'package:reval/view/screens/auth_service.dart';

class NewPasswordPage extends StatefulWidget {
  final String? oobCode; // Firebase out-of-band code for reset

  const NewPasswordPage({super.key, this.oobCode});

  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final AuthService _authService = AuthService();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmVisible = false;
  bool hasMinLength = false;
  bool hasNumber = false;
  bool hasUpperLower = false;
  String? _message;

  void validatePassword(String password) {
    setState(() {
      hasMinLength = password.length >= 8;
      hasNumber = RegExp(r'[0-9]').hasMatch(password);
      hasUpperLower = RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(password);
    });
  }

  Future<void> _resetPassword() async {
    final pass = passwordController.text;
    final confirm = confirmController.text;

    if (pass != confirm) {
      setState(() {
        _message = "Passwords do not match";
      });
      return;
    }

    if (!hasMinLength || !hasNumber || !hasUpperLower) {
      setState(() {
        _message = "Password does not meet criteria";
      });
      return;
    }

    // Update password using Firebase
    final success = await _authService.resetPassword(pass);
    if (success) {
      setState(() {
        _message = "Password reset successfully!";
      });
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const logIn()),
        );
      });
    } else {
      setState(() {
        _message = "Error resetting password. Please try again.";
      });
    }
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
        const SizedBox(width: 8),
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
      backgroundColor: const Color(0xFFEBE3DD),
      appBar: AppBar(
        backgroundColor: const Color(0xe8cb5e48),
        title: const Text(
          "Reset Password",
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
                const SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter New Password',
                        style: TextStyle(
                          color: const Color(0xe8cb5e48),
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
                const Text(
                  'This password should be different from the previous password',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xe8cb5e48), fontSize: 15),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    onChanged: validatePassword,
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'New Password',
                      labelStyle: const TextStyle(color: Color(0xe8cb5e48)),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: confirmController,
                    obscureText: !isConfirmVisible,
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Confirm Password',
                      labelStyle: const TextStyle(color: Color(0xe8cb5e48)),
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
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _resetPassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xe8cb5e48),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                if (_message != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      _message!,
                      style: TextStyle(
                        color:
                            _message!.contains('Error')
                                ? Colors.red
                                : Colors.green,
                        fontSize: 16,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const logIn()),
                      );
                    },
                    child: const Text(
                      'Back to Sign In',
                      style: TextStyle(
                        color: Color(0xe8cb5e48),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
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
