using System;
using System.Collections.Generic;

using System.Linq;
using System.Web;
using System.Web.Mvc;
using ApplicationPortfolio.Domain.DataConnections;
using ApplicationPortfolio.Domain.DataConnections.Repositories;

namespace ApplicationPortfolio.Mvc.Controllers
{
    public class ApplicationController : Controller
    {
        ApplicationPortfolio.Domain.DataConnections.Repositories.ApplicationRespository AppRepo = new ApplicationRespository();
        ApplicationPortfolio.Domain.DataConnections.Repositories.BusinessCriticalityRepository BusCritRepo = new BusinessCriticalityRepository();
        ApplicationPortfolio.Domain.DataConnections.Repositories.ContactRepository ContactRepo = new ContactRepository();
        ApplicationPortfolio.Domain.DataConnections.Repositories.ServiceAreaRepository ServiceAreaRepo = new ServiceAreaRepository();
        
        
        //
        // GET: /Application/

        public ActionResult Index()
        {

            var applications = AppRepo.GetAllApplications(); //db.Applications.Include(a => a.BusinessCriticality).Include(a => a.Contact).Include(a => a.Contact1).Include(a => a.ServiceArea);
            return View(applications);
        }

        //
        // GET: /Application/Details/5

        public ActionResult Details(Guid id)
        //public ActionResult Details(Guid id = null)
        {
            Application application = AppRepo.GetApplication(id);
            if (application == null)
            {
                return HttpNotFound();
            }
            return View(application);
        }

        //
        // GET: /Application/Create

        public ActionResult Create()
        {

            ViewBag.BusinessCriticalityId = new SelectList(BusCritRepo.GetAllBusinessCriticalities(), "BusinessCriticalityId", "Name");
            ViewBag.BusinessContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.IctContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.ServiceAreaId = new SelectList(ServiceAreaRepo.GetAllServiceAreas(), "ServiceAreaId", "Name");
            return View();
        }

        //
        // POST: /Application/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Application application)
        {
            if (ModelState.IsValid)
            {
               var result = AppRepo.CreateApplication(application);
               if (result == "Success")
               {
                   return RedirectToAction("Index");
               }
                
            }

            ViewBag.BusinessCriticalityId = new SelectList(BusCritRepo.GetAllBusinessCriticalities(), "BusinessCriticalityId", "Name");
            ViewBag.BusinessContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.IctContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.ServiceAreaId = new SelectList(ServiceAreaRepo.GetAllServiceAreas(), "ServiceAreaId", "Name");
            return View(application);
        }

        //
        // GET: /Application/Edit/5

        public ActionResult Edit(Guid id)
        {
            Application application = AppRepo.GetApplication(id);// db.Applications.Find(id);
            if (application == null)
            {
                return HttpNotFound();
            }
            ViewBag.BusinessCriticalityId = new SelectList(BusCritRepo.GetAllBusinessCriticalities(), "BusinessCriticalityId", "Name");
            ViewBag.BusinessContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.IctContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.ServiceAreaId = new SelectList(ServiceAreaRepo.GetAllServiceAreas(), "ServiceAreaId", "Name");
            return View(application);
        }

        //
        // POST: /Application/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Application application)
        {
            if (ModelState.IsValid)
            {
                AppRepo.EditApplication(application);
                
                return RedirectToAction("Index");
            }
            ViewBag.BusinessCriticalityId = new SelectList(BusCritRepo.GetAllBusinessCriticalities(), "BusinessCriticalityId", "Name");
            ViewBag.BusinessContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.IctContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.ServiceAreaId = new SelectList(ServiceAreaRepo.GetAllServiceAreas(), "ServiceAreaId", "Name");
            return View(application);
        }

        //
        // GET: /Application/Delete/5

        public ActionResult Delete(Guid id)
        {
            Application application = AppRepo.GetApplication(id);// db.Applications.Find(id);
            if (application == null)
            {
                return HttpNotFound();
            }
            return View(application);
        }

        //
        // POST: /Application/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Application application = AppRepo.GetApplication(id);// db.Applications.Find(id);
            AppRepo.DeleteApplication(application);
            return RedirectToAction("Index");
        }

        
    }
}