/// updated : 1663128330988
/// country : "Afghanistan"
/// countryInfo : {"_id":4,"iso2":"AF","iso3":"AFG","lat":33,"long":65,"flag":"https://disease.sh/assets/img/flags/af.png"}
/// cases : 196404
/// todayCases : 0
/// deaths : 7791
/// todayDeaths : 0
/// recovered : 175131
/// todayRecovered : 0
/// active : 13482
/// critical : 1124
/// casesPerOneMillion : 4808
/// deathsPerOneMillion : 191
/// tests : 1085257
/// testsPerOneMillion : 26565
/// population : 40853585
/// continent : "Asia"
/// oneCasePerPeople : 208
/// oneDeathPerPeople : 5244
/// oneTestPerPeople : 38
/// activePerOneMillion : 330.01
/// recoveredPerOneMillion : 4286.8
/// criticalPerOneMillion : 27.51

class WorldCountriesModal {
  WorldCountriesModal({
      num? updated, 
      String? country, 
      CountryInfo? countryInfo, 
      num? cases, 
      num? todayCases, 
      num? deaths, 
      num? todayDeaths, 
      num? recovered, 
      num? todayRecovered, 
      num? active, 
      num? critical, 
      num? casesPerOneMillion, 
      num? deathsPerOneMillion, 
      num? tests, 
      num? testsPerOneMillion, 
      num? population, 
      String? continent, 
      num? oneCasePerPeople, 
      num? oneDeathPerPeople, 
      num? oneTestPerPeople, 
      num? activePerOneMillion, 
      num? recoveredPerOneMillion, 
      num? criticalPerOneMillion,}){
    _updated = updated;
    _country = country;
    _countryInfo = countryInfo;
    _cases = cases;
    _todayCases = todayCases;
    _deaths = deaths;
    _todayDeaths = todayDeaths;
    _recovered = recovered;
    _todayRecovered = todayRecovered;
    _active = active;
    _critical = critical;
    _casesPerOneMillion = casesPerOneMillion;
    _deathsPerOneMillion = deathsPerOneMillion;
    _tests = tests;
    _testsPerOneMillion = testsPerOneMillion;
    _population = population;
    _continent = continent;
    _oneCasePerPeople = oneCasePerPeople;
    _oneDeathPerPeople = oneDeathPerPeople;
    _oneTestPerPeople = oneTestPerPeople;
    _activePerOneMillion = activePerOneMillion;
    _recoveredPerOneMillion = recoveredPerOneMillion;
    _criticalPerOneMillion = criticalPerOneMillion;
}

  WorldCountriesModal.fromJson(dynamic json) {
    _updated = json['updated'];
    _country = json['country'];
    _countryInfo = json['countryInfo'] != null ? CountryInfo.fromJson(json['countryInfo']) : null;
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _todayDeaths = json['todayDeaths'];
    _recovered = json['recovered'];
    _todayRecovered = json['todayRecovered'];
    _active = json['active'];
    _critical = json['critical'];
    _casesPerOneMillion = json['casesPerOneMillion'];
    _deathsPerOneMillion = json['deathsPerOneMillion'];
    _tests = json['tests'];
    _testsPerOneMillion = json['testsPerOneMillion'];
    _population = json['population'];
    _continent = json['continent'];
    _oneCasePerPeople = json['oneCasePerPeople'];
    _oneDeathPerPeople = json['oneDeathPerPeople'];
    _oneTestPerPeople = json['oneTestPerPeople'];
    _activePerOneMillion = json['activePerOneMillion'];
    _recoveredPerOneMillion = json['recoveredPerOneMillion'];
    _criticalPerOneMillion = json['criticalPerOneMillion'];
  }
  num? _updated;
  String? _country;
  CountryInfo? _countryInfo;
  num? _cases;
  num? _todayCases;
  num? _deaths;
  num? _todayDeaths;
  num? _recovered;
  num? _todayRecovered;
  num? _active;
  num? _critical;
  num? _casesPerOneMillion;
  num? _deathsPerOneMillion;
  num? _tests;
  num? _testsPerOneMillion;
  num? _population;
  String? _continent;
  num? _oneCasePerPeople;
  num? _oneDeathPerPeople;
  num? _oneTestPerPeople;
  num? _activePerOneMillion;
  num? _recoveredPerOneMillion;
  num? _criticalPerOneMillion;

  num? get updated => _updated;
  String? get country => _country;
  CountryInfo? get countryInfo => _countryInfo;
  num? get cases => _cases;
  num? get todayCases => _todayCases;
  num? get deaths => _deaths;
  num? get todayDeaths => _todayDeaths;
  num? get recovered => _recovered;
  num? get todayRecovered => _todayRecovered;
  num? get active => _active;
  num? get critical => _critical;
  num? get casesPerOneMillion => _casesPerOneMillion;
  num? get deathsPerOneMillion => _deathsPerOneMillion;
  num? get tests => _tests;
  num? get testsPerOneMillion => _testsPerOneMillion;
  num? get population => _population;
  String? get continent => _continent;
  num? get oneCasePerPeople => _oneCasePerPeople;
  num? get oneDeathPerPeople => _oneDeathPerPeople;
  num? get oneTestPerPeople => _oneTestPerPeople;
  num? get activePerOneMillion => _activePerOneMillion;
  num? get recoveredPerOneMillion => _recoveredPerOneMillion;
  num? get criticalPerOneMillion => _criticalPerOneMillion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['updated'] = _updated;
    map['country'] = _country;
    if (_countryInfo != null) {
      map['countryInfo'] = _countryInfo?.toJson();
    }
    map['cases'] = _cases;
    map['todayCases'] = _todayCases;
    map['deaths'] = _deaths;
    map['todayDeaths'] = _todayDeaths;
    map['recovered'] = _recovered;
    map['todayRecovered'] = _todayRecovered;
    map['active'] = _active;
    map['critical'] = _critical;
    map['casesPerOneMillion'] = _casesPerOneMillion;
    map['deathsPerOneMillion'] = _deathsPerOneMillion;
    map['tests'] = _tests;
    map['testsPerOneMillion'] = _testsPerOneMillion;
    map['population'] = _population;
    map['continent'] = _continent;
    map['oneCasePerPeople'] = _oneCasePerPeople;
    map['oneDeathPerPeople'] = _oneDeathPerPeople;
    map['oneTestPerPeople'] = _oneTestPerPeople;
    map['activePerOneMillion'] = _activePerOneMillion;
    map['recoveredPerOneMillion'] = _recoveredPerOneMillion;
    map['criticalPerOneMillion'] = _criticalPerOneMillion;
    return map;
  }

}

/// _id : 4
/// iso2 : "AF"
/// iso3 : "AFG"
/// lat : 33
/// long : 65
/// flag : "https://disease.sh/assets/img/flags/af.png"

class CountryInfo {
  CountryInfo({
      num? id, 
      String? iso2, 
      String? iso3, 
      num? lat, 
      num? long, 
      String? flag,}){
    _id = id;
    _iso2 = iso2;
    _iso3 = iso3;
    _lat = lat;
    _long = long;
    _flag = flag;
}

  CountryInfo.fromJson(dynamic json) {
    _id = json['_id'];
    _iso2 = json['iso2'];
    _iso3 = json['iso3'];
    _lat = json['lat'];
    _long = json['long'];
    _flag = json['flag'];
  }
  num? _id;
  String? _iso2;
  String? _iso3;
  num? _lat;
  num? _long;
  String? _flag;

  num? get id => _id;
  String? get iso2 => _iso2;
  String? get iso3 => _iso3;
  num? get lat => _lat;
  num? get long => _long;
  String? get flag => _flag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['iso2'] = _iso2;
    map['iso3'] = _iso3;
    map['lat'] = _lat;
    map['long'] = _long;
    map['flag'] = _flag;
    return map;
  }

}