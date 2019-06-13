import 'package:dio/dio.dart';
import 'package:enigma_web/src/commands/enigma_command.dart';
import 'package:enigma_web/src/commands/i_get_stream_parameters_command.dart';
import 'package:enigma_web/src/enums.dart';
import 'package:enigma_web/src/i_bouquet_item_service.dart';
import 'package:enigma_web/src/i_profile.dart';
import 'package:enigma_web/src/i_web_requester.dart';
import 'package:enigma_web/src/parsers/i_response_parser.dart';
import 'package:enigma_web/src/responses/i_get_stream_parameters_response.dart';

class GetStreamParametersCommand extends EnigmaCommand<IGetStreamParametersCommand, IGetStreamParametersResponse>
    implements IGetStreamParametersCommand {
  IResponseParser<IGetStreamParametersCommand, IGetStreamParametersResponse> parser;

  GetStreamParametersCommand(this.parser, IWebRequester requester)
      : assert(parser != null),
        super(requester) {}

  @override
  Future<IGetStreamParametersResponse> executeAsync(IProfile profile, IBouquetItemService service,
      {CancelToken token}) async {
    if (profile == null) {
      throw ArgumentError.notNull("profile");
    }

    if (service == null) {
      throw ArgumentError.notNull("service");
    }

    String url = profile.enigma == EnigmaType.enigma1 ? "video.m3u?ref=" : "web/video.m3u?sRef=";
    url = url + service.reference;
    return await super.executeGenericAsync(profile, url, parser, token: token);
  }
}