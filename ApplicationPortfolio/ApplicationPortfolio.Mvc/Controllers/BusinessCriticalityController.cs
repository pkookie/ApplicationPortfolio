using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ApplicationPortfolio.Domain.DataConnections;
using ApplicationPortfolio.Domain.DataConnections.Repositories;

namespace ApplicationPortfolio.Mvc.Controllers
{
    public class BusinessCriticalityController : Controller
    {
        //private AppPortfolioEntities db = new AppPortfolioEntities();
        ApplicationPortfolio.Domain.DataConnections.Repositories.BusinessCriticalityRepository BusCritRepo = new BusinessCriticalityRepository();
       // BusCritRepo 
        //
        // GET: /BusinessCriticality/

        public ActionResult Index()
        {
            return View(BusCritRepo.GetAllBusinessCriticalities());
        }

        //
        // GET: /BusinessCriticality/Details/5

        public ActionResult Details(int id = 0)
        {
            BusinessCriticality businesscriticality = BusCritRepo.GetBusinessCriticality(id);// db.BusinessCriticalities.Find(id);
            if (businesscriticality == null)
            {
                return HttpNotFound();
            }
            return View(businesscriticality);
        }

        //
        // GET: /BusinessCriticality/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /BusinessCriticality/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(BusinessCriticality businesscriticality)
        {
            if (ModelState.IsValid)
            {
                BusCritRepo.CreateBusinessCriticality(businesscriticality);
               
                return RedirectToAction("Index");
            }

            return View(businesscriticality);
        }

        //
        // GET: /BusinessCriticality/Edit/5

        public ActionResult Edit(int id = 0)
        {
            BusinessCriticality businesscriticality = BusCritRepo.GetBusinessCriticality(id);// db.BusinessCriticalities.Find(id);
            if (businesscriticality == null)
            {
                return HttpNotFound();
            }
            return View(businesscriticality);
        }

        //
        // POST: /BusinessCriticality/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(BusinessCriticality businesscriticality)
        {
            if (ModelState.IsValid)
            {
                BusCritRepo.EditBusinessCriticality(businesscriticality);

                return RedirectToAction("Index");
            }
            return View(businesscriticality);
        }

        //
        // GET: /BusinessCriticality/Delete/5

        public ActionResult Delete(int id = 0)
        {
            BusinessCriticality businesscriticality = BusCritRepo.GetBusinessCriticality(id);// db.BusinessCriticalities.Find(id);
            if (businesscriticality == null)
            {
                return HttpNotFound();
            }
            return View(businesscriticality);
        }

        //
        // POST: /BusinessCriticality/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BusinessCriticality businesscriticality = BusCritRepo.GetBusinessCriticality(id);// db.BusinessCriticalities.Find(id);
            BusCritRepo.DeleteBusinessCriticality(businesscriticality);

            return RedirectToAction("Index");
        }
    }
}