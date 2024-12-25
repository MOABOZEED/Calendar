import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? messageAr;
  final String? messageEn;
  final bool? isSuccess;

  const Failure({this.messageAr,this.isSuccess,this.messageEn});

  @override
  List<Object> get props => [messageAr ?? "",isSuccess ?? false,messageEn ?? ""];
}

class ServerFailure extends Failure {
  const ServerFailure(
      {
        final String? messageAr,
        final String? messageEn,
        final bool? isSuccess

      }) : super(messageAr: messageAr ?? "", isSuccess: isSuccess ?? false, messageEn: messageEn ?? "");
}
