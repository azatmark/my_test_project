import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'FireRepository.dart';
import 'FireState.dart';

class FireCubit extends Cubit<FireStringState> {
  final _fireString = FireRepository();
 

 
  FireCubit() : super(LoadingFireString());

  void getString() async {
    try {
      final fireString = await _fireString.setupRemoteConfig();
      emit(FireStringSuccess(fireString: fireString.getString('key')));
     
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(FireStringFailure(exception: e as Exception));
    }
  }
}