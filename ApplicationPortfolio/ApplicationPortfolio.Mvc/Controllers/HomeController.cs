using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ApplicationPortfolio.Domain.DataConnections;
using ApplicationPortfolio.Domain.DataConnections.Repositories;

namespace ApplicationPortfolio.Mvc.Controllers
{
    public class HomeController : Controller
    {
        ApplicationPortfolio.Domain.DataConnections.Repositories.SharedRepository SharedRepo = new SharedRepository();

        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [OutputCache(CacheProfile = "MyProfile", Duration = 10)]
        public JsonResult Autocomplete(string term)
        {
           // var results = SharedRepo.GetAutoCompleteResults();

            var items = new[] { "Apple", "Pear", 
           "Banana", "Pineapple", "Peach" };

            return Json(items, JsonRequestBehavior.AllowGet);
        }
    }
}
