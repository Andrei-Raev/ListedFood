import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listed_food/generated/l10n.dart'; // Для локализации
import '../../../di/injection_container.dart'; // Для sl()
import '../cubit/login/login_cubit.dart';
import '../cubit/auth_status/auth_status_cubit.dart'; // Для context.read<AuthStatusCubit>()

// TODO: Создать страницу регистрации и восстановления пароля и указать их routeName
// import 'registration_page.dart'; 
// import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
            _emailController.text.trim(),
            _passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).loginPageTitle), // Используем локализацию
        ),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text('${S.of(context).loginFailed}: ${state.message}')),
                );
            }
            // При LoginSuccess AuthStatusCubit обновит состояние и AuthWrapper перенаправит
            // поэтому здесь явное действие не всегда нужно, но можно добавить, если требуется
            // if (state is LoginSuccess) {
            //   // AuthStatusCubit уже обработан в самом LoginCubit
            //   // Можно, например, показать приветственное сообщение перед переходом
            // }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        S.of(context).pleaseLoginOrRegister,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: S.of(context).email,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).pleaseEnterEmail;
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return S.of(context).pleaseEnterValidEmail;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: S.of(context).password,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).pleaseEnterPassword;
                          }
                          // Можно добавить валидацию длины пароля, если нужно
                          // if (value.length < 6) {
                          //   return S.of(context).passwordTooShort;
                          // }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      if (state is LoginLoading)
                        const Center(child: CircularProgressIndicator())
                      else
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            textStyle: Theme.of(context).textTheme.titleMedium,
                          ),
                          onPressed: () => _submitForm(context),
                          child: Text(S.of(context).loginButtonText),
                        ),
                      const SizedBox(height: 16),
                      TextButton(
                        child: Text(S.of(context).noAccountRegister),
                        onPressed: () {
                          // TODO: Навигация на страницу регистрации
                          // Navigator.of(context).pushNamed(RegistrationPage.routeName);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(S.of(context).navigateToRegisterTodo)),
                          );
                        },
                      ),
                      TextButton(
                        child: Text(S.of(context).forgotPasswordLink),
                        onPressed: () {
                          // TODO: Навигация на страницу восстановления пароля
                          // Navigator.of(context).pushNamed(ForgotPasswordPage.routeName);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(S.of(context).navigateToForgotPasswordTodo)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
} 