import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/features/auth/models/token_dto.dart';
import 'package:surf_practice_chat_flutter/features/auth/repository/auth_repository.dart';
import 'package:surf_practice_chat_flutter/features/chat/repository/chat_repository.dart';
import 'package:surf_practice_chat_flutter/features/chat/screens/chat_screen.dart';
import 'package:surf_practice_chat_flutter/ui/shared/ext.dart';
import 'package:surf_practice_chat_flutter/ui/shared/theme/app_colors_theme.dart';
import 'package:surf_practice_chat_flutter/ui/shared/theme/app_text_theme.dart';
import 'package:surf_practice_chat_flutter/ui/shared/widgets/custom_text_button.dart';
import 'package:surf_practice_chat_flutter/ui/shared/widgets/standart_button.dart';
import 'package:surf_practice_chat_flutter/ui/shared/widgets/standart_input.dart';
import 'package:surf_study_jam/surf_study_jam.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _controllerLogin =
      TextEditingController(text: 'petrfalkovsky');
  final TextEditingController _controllerPassword =
      TextEditingController(text: 'Bx1DeyIre0kg');

  void _pushToChat(BuildContext context, TokenDto token) {
    Navigator.push<ChatScreen>(
      context,
      MaterialPageRoute(
        builder: (_) {
          return ChatScreen(
            chatRepository: ChatRepository(
              StudyJamClient().getAuthorizedClient(token.token),
            ),
          );
        },
      ),
    );
  }

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
                  controller: _controllerLogin,
                ),
                16.h,
                StandartInput(
                    hintText: 'password', controller: _controllerPassword),
                16.h,
                CustomTextButton(
                  text: 'forgotPassword',
                  alignment: Alignment.centerLeft,
                  onPressed: () {},
                ),
                const Spacer(),
                StandartButton(
                  text: 'login',
                  onPress: () async {
                    final AuthRepository _authRepository =
                        AuthRepository(StudyJamClient());
                    TokenDto token = await _authRepository.signIn(
                        login: _controllerLogin.text,
                        password: _controllerPassword.text);

                    _pushToChat(context, token);
                  },
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
