import 'package:api_cubit_prac/models/second_data_model/staff_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/repo/second_repo/staff_data_repo.dart';


part 'staff_data_controller_state.dart';

class StaffDataControllerCubit extends Cubit<StaffDataControllerState> {
  StaffDataControllerCubit() : super(StaffDataControllerInitial());
    getStaffData() async{
      try {
        emit(StaffDataControllerLoading());
        final data = await Repo2.getStaffData();


        if(data!.isNotEmpty){
          emit(StaffDataControllerLoaded(staffData: data));
        }else{
          emit(StaffDataControllerException(error: ''));
        }
      } catch(e){
        emit(StaffDataControllerException(error: e.toString()));
      }
      }
      
    }


