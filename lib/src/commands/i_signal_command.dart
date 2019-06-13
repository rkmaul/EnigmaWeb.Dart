import 'package:dio/dio.dart';
import 'package:enigma_web/src/commands/i_command.dart';
import 'package:enigma_web/src/i_profile.dart';
import 'package:enigma_web/src/responses/i_signal_response.dart';

abstract class ISignalCommand implements ICommand {
  Future<ISignalResponse> executeAsync(IProfile profile, {CancelToken token});
}