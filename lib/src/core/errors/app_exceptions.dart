abstract class AppExceptions {
  final String message;
  const AppExceptions({required this.message});
}

class RemoteException extends AppExceptions {
  RemoteException({required super.message});
}

class LocaleException extends AppExceptions {
  LocaleException({required super.message});
}
