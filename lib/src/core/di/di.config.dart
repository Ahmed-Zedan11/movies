// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies_app/src/features/auth/data/data%20source/local/auth_local_data_source.dart'
    as _i1013;
import 'package:movies_app/src/features/auth/data/data%20source/local/auth_shared_prefs_local_data_source.dart'
    as _i375;
import 'package:movies_app/src/features/auth/data/data%20source/remote/auth_api_remote_data_source.dart'
    as _i768;
import 'package:movies_app/src/features/auth/data/data%20source/remote/auth_remote_data_source.dart'
    as _i366;
import 'package:movies_app/src/features/auth/data/repositoriesImpl/auth_repo_impl.dart'
    as _i231;
import 'package:movies_app/src/features/auth/domain/repositoray/auth_repo.dart'
    as _i634;
import 'package:movies_app/src/features/auth/domain/use_cases/login_use_case.dart'
    as _i627;
import 'package:movies_app/src/features/auth/domain/use_cases/register_use_case.dart'
    as _i975;
import 'package:movies_app/src/features/auth/presntation/cubit/auth_cubit.dart'
    as _i3;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1013.AuthLocalDataSource>(
      () => _i375.AuthSharedPrefsLocalDataSource(),
    );
    gh.singleton<_i366.AuthRemoteDataSource>(
      () => _i768.AuthApiRemoteDataSource(),
    );
    gh.singleton<_i634.AuthRepo>(
      () => _i231.AuthRepoImpl(
        authRemoteDataSource: gh<_i366.AuthRemoteDataSource>(),
        authLocalDataSource: gh<_i1013.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i627.LoginUseCase>(
      () => _i627.LoginUseCase(authRepo: gh<_i634.AuthRepo>()),
    );
    gh.singleton<_i975.RegisterUseCase>(
      () => _i975.RegisterUseCase(authRepo: gh<_i634.AuthRepo>()),
    );
    gh.singleton<_i3.AuthCubit>(
      () => _i3.AuthCubit(
        registerUseCase: gh<_i975.RegisterUseCase>(),
        loginUseCase: gh<_i627.LoginUseCase>(),
      ),
    );
    return this;
  }
}
