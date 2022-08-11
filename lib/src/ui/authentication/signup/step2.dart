import 'package:engagementwallet/src/logic/bloc/auth_bloc/form_validator_bloc/form_validator_bloc.dart';
import 'package:engagementwallet/src/logic/bloc/auth_bloc/validation_bloc.dart';
import 'package:engagementwallet/src/logic/mixin/auth_mixin/auth_mixin.dart';
import 'package:engagementwallet/src/logic/models/mock_data.dart';
import 'package:engagementwallet/src/ui/authentication/signup/step3.dart';
import 'package:engagementwallet/src/utils/colors.dart';
import 'package:engagementwallet/src/utils/functions.dart';
import 'package:engagementwallet/src/utils/navigationWidget.dart';
import 'package:engagementwallet/src/utils/sized_boxes.dart';
import 'package:engagementwallet/src/widgets/backgrounds/authentication_backgrounds.dart';
import 'package:engagementwallet/src/widgets/custom_button.dart';
import 'package:engagementwallet/src/widgets/dialogs/dialogs.dart';
import 'package:engagementwallet/src/widgets/dropdown/dropdown.dart';
import 'package:engagementwallet/src/widgets/pin_widgets/create_pin.dart';
import 'package:engagementwallet/src/widgets/textforms/editText.dart';
import 'package:engagementwallet/src/widgets/textforms/passwordTextform.dart';
import 'package:engagementwallet/values/assets.dart';
import 'package:engagementwallet/values/padding.dart';
import 'package:engagementwallet/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Step2 extends StatefulWidget {
  const Step2(
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
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
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
                  'Step 2 of 4',
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
                        EditTextSignUp(
                          text: 'Date of Birth',
                          onChangedCallback: validator.changePassword,
                          controller: passwordController,
                          textInputType: TextInputType.datetime,
                          labelText: 'dd/mm/yyyy',
                          enabled: true,
                          suffix: Icon(Icons.calendar_today, color: secondaryColor,),
                          onTap: () => dateFilter(context),
                        ),
                        kNormalHeight,
                        EditTextSignUp(
                          text: 'Occupation',
                          validatorCallback: formValidatorBloc.emailValidator,
                          onChangedCallback: validator.changeEmailOnly,
                          controller: occupationController,
                          textInputType: TextInputType.emailAddress,
                          labelText: "Occupation",
                         
                        ),
                        kNormalHeight,

                        DropDown(
                          onTap: () => bottomSheet(context, 'gender'),
                          text: "Gender",
                        ),
                        kNormalHeight,
                        DropDown(
                          onTap: () => bottomSheet(context, 'category'),
                          text: "State of Residence",
                        ),
                        kNormalHeight,
                        DropDown(
                          onTap: () => bottomSheet(context, 'category'),
                          text: "Local Government Area",
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
                  navigate(context,  Step3(lastName: widget.lastName, emailAddress: widget.emailAddress, firstName: widget.firstName,));

                }),

          ],
        ),
      ),
    );
  }
}
