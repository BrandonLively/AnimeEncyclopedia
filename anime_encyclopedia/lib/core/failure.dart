import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  Failure([List props = const<dynamic>[]]);
}

class ServerFailure extends Failure{
  @override
  List<Object> get props => null;
}

class NetworkFailure extends Failure{
  @override
  List<Object> get props => null;
}

class LocalStorageFailure extends Failure{
  @override
  List<Object> get props => null;
}