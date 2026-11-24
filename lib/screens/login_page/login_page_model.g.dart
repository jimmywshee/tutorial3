// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoginPageModel)
const loginPageModelProvider = LoginPageModelProvider._();

final class LoginPageModelProvider
    extends $NotifierProvider<LoginPageModel, LoginPageState> {
  const LoginPageModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginPageModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginPageModelHash();

  @$internal
  @override
  LoginPageModel create() => LoginPageModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginPageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginPageState>(value),
    );
  }
}

String _$loginPageModelHash() => r'e029051b1cf07344b5ac193bb8014c6658f59f24';

abstract class _$LoginPageModel extends $Notifier<LoginPageState> {
  LoginPageState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LoginPageState, LoginPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LoginPageState, LoginPageState>,
              LoginPageState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
