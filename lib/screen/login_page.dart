import 'package:agriculture_web/screen/home.dart';
import 'package:agriculture_web/theme/theme_colors.dart';
import 'package:agriculture_web/widget/alert_widget.dart';
import 'package:agriculture_web/widget/loading_overlay.dart';
import 'package:agriculture_web/widget/navigate_route.dart';
import 'package:agriculture_web/widget/text_field_custom.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      isShowIndicator: true,
      isShowBlurEffect: true,
      isShowColor: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: ClipRRect(
                  child: _RightLoginSection(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RightLoginSection extends StatefulWidget {
  const _RightLoginSection({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.formKey,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> formKey;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  State<_RightLoginSection> createState() => _RightLoginSectionState();
}

class _RightLoginSectionState extends State<_RightLoginSection> {
  bool isVerify = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _LoginSection(
          formKey: widget.formKey,
          onLoginTap: () {
            if (widget.formKey.currentState != null) {
              if (widget.formKey.currentState!.validate()) {
                if (widget._emailController.text != "iot_irrigation" ||
                    widget._passwordController.text != "12345") {
                  AlertPopUpFunction.alertPopUp(
                      "Incorrect Credential",
                      "Please enter correct email and password.",
                      context,
                      null,
                      null);
                  return;
                }
                NavigatePageRoute()
                    .navigatePush(context: context, widget: const Dashboard());
              }
            }
          },
          emailController: widget._emailController,
          passwordController: widget._passwordController,
        ),
      ],
    );
  }
}

class _LoginSection extends StatelessWidget {
  const _LoginSection({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.onLoginTap,
    required this.formKey,
  })  : _emailController = emailController,
        _passwordController = passwordController;
  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final Function() onLoginTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ThemeColors.customGreyColor.withOpacity(0.6),
        ),
      ),
      child: SizedBox(
        width: 380,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 45),
                  child: Text(
                    "Agriculture Monitoring",
                    style: TextStyle(
                      fontSize: 22,
                      color: ThemeColors.myColor[800]!,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _LoginTextFieldArea(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                const SizedBox(height: 50),
                _BottomButton(
                  text: "Log In",
                  onTap: () => onLoginTap(),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({
    required this.onTap,
    required this.text,
  });
  final Function onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ThemeColors.myColor[800]!,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 35,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginTextFieldArea extends StatefulWidget {
  const _LoginTextFieldArea({
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<_LoginTextFieldArea> createState() => _LoginTextFieldAreaState();
}

class _LoginTextFieldAreaState extends State<_LoginTextFieldArea> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldCustom(
          controller: widget.emailController,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          label: "Email",
          onValidation: (String? value) {
            if (value == null || value.isEmpty) {
              return "Please enter valid email";
            }
            return null;
          },
          maxLines: 1,
        ),
        const SizedBox(height: 12),
        TextFieldCustom(
          controller: widget.passwordController,
          label: "Password",
          textInputType: TextInputType.text,
          obscureText: isObscureText,
          suffixIcon: GestureDetector(
            onTap: () {
              if (widget.passwordController.text.isNotEmpty) {
                isObscureText = !isObscureText;
                if (!mounted) return;
                setState(() {});
              }
            },
            child: Icon(
              isObscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
          maxLines: 1,
          onValidation: (String? value) {
            if (value == null || value.isEmpty) {
              return "Enter password";
            }
            return null;
          },
        ),
      ],
    );
  }
}
