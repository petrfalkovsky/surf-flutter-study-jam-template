import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surf_practice_chat_flutter/ui/shared/theme/app_colors_theme.dart';
import 'package:surf_practice_chat_flutter/ui/shared/theme/app_text_theme.dart';

class StandartButton extends StatelessWidget {
  const StandartButton(
      {required this.text,
      required this.isActive,
      this.color,
      this.isOutlined = false,
      this.isLoading = false,
      this.padding,
      this.width,
      required this.onPress,
      Key? key})
      : super(key: key);

  final String text;
  final bool isActive;
  final bool isOutlined;
  final bool isLoading;
  final VoidCallback onPress;
  final EdgeInsets? padding;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width,
      child: isOutlined
          ? _CustomOutlinaButton(
              text: text,
              padding: padding,
              isActive: isActive,
              isLoading: isLoading,
              onPress: onPress,
            )
          : _CustomElevatedButton(
              text: text,
              padding: padding,
              isActive: isActive,
              isLoading: isLoading,
              onPress: onPress,
              color: color,
            ),
    );
  }
}

class _CustomOutlinaButton extends StatelessWidget {
  const _CustomOutlinaButton({
    Key? key,
    required this.text,
    required this.isActive,
    required this.isLoading,
    required this.onPress,
    this.padding,
  }) : super(key: key);

  final String text;
  final bool isActive;
  final bool isLoading;
  final Function() onPress;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isActive ? onPress : null,
      style: OutlinedButton.styleFrom(
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        side: BorderSide(
          width: isActive ? 1 : 0,
          color: const AppColorsThemeLight().colors.background[3]!,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: isLoading
          ? const SizedBox(
              height: 16,
              child: FittedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                ),
              ),
            )
          : Text(
              text,
              style: AppTextTheme.fromPlatform.b2_0,
            ),
    );
  }
}

class _CustomElevatedButton extends StatelessWidget {
  const _CustomElevatedButton({
    Key? key,
    required this.text,
    required this.isActive,
    required this.isLoading,
    required this.onPress,
    required this.color,
    this.padding,
  }) : super(key: key);

  final String text;
  final bool isActive;
  final bool isLoading;
  final Function() onPress;
  final EdgeInsets? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorsScheme = theme.appColorsScheme;
    final resolvedButtonColor = color ?? colorsScheme.colors.accent.accent1;
    final resolvedTextColor = colorsScheme.other.white;
    return ElevatedButton(
      onPressed: isActive
          ? isLoading
              ? null
              : onPress
          : null,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(padding ??
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        backgroundColor: MaterialStateProperty.all(resolvedButtonColor),
      ),
      child: isLoading
          ? const SizedBox(
              height: 16,
              child: FittedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                  color: Colors.white,
                ),
              ),
            )
          : Text(
              text,
              softWrap: false,
              style: theme.appTextTheme.b2_0.copyWith(
                color: resolvedTextColor,
              ),
            ),
    );
  }
}