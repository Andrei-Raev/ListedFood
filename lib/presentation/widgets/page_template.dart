import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;
  final String title;
  bool? back;

  PageTemplate({super.key, required this.title, required this.child, this.back}) {
    back ??= false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        leading: back!
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Theme.of(context).colorScheme.primary,
          iconSize: (Theme.of(context).textTheme.titleLarge!.fontSize ?? 42) * .8,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.zero,
        ) : null,
        titleSpacing: !back! ? Theme.of(context).textTheme.bodyMedium!.fontSize : 0,

      ),
      body: child,
    );
  }
} 