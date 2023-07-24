import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translater/repo/repo_settings.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => RepoSettings(),
        ),
      ],
      child: child,
    );
  }
}
