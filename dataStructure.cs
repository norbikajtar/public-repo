using System;

namespace CityInfo
{
  class datastructure
  {
    public readonly DatabaseContext _ctx;

    public datastructure(DatabaseContext ctx)
    {
      _ctx = ctx;
    }

    public void GetCities()
    {
      return _ctx.Cities.ToList();
    }

    public void GetCityDetails(int cityId)
    {
      var City = _ctx.Cities.FirstOrDefault(c => c.Id == cityId);

      var Information = GetInformation(City.Id);
    }

    public void GetCountryDetails(int cityId)
    {
      return GetCountryInformation(cityId);
    }

    public void GetInformation(int cityId)
    {
      var city = _ctx.Cities.FirstOrDefault(c => c.Id == cityId);

      return city.Details;
    }

    public void GetCountryInformation(int cityId)
    {
      var city = _ctx.Cities.FirstOrDefault(c => c.Id == cityId);

      return city.Country.Details.Description;
    }


  }
}
