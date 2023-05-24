import 'package:flutter_sample_crud/contact/application/contact_notifier.dart';
import 'package:flutter_sample_crud/core/shared/providers.dart';
import 'package:flutter_sample_crud/contact/infrastructure/contact_remote_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final contactRemoteServiceProvider =
    Provider((ref) => ContactRemoteService(ref.watch(dioProvider)));

final contactNotifierProvider =
    StateNotifierProvider<ContactNotifier, ContactState>(
  (ref) => ContactNotifier(ref.watch(contactRemoteServiceProvider)),
);
