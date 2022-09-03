import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dr_jadoo/constants/assets.dart';
import 'package:dr_jadoo/constants/colours.dart';
import 'package:dr_jadoo/constants/strings.dart';
import 'package:dr_jadoo/core/popup_service.dart';
import 'package:dr_jadoo/routes/router.gr.dart';
import 'package:dr_jadoo/services/login_service.dart';
import 'package:dr_jadoo/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> onBoardingFormKey = GlobalKey<FormState>();
  bool obscureText = true;

  // controllers and nodes for textfield
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
              width: screenWidth * 0.60,
              child: Stack(
              children: [
                const Image(image: AssetImage(Assets.jadooLogin),),
                Positioned(
                  left: screenWidth * 0.02,
                  top: screenHeight * 0.01,
                  child: const Image(image: AssetImage(Assets.jadooLogoSmall))
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth * 0.40,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.12,
                ),
                Text(
                  AppStrings.welcomeText,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!.copyWith(
                        fontWeight: FontWeight.bold
                      )
                ),
                Stack(
                  children: [
                    Text(
                      AppStrings.welcomeInstructionText,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!.copyWith(
                            color: AppColors.grey
                          )
                    ),
                    const Positioned(
                      child: Image(image: AssetImage(Assets.pointer))
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: screenHeight * 0.045),
                  child: CustomTextFormField(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Image(
                        image: AssetImage(Assets.account),
                        height: 35,
                        width: 35,
                      ),
                    ),
                    controller: usernameController,
                    focusNode: usernameFocusNode,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return AppStrings.pleaseEnterValidEmail;
                      }
                    },
                    hintText: AppStrings.email,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02),
                  child: CustomTextFormField(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Image(
                        image: AssetImage(Assets.password),
                        height: 35,
                        width: 35,
                      ),
                    ),
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    obscureText: obscureText,
                    suffixIcon: IconButton(
                      icon: Icon(obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return AppStrings.pleaseEnterValidPassword;
                      }
                    },
                    hintText: AppStrings.password,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    width: screenWidth * 0.4,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {if (await LoginService.instance
                              .logIn(context, usernameController.text, passwordController.text)) {
                            popupsService.showFlushBar(
                              context, 
                              "Login Success!", 
                              icon: Icons.check,
                              backgroundColor: AppColors.success,
                              flushbarPosition: FlushbarPosition.TOP);
                            AutoRouter.of(context).push(EmployeeDashboardRoute());
                          } else {
                            popupsService.showFlushBar(
                              context, 
                              "Login Failed!",
                              flushbarPosition: FlushbarPosition.TOP);
                          }
                        },
                        child: Text(
                          AppStrings.login.toUpperCase(),
                          style: Theme.of(context)
                            .textTheme
                            .subtitle1!.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400
                            )
                        )
                      ),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      AppStrings.forgetYourPassword,
                      style: Theme.of(context)
                        .textTheme
                        .subtitle1!.copyWith(
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor
                        )
                    )
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
