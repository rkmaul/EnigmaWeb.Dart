import 'package:enigma_web/src/commands/enigma_command.dart';
import 'package:enigma_web/src/commands/i_wake_up_command.dart';
import 'package:enigma_web/src/enums.dart';
import 'package:enigma_web/src/i_profile.dart';
import 'package:enigma_web/src/i_web_requester.dart';
import 'package:enigma_web/src/parsers/i_response_parser.dart';
import 'package:enigma_web/src/responses/i_response.dart';

class WakeUpCommand
    extends EnigmaCommand<IWakeUpCommand, IResponse<IWakeUpCommand>>
    implements IWakeUpCommand {
  final IResponseParser<IWakeUpCommand, IResponse<IWakeUpCommand>> parser;
  @override
  final IProfile profile;

  WakeUpCommand(
    this.parser,
    IWebRequester requester,
    this.profile,
  )   : assert(parser != null),
        assert(profile != null),
        super(requester);

  @override
  Future<IResponse<IWakeUpCommand>> executeAsync() async {
    String url;
    if (profile.enigma == EnigmaType.enigma1) {
      url = 'cgi-bin/admin?command=wakeup&requester=webif';
    } else {
      url = 'web/powerstate?newstate=4';
    }
    return await super.executeGenericAsync(
      profile,
      url,
      parser,
    );
  }
}
