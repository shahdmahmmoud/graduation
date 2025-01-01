import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/otp_toggle.dart';
import '../../../components/phone_input_field.dart';
import '../../../theme/app_theme.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isEmailSelected = true;

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(23.0.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 98.h),
                      // Adjust the spacing as needed
                      Text(
                        'Forget Password',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 32.0.h),
                      Text(
                        'Which contact details should be\n used to reset your password?',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 32.0.h),
                      CustomToggle(
                        isEmailSelected: isEmailSelected,
                        onToggle: () {
                          setState(() {
                            isEmailSelected = !isEmailSelected;
                          });
                        },
                      ),
                      SizedBox(height: 32.h),
                      // Adjusted the spacing between toggle and text field
                      // Use a Container to wrap CustomTextField and PhoneInputField to ensure exact sizing
                      Container(
                        width: double.infinity,
                        child: isEmailSelected
                            ? CustomTextField(
                                hintText: 'Enter your email',
                                obscureText: false,
                                controller: emailController,
                              )
                            : PhoneInputField(
                                // Use the PhoneInputField widget
                                controller: phoneController,
                                hintText: 'Enter phone number',
                              ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.0.sp).copyWith(
                        bottom:
                            MediaQuery.of(context).viewInsets.bottom + 20.h),
                    child: CustomButton(
                      text: 'Send OTP',
                      onPressed: () {
                        // Handle OTP send logic
                        if (isEmailSelected) {
                          // Send OTP to email
                          print(
                              'Sending OTP to email: ${emailController.text}');
                        } else {
                          // Send OTP to phone number
                          print(
                              'Sending OTP to phone: ${phoneController.text}');
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
