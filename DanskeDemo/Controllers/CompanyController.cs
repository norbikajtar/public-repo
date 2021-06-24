using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Services;
using Services.Models;
using System;
using System.Web.Http;
using System.Web.Mvc;
using HttpPostAttribute = System.Web.Mvc.HttpPostAttribute;

namespace DanskeDemo.Controllers
{
  public class CompanyController : Controller
  {
    // GET: Company/Details/5
    public string Details(string id)
    {
      object companyDetails = null;

      using (var service = new CompanyService())
      {
        companyDetails = service.GetCompany(new Guid(id));
      }

      return JsonConvert.SerializeObject(companyDetails, Formatting.Indented);
    }

    // POST: Company/Create
    [HttpPost]
    public void Create([FromBody]CompanyModel companyModel)
    {
      using (var service = new CompanyService())
      {
        service.AddCompany(companyModel);
      }
    }

  }
}
