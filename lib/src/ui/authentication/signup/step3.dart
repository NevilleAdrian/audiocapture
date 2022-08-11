import 'package:engagementwallet/src/logic/bloc/auth_bloc/validation_bloc.dart';
import 'package:engagementwallet/src/logic/mixin/auth_mixin/auth_mixin.dart';
import 'package:engagementwallet/src/ui/authentication/signup/security_setup.dart';
import 'package:engagementwallet/src/utils/functions.dart';
import 'package:engagementwallet/src/utils/navigationWidget.dart';
import 'package:engagementwallet/src/utils/sized_boxes.dart';
import 'package:engagementwallet/src/widgets/backgrounds/authentication_backgrounds.dart';
import 'package:engagementwallet/src/widgets/custom_button.dart';
import 'package:engagementwallet/src/widgets/dropdown/dropdown.dart';
import 'package:engagementwallet/values/padding.dart';
import 'package:engagementwallet/values/text_styles.dart';
import 'package:flutter/material.dart';

class Step3 extends StatefulWidget {
  const Step3(
      {Key? key,
        required this.firstName,
        required this.lastName,
        required this.emailAddress, this.image})
      : super(key: key);

  final String firstName;
  final String lastName;
  final String emailAddress;
  final String? image;

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  //validation boolean
  bool autoValidate = false;
  final validator = ValidationBloc();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController occupationController = TextEditingController();


  @override
  void dispose() {
    validator.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationBackGround(
      height: 1.2,
      padding: EdgeInsets.zero,
      childPadding: defaultHPadding,
      child: ListView(
        shrinkWrap: true,
        children: [

          Padding(
            padding: defaultVHPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Step 3 of 4',
                  style: textStyleSecondary,
                ),
                kSmallHeight,

                Text(
                  'Let’s Know You Better',
                  style: textStyleBig.copyWith(fontSize: 26),
                ),
                kSmallHeight,
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 220),
                  child: Text(
                    'Create password, to protect your account.',
                    style: textStyle400Small,
                  ),
                ),
                kLargeHeight,
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        DropDown(
                          onTap: () => bottomSheet(context, 'category'),
                          text: "Tribe",
                        ),
                        kNormalHeight,
                        DropDown(
                          onTap: () => bottomSheet(context, 'category'),
                          text: "Language Spoken",
                        ),
                        kNormalHeight,
                        DropDown(
                          onTap: () => bottomSheet(context, 'category'),
                          text: "Native Languages",
                        ),
                        kNormalHeight,
                        DropDown(
                          onTap: () => bottomSheet(context, 'category'),
                          text: "Highest Level of Education",
                        ),
                        kNormalHeight,
                        DropDown(
                          onTap: () => bottomSheet(context, 'category'),
                          text: "Employment Status",
                        ),
                        kNormalHeight,
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
      secondChild: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
                text: "CONTINUE",
                loader: AuthMixin.auth(context, listen: true).isLoading,
                onPressed: ()  {
                  navigate(
                    context,
                    SecuritySetup(
                      firstName: widget.firstName,
                      emailAddress: widget.emailAddress,
                      lastName: widget.lastName,
                    ),
                  );

                }),

          ],
        ),
      ),
    );
  }
}
