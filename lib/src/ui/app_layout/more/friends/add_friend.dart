
import 'package:engagementwallet/src/logic/bloc/auth_bloc/form_validator_bloc/form_validator_bloc.dart';
import 'package:engagementwallet/src/logic/bloc/auth_bloc/validation_bloc.dart';
import 'package:engagementwallet/src/logic/mixin/friends_mixin/friends_mixin.dart';
import 'package:engagementwallet/src/utils/colors.dart';
import 'package:engagementwallet/src/utils/navigationWidget.dart';
import 'package:engagementwallet/src/utils/sized_boxes.dart';
import 'package:engagementwallet/src/widgets/custom_button.dart';
import 'package:engagementwallet/src/widgets/textforms/editText.dart';
import 'package:engagementwallet/values/padding.dart';
import 'package:engagementwallet/values/text_styles.dart';
import 'package:flutter/material.dart';

class AddFriend extends StatefulWidget {
  const AddFriend({Key? key}) : super(key: key);


  @override
  State<AddFriend> createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  final validator = ValidationBloc();
  TextEditingController usernameCC = TextEditingController();
  @override
  void dispose() {
    validator.dispose();
    usernameCC.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    FriendsMixin friend = FriendsMixin.friendProvider(context, listen: true);

    return Column(
      children: [
        Padding(
          padding: defaultVHPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => popView(context),
                child: Icon(
                  Icons.cancel,
                  color: greyColor,
                ),
              ),
              Text('My Friends',
                  style: textStyleBig.copyWith(fontSize: 26)),
              Icon(
                Icons.cancel,
                color: whiteColor,
              )
            ],
          ),
        ),
        Divider(
          thickness: 0.8,
          height: 15,
          color: greyColor,
        ),
        Padding(
          padding: defaultVHPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: const Text(
                  'Provide a valid username. This would ensure identity verification.',
                  textAlign: TextAlign.center,
                ),
              ),
              kSmallHeight,
              Column(
                children: [
                  EditTextSignUp(
                    text: 'Username',
                    controller: usernameCC,
                    textInputType: TextInputType.text,
                    validatorCallback: formValidatorBloc.userNameValidator,
                    onChangedCallback: validator.changeUserName,
                    labelText: "@placeholder",
                  ),
                ],
              ),
              kVeryLargeHeight,
              CustomButton(
                  text: "SEARCH",
                  onPressed: () {
                    friend.setFriendList({"userName": usernameCC.text, "name":  usernameCC.text});
                    popView(context);
                  }
              ),

            ],
          ),
        )
      ],
    );
  }
}
