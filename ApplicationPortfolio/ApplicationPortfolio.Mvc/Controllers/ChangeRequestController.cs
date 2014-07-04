using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ApplicationPortfolio.Domain.DataConnections;
using ApplicationPortfolio.Domain.DataConnections.Repositories;
using ApplicationPortfolio.Mvc.ViewModels.ChangeRequest;

namespace ApplicationPortfolio.Mvc.Controllers
{
    public class ChangeRequestController : Controller
    {
        private AppPortfolioEntities db = new AppPortfolioEntities();

        ApplicationPortfolio.Domain.DataConnections.Repositories.ChangeRequestRepository ChangeRepo = new ChangeRequestRepository();

        #region Standard Change Request
        


        //
        // GET: /ChangeRequest/

        public ActionResult Index()
        {
            return View(ChangeRepo.GetAllChangeRequests());
        }

        //
        // GET: /ChangeRequest/Details/5

        public ActionResult Details(int id = 0)
        {
            ChangeRequest changerequest = ChangeRepo.GetChangeRequest(id);
            if (changerequest == null)
            {
                return HttpNotFound();
            }
            return View(changerequest);
        }

        //
        // GET: /ChangeRequest/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /ChangeRequest/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ChangeRequest changerequest)
        {
            if (ModelState.IsValid)
            {
                ChangeRepo.CreateChangeRequest(changerequest);
               return RedirectToAction("Index");
            }

            return View(changerequest);
        }

        //
        // GET: /ChangeRequest/Delete/5

        public ActionResult Delete(int id = 0)
        {
            ChangeRequest changerequest = ChangeRepo.GetChangeRequest(id);
            if (changerequest == null)
            {
                return HttpNotFound();
            }
            return View(changerequest);
        }

        //
        // POST: /ChangeRequest/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ChangeRequest changerequest = ChangeRepo.GetChangeRequest(id);
            ChangeRepo.DeleteChangeRequest(changerequest);
            
            return RedirectToAction("Index");
        }

       

        #endregion

        #region Server Change Requests

        //
        // GET: /ChangeRequest/

        public ActionResult ServerChangeRequestIndex()
        {
            return View(ChangeRepo.GetAllServerChangeRequests());
        }

        //
        // GET: /ChangeRequest/Details/5

        public ActionResult ServerChangeRequestDetails(Guid id)
        {
            ServerChangeRequestViewViewModel viewModel = new ServerChangeRequestViewViewModel();
            viewModel.ChangeRequests = ChangeRepo.GetServerChangeRequestsByServerId(id);
            viewModel.ServerId = id;
            return View("~/Views/ChangeRequest/Server/Index.cshtml",viewModel);
        }

        //
        // GET: /ChangeRequest/Create

        public ActionResult ServerChangeRequestCreate(Guid Id)
        {
            ApplicationPortfolio.Domain.DataConnections.ServerChangeRequest VM = new ApplicationPortfolio.Domain.DataConnections.ServerChangeRequest();
            VM.ServerId = Id;

            return View("~/Views/ChangeRequest/Server/Create.cshtml", VM);
        }

        //
        // POST: /ChangeRequest/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ServerChangeRequestCreate(ServerChangeRequest serverChangeRequest)
        {
            if (ModelState.IsValid)
            {
                serverChangeRequest.CreatedDate = DateTime.Now;
                ChangeRepo.CreateServerChangeRequest(serverChangeRequest);
                return RedirectToAction("ServerChangeRequestDetails", new {id = serverChangeRequest.ServerId});
            }

            return View(serverChangeRequest);
        }

        //
        // GET: /ChangeRequest/Delete/5

        public ActionResult ServerChangeRequestDelete(int id = 0)
        {
            ServerChangeRequest serverChangeRequest = ChangeRepo.GetServerChangeRequest(id);
            if (serverChangeRequest == null)
            {
                return HttpNotFound();
            }
            return View(serverChangeRequest);
        }

        //
        // POST: /ChangeRequest/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult ServerChangeRequestDeleteConfirmed(int id)
        {
            ServerChangeRequest serverChangeRequest = ChangeRepo.GetServerChangeRequest(id);
            ChangeRepo.DeleteServerChangeRequest(serverChangeRequest);

            return RedirectToAction("Index");
        }

        #endregion
    }
}