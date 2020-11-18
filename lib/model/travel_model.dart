import 'package:flutterapp/generated/json/base/json_convert_content.dart';
import 'package:flutterapp/generated/json/base/json_filed.dart';

class TravelModel with JsonConvert<TravelModel> {
	@JSONField(name: "ResponseStatus")
	TravelModelResponseStatus responseStatus;
	int totalCount;
	List<TravelItem> resultList;
}

class TravelModelResponseStatus with JsonConvert<TravelModelResponseStatus> {
	@JSONField(name: "Timestamp")
	String timestamp;
	@JSONField(name: "Ack")
	String ack;
	@JSONField(name: "Errors")
	List<dynamic> errors;
	@JSONField(name: "Extension")
	List<TravelModelResponseStatusExtension> extension;
}

class TravelModelResponseStatusExtension with JsonConvert<TravelModelResponseStatusExtension> {
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "Value")
	String value;
}

class TravelItem with JsonConvert<TravelItem> {
	int type;
	TravelModelResultListArticle article;
	TravelModelResultListAdvert advert;
	TravelModelResultListPoi poi;
}

class TravelModelResultListArticle with JsonConvert<TravelModelResultListArticle> {
	int articleId;
	String articleType;
	int productType;
	int sourceType;
	String articleTitle;
	TravelModelResultListArticleAuthor author;
	List<TravelModelResultListArticleImage> images;
	bool hasVideo;
	int readCount;
	int likeCount;
	int commentCount;
	List<TravelModelResultListArticleUrl> urls;
	List<dynamic> tags;
	List<TravelModelResultListArticleTopic> topics;
	List<TravelModelResultListArticlePoi> pois;
	String publishTime;
	String publishTimeDisplay;
	String shootTime;
	String shootTimeDisplay;
	int level;
	String distanceText;
	bool isLike;
	int imageCounts;
	bool isCollected;
	int collectCount;
	int articleStatus;
	String poiName;
}

class TravelModelResultListArticleAuthor with JsonConvert<TravelModelResultListArticleAuthor> {
	int authorId;
	String nickName;
	String clientAuth;
	String jumpUrl;
	TravelModelResultListArticleAuthorCoverImage coverImage;
	int identityType;
	String tag;
}

class TravelModelResultListArticleAuthorCoverImage with JsonConvert<TravelModelResultListArticleAuthorCoverImage> {
	String dynamicUrl;
	String originalUrl;
}

class TravelModelResultListArticleImage with JsonConvert<TravelModelResultListArticleImage> {
	int imageId;
	String dynamicUrl;
	String originalUrl;
	int width;
	int height;
	int mediaType;
	bool isWaterMarked;
}

class TravelModelResultListArticleUrl with JsonConvert<TravelModelResultListArticleUrl> {
	String version;
	String appUrl;
	String h5Url;
	String wxUrl;
}

class TravelModelResultListArticleTopic with JsonConvert<TravelModelResultListArticleTopic> {
	int topicId;
	String topicName;
	int level;
}

class TravelModelResultListArticlePoi with JsonConvert<TravelModelResultListArticlePoi> {
	int poiType;
	int poiId;
	String poiName;
	int businessId;
	int districtId;
	TravelModelResultListArticlePoisPoiExt poiExt;
	int source;
	int isMain;
	bool isInChina;
	String countryName;
	String districtName;
	String districtENName;
}

class TravelModelResultListArticlePoisPoiExt with JsonConvert<TravelModelResultListArticlePoisPoiExt> {
	String h5Url;
	String appUrl;
}

class TravelModelResultListAdvert with JsonConvert<TravelModelResultListAdvert> {
	int id;
	int moduleId;
	String appUrl;
	String h5Url;
	String wxUrl;
	String imageUrl;
	int width;
	int height;
}

class TravelModelResultListPoi with JsonConvert<TravelModelResultListPoi> {
	int poiType;
	int poiId;
	String poiName;
	int hotValue;
	TravelModelResultListPoiArticle article;
	String distanceText;
	int tripShootCount;
	String shortFeature;
	String h5Url;
	String appUrl;
}

class TravelModelResultListPoiArticle with JsonConvert<TravelModelResultListPoiArticle> {
	int articleId;
	int productType;
	int sourceType;
	String articleTitle;
	TravelModelResultListPoiArticleAuthor author;
	List<TravelModelResultListPoiArticleImage> images;
	bool hasVideo;
	int readCount;
	int likeCount;
	int commentCount;
	List<TravelModelResultListPoiArticleUrl> urls;
	List<dynamic> tags;
	List<TravelModelResultListPoiArticleTopic> topics;
	List<TravelModelResultListPoiArticlePoi> pois;
	String publishTime;
	String publishTimeDisplay;
	String shootTime;
	String shootTimeDisplay;
	int level;
	String distanceText;
	bool isLike;
	int imageCounts;
	bool isCollected;
	int collectCount;
	int articleStatus;
	String poiName;
}

class TravelModelResultListPoiArticleAuthor with JsonConvert<TravelModelResultListPoiArticleAuthor> {
	int authorId;
	String nickName;
	String clientAuth;
	String jumpUrl;
	TravelModelResultListPoiArticleAuthorCoverImage coverImage;
	int identityType;
	String tag;
}

class TravelModelResultListPoiArticleAuthorCoverImage with JsonConvert<TravelModelResultListPoiArticleAuthorCoverImage> {
	String dynamicUrl;
	String originalUrl;
}

class TravelModelResultListPoiArticleImage with JsonConvert<TravelModelResultListPoiArticleImage> {
	int imageId;
	String dynamicUrl;
	String originalUrl;
	int width;
	int height;
	int mediaType;
	bool isWaterMarked;
}

class TravelModelResultListPoiArticleUrl with JsonConvert<TravelModelResultListPoiArticleUrl> {
	String version;
	String appUrl;
	String h5Url;
	String wxUrl;
}

class TravelModelResultListPoiArticleTopic with JsonConvert<TravelModelResultListPoiArticleTopic> {
	int topicId;
	String topicName;
	int level;
	TravelModelResultListPoiArticleTopicsIconImage iconImage;
}

class TravelModelResultListPoiArticleTopicsIconImage with JsonConvert<TravelModelResultListPoiArticleTopicsIconImage> {
	int imageId;
	String dynamicUrl;
	String originalUrl;
	int width;
	int height;
	int mediaType;
}

class TravelModelResultListPoiArticlePoi with JsonConvert<TravelModelResultListPoiArticlePoi> {
	int poiType;
	int poiId;
	String poiName;
	int businessId;
	int districtId;
	TravelModelResultListPoiArticlePoisPoiExt poiExt;
	int source;
	int isMain;
	bool isInChina;
	String countryName;
	String districtName;
	String districtENName;
}

class TravelModelResultListPoiArticlePoisPoiExt with JsonConvert<TravelModelResultListPoiArticlePoisPoiExt> {
	String h5Url;
	String appUrl;
}
