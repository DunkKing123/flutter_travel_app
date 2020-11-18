import 'package:flutterapp/generated/json/base/json_convert_content.dart';

/**
 * 旅拍类别模型
 */
class TravelTabModel with JsonConvert<TravelTabModel> {
	String url;
	TravelTabModelParams params;
	List<TravelTabModelTab> tabs;
}

class TravelTabModelParams with JsonConvert<TravelTabModelParams> {
	int districtId;
	String groupChannelCode;
	dynamic type;
	int lat;
	int lon;
	int locatedDistrictId;
	TravelTabModelParamsPagePara pagePara;
	int imageCutType;
	TravelTabModelParamsHead head;
	String contentType;
}

class TravelTabModelParamsPagePara with JsonConvert<TravelTabModelParamsPagePara> {
	int pageIndex;
	int pageSize;
	int sortType;
	int sortDirection;
}

class TravelTabModelParamsHead with JsonConvert<TravelTabModelParamsHead> {
	String cid;
	String ctok;
	String cver;
	String lang;
	String sid;
	String syscode;
	dynamic auth;
	List<TravelTabModelParamsHeadExtension> extension;
}

class TravelTabModelParamsHeadExtension with JsonConvert<TravelTabModelParamsHeadExtension> {
	String name;
	String value;
}

class TravelTabModelTab with JsonConvert<TravelTabModelTab> {
	String labelName;
	String groupChannelCode;
}
