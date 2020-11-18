import 'package:flutterapp/generated/json/base/json_convert_content.dart';

class HomeModel with JsonConvert<HomeModel> {
	HomeModelConfig config;
	List<HomeModelBannerList> bannerList;
	List<HomeModelLocalNavList> localNavList;
	HomeModelGridNav gridNav;
	List<HomeModelSubNavList> subNavList;
	HomeModelSalesBox salesBox;
}

class HomeModelConfig with JsonConvert<HomeModelConfig> {
	String searchUrl;
}

class HomeModelBannerList with JsonConvert<HomeModelBannerList> {
	String icon;
	String url;
}

class HomeModelLocalNavList with JsonConvert<HomeModelLocalNavList> {
	String icon;
	String title;
	String url;
	String statusBarColor;
	bool hideAppBar;
}

class HomeModelGridNav with JsonConvert<HomeModelGridNav> {
	GridNavItem hotel;
	GridNavItem flight;
	GridNavItem travel;
}

class GridNavItem with JsonConvert<GridNavItem> {
	String startColor;
	String endColor;
	HomeModelGridNavMainItem mainItem;
	HomeModelGridNavItem item1;
	HomeModelGridNavItem item2;
	HomeModelGridNavItem item3;
	HomeModelGridNavItem item4;
}

class HomeModelGridNavMainItem with JsonConvert<HomeModelGridNavMainItem> {
	String title;
	String icon;
	String url;
	String statusBarColor;
}

class HomeModelGridNavItem with JsonConvert<HomeModelGridNavItem> {
	String title;
	String url;
	String statusBarColor;
	bool hideAppBar;
}


class HomeModelSubNavList with JsonConvert<HomeModelSubNavList> {
	String icon;
	String title;
	String url;
	bool hideAppBar;
}

class HomeModelSalesBox with JsonConvert<HomeModelSalesBox> {
	String icon;
	String moreUrl;
	HomeModelSalesBoxCard bigCard1;
  HomeModelSalesBoxCard bigCard2;
  HomeModelSalesBoxCard smallCard1;
  HomeModelSalesBoxCard smallCard2;
  HomeModelSalesBoxCard smallCard3;
  HomeModelSalesBoxCard smallCard4;
}

class HomeModelSalesBoxCard with JsonConvert<HomeModelSalesBoxCard> {
	String icon;
	String url;
	String title;
}


