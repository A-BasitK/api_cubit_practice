part of 'staff_data_controller_cubit.dart';

@immutable
abstract class StaffDataControllerState {}

class StaffDataControllerInitial extends StaffDataControllerState {}
class StaffDataControllerLoading extends StaffDataControllerState{}
class StaffDataControllerLoaded extends StaffDataControllerState{
  List<StaffData> staffData;
  StaffDataControllerLoaded({required this.staffData});

}
class StaffDataControllerException extends StaffDataControllerState{
  final String error;
  StaffDataControllerException({required this.error});
}
