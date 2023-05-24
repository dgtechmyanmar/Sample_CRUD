import 'package:flutter_sample_crud/contact/infrastructure/contact_remote_service.dart';
import 'package:flutter_sample_crud/core/domain/response_info_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'save_contact_notifier.freezed.dart';

@freezed
class SaveContactState with _$SaveContactState {
  const factory SaveContactState.initial() = _Initial;
  const factory SaveContactState.loading() = _Loading;
  const factory SaveContactState.noConnection() = _NoConnection;
  const factory SaveContactState.empty() = _Empty;
  const factory SaveContactState.success(String success) = _Success;
  const factory SaveContactState.error(ResponseInfoError error) = _Error;
}

class SaveContactNotifier extends StateNotifier<SaveContactState> {
  final ContactRemoteService _remoteService;
  SaveContactNotifier(this._remoteService)
      : super(const SaveContactState.initial());

  Future<void> addContact(String name, String phone) async {
    state = const SaveContactState.loading();
    final result = await _remoteService.addContact(name, phone);
    state = result.fold(
      (l) => SaveContactState.error(l),
      (r) => r.when(
        noConnection: SaveContactState.noConnection,
        result: (data) => data.isEmpty
            ? const SaveContactState.empty()
            : SaveContactState.success(data),
      ),
    );
  }
}
