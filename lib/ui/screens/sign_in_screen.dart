import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/ui/shared/ext.dart';
import 'package:surf_practice_chat_flutter/ui/shared/theme/app_colors_theme.dart';
import 'package:surf_practice_chat_flutter/ui/shared/theme/app_text_theme.dart';
import 'package:surf_practice_chat_flutter/ui/shared/widgets/custom_text_button.dart';
import 'package:surf_practice_chat_flutter/ui/shared/widgets/standart_button.dart';
import 'package:surf_practice_chat_flutter/ui/shared/widgets/standart_input.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StandartInput(
                  hintText: 'email',
                  // onChanged: () {},
                ),
                16.h,
                StandartInput(
                  hintText: 'password',
                  // onChanged: () {},
                ),
                16.h,
                CustomTextButton(
                  text: 'forgotPassword',
                  alignment: Alignment.centerLeft,
                  onPressed: () {},
                ),
                const Spacer(),
                StandartButton(
                  text: 'login',
                  onPress: () {},
                  isActive: true,
                ),
                24.h,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${'doNotHaveAnAccount'}  ',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      TextSpan(
                        text: 'registration',
                        style: Theme.of(context).appTextTheme.b2_1.copyWith(
                            color: Theme.of(context)
                                .appColorsScheme
                                .colors
                                .accent
                                .accent1),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                45.h,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
