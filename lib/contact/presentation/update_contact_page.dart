import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class UpdateContactPage extends ConsumerStatefulWidget {
  const UpdateContactPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateContactPageState();
}

class _UpdateContactPageState extends ConsumerState<UpdateContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Contact'),
      ),
    );
  }
}
