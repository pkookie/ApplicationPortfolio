using System;
using System.Collections.Generic;

using System.Linq;
using System.Web;
using System.Web.Mvc;
using ApplicationPortfolio.Domain.DataConnections;
using ApplicationPortfolio.Domain.DataConnections.Repositories;
using ApplicationPortfolio.Mvc.ViewModels.Application;

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
            var viewModel = new AllApplicationsViewModel();
            viewModel.Applications = AppRepo.GetAllApplications();
            return View(viewModel);
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

            var viewmodel = new ApplicationCreateViewModel();

            viewmodel.ApplicationContacts = null;
            viewmodel.ApplicationDocuments = null;
            viewmodel.BusinessCriticalities = BusCritRepo.GetAllBusinessCriticalities();
            viewmodel.ServiceAreas = ServiceAreaRepo.GetAllServiceAreas();
            

            ViewBag.BusinessCriticalityId = new SelectList(BusCritRepo.GetAllBusinessCriticalities(), "BusinessCriticalityId", "Name");
            ViewBag.BusinessContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.IctContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.ServiceAreaId = new SelectList(ServiceAreaRepo.GetAllServiceAreas(), "ServiceAreaId", "Name");
            return View(viewmodel);
        }

        //
        // POST: /Application/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ApplicationCreateViewModel applicationCreateViewModel)
        {
            if (ModelState.IsValid)
            {
                Application application = applicationCreateViewModel.Application;
                application.BusinessCriticalityId = applicationCreateViewModel.BusinessCriticalitySelectedValue;
                application.ServiceAreaId = applicationCreateViewModel.ServiceAreaSelectedValue;

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
            return View(applicationCreateViewModel);
        }

        //
        // GET: /Application/Edit/5

        public ActionResult Edit(Guid id)
        {
            Application application = AppRepo.GetApplication(id);
            if (application == null)
            {
                return HttpNotFound();
            }

            var viewmodel = new ApplicationEditViewModel();
            viewmodel.Application = application;
            viewmodel.BusinessCriticalitySelectedValue = application.BusinessCriticalityId;
            viewmodel.ServiceAreaSelectedValue = application.ServiceAreaId;

            viewmodel.ApplicationContacts = AppRepo.GetApplicationContacts(id);
            viewmodel.ApplicationDocuments = AppRepo.GetApplicationDocuments(id);
            viewmodel.BusinessCriticalities = BusCritRepo.GetAllBusinessCriticalities();
            viewmodel.ServiceAreas = ServiceAreaRepo.GetAllServiceAreas();

            ViewBag.BusinessCriticalityId = new SelectList(BusCritRepo.GetAllBusinessCriticalities(), "BusinessCriticalityId", "Name");
            ViewBag.BusinessContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.IctContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.ServiceAreaId = new SelectList(ServiceAreaRepo.GetAllServiceAreas(), "ServiceAreaId", "Name");
            return View(viewmodel);
        }

        //
        // POST: /Application/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ApplicationEditViewModel applicationViewModel)
        {
            if (ModelState.IsValid)
            {
                Application application = applicationViewModel.Application;
                application.BusinessCriticalityId = applicationViewModel.BusinessCriticalitySelectedValue;
                application.ServiceAreaId = applicationViewModel.ServiceAreaSelectedValue;
                AppRepo.EditApplication(application);
                
                return RedirectToAction("Index");
            }
            ViewBag.BusinessCriticalityId = new SelectList(BusCritRepo.GetAllBusinessCriticalities(), "BusinessCriticalityId", "Name");
            ViewBag.BusinessContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.IctContact = new SelectList(ContactRepo.GetAllContacts(), "ContactId", "ContactId");
            ViewBag.ServiceAreaId = new SelectList(ServiceAreaRepo.GetAllServiceAreas(), "ServiceAreaId", "Name");
            return View(applicationViewModel);
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