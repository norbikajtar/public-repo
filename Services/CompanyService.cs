using DataLayer;
using Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Services
{
  public class CompanyService : IDisposable
  {
    private DatabaseContext _db = null;

    public CompanyService()
    {
      _db = new DatabaseContext();
    }

    public void AddCompany(CompanyModel companyModel)
    {
      Company company = new Company
      {
        ID = !string.IsNullOrEmpty(companyModel.ID) ? new Guid(companyModel.ID) : Guid.NewGuid(),
        MarketID = _db.Markets.Where(x => x.Name.ToLower() == companyModel.Market.ToLower()).Select(x => x.ID).FirstOrDefault(),
        TypeID = _db.CompanyTypes.Where(x => x.Type.ToLower() == companyModel.Type.ToLower()).Select(x => x.ID).FirstOrDefault(),
        Number = companyModel.Number,
        Name = companyModel.Name
      };

      _db.Companies.Add(company);

      var occurences = _db.NotificationScheduleRules.Where(x => x.MarketID == company.MarketID && x.TypeID == company.TypeID).Select(x => x.Occurences).FirstOrDefault();

      if (!string.IsNullOrEmpty(occurences))
      {
        int i = 0;
        occurences.Split(',').Select(s => int.Parse(s)).ToList().ForEach(value =>
        {
          i++;
          _db.NotificationSchedules.Add(new NotificationSchedule { Company = company, Notification = i, SendDate = DateTime.Now.AddDays(value).Date });
        });
      }
      try
      {
        _db.SaveChanges();
      }
      catch (Exception e)
      {
        throw new Exception("Data Persistence expcetion has occured!");
      }
    }

    public void Dispose()
    {
      _db.Dispose();
    }

    public object GetCompany(Guid ID)
    {
      var company = _db.Companies.Find(ID);

      var notifications = new List<string>();

      if (company != null)
      {
        notifications = company.NotificationSchedules.Select(x => x.SendDate.Date.ToString("dd/MM/yyyy")).ToList();
      }

      return new { CompanyId = ID.ToString(), Notifications = notifications };
    }
  }
}
