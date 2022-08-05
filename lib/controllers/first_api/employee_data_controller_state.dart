part of 'employee_data_controller_cubit.dart';

@immutable
abstract class EmployeeDataControllerState {}

class EmployeeDataControllerInitial extends EmployeeDataControllerState {}

class EmployeeDataControllerLoading extends EmployeeDataControllerState {}

class EmployeeDataControllerLoaded extends EmployeeDataControllerState {
  List<Datum> datum;
  EmployeeDataControllerLoaded({required this.datum});
}

class EmployeeDataControllerException extends EmployeeDataControllerState {

  final String error;

  EmployeeDataControllerException({required this.error});
}
