using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ApplicationPortfolio.Domain.DataConnections;
using ApplicationPortfolio.Domain.DataConnections.Repositories;
using ApplicationPortfolio.Mvc.ViewModels.Application;
using ApplicationPortfolio.Mvc.ViewModels.Dependencies;

namespace ApplicationPortfolio.Mvc.Controllers
{
    public class DependenciesController : Controller
    {
        ApplicationPortfolio.Domain.DataConnections.Repositories.ApplicationRespository AppRepo = new ApplicationRespository();
        ApplicationPortfolio.Domain.DataConnections.Repositories.ServerRepository ServerRepo = new ServerRepository();
        ApplicationPortfolio.Domain.DataConnections.Repositories.DependenciesRepository DependRepo = new DependenciesRepository();
        //
        // GET: /Dependencies/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Dependencies/Details/5

        public ActionResult Details(Guid id,String AppOrServer)
        {
            ViewDependencyViewModel viewModel = new ViewDependencyViewModel();

            //got the id, see if it's an app or server id that's been passed in
            if (AppOrServer == "Application")
            {
                //it's an app

                //grab the application
                Application application = AppRepo.GetApplication(id);

                //grab it's dependencies
                IEnumerable<ApplicationPortfolio.Domain.DataConnections.ApplicationServerDependency> dependencies = DependRepo.GetDependenciesForApplication(id);
                
                //now put everything inside the model
                viewModel.Application = application;
                viewModel.dependencies = dependencies;
                viewModel.ApplicationOrServer = "Application";
                //return View("/Dependencies/Application/Index",viewModel);
            }
            else if (AppOrServer == "Server")
            {
                //it's a server

                //grab the application
                Server server = ServerRepo.GetServer(id);

                //grab it's dependencies
                IEnumerable<ApplicationPortfolio.Domain.DataConnections.ApplicationServerDependency> dependencies = DependRepo.GetDependenciesForServer(id);

                //now put everything inside the model
                viewModel.Server = server;
                viewModel.dependencies = dependencies;
                viewModel.ApplicationOrServer = "Server";
               // return View("/Dependencies/Server/Index", viewModel);
            }

            return View(viewModel);
        }

       public ActionResult CreateAppDependency(Guid id)
        {
            var viewmodel = new CreateAppDependencyViewModel();
            var tempApp = new ApplicationPortfolio.Domain.DataConnections.Application();
            tempApp.ApplicationId = id;
            viewmodel.App = tempApp;
            
            viewmodel.Servers = ServerRepo.GetAllServers();

            return View(viewmodel);
        }

        [HttpPost]
        public ActionResult CreateAppDependency(CreateAppDependencyViewModel createAppDependencyViewModel)
        {
            try
            {
                    ApplicationServerDependency applicationServerDependency = new ApplicationServerDependency();
                    applicationServerDependency.ServerId = createAppDependencyViewModel.SelectedServerId;
                    applicationServerDependency.ApplicationId = createAppDependencyViewModel.App.ApplicationId;


                    var result = DependRepo.CreateDependency(applicationServerDependency);
                    if (result == "Success")
                    {
                        return RedirectToAction("Details", new { id = createAppDependencyViewModel.App.ApplicationId, AppOrServer="Application" });
                    }
               
                return View(createAppDependencyViewModel);
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Dependencies/Create

        public ActionResult CreateServerDependency(Guid id)
        {
            var viewmodel = new CreateServerDependencyViewModel();
            var tempServer = new ApplicationPortfolio.Domain.DataConnections.Server();
            tempServer.ServerId = id;
            viewmodel.Server = tempServer;

            viewmodel.Applications = AppRepo.GetAllApplications();

            return View(viewmodel);
        }

        //
        // POST: /Dependencies/Create

        [HttpPost]
        public ActionResult CreateServerDependency(CreateServerDependencyViewModel createServerDependencyViewModel)
        {
            try
            {
                ApplicationServerDependency applicationServerDependency = new ApplicationServerDependency();
                applicationServerDependency.ApplicationId = createServerDependencyViewModel.SelectedApplicationId;
                applicationServerDependency.ServerId = createServerDependencyViewModel.Server.ServerId;


                var result = DependRepo.CreateDependency(applicationServerDependency);
                if (result == "Success")
                {
                    return RedirectToAction("Details", new { id = createServerDependencyViewModel.Server.ServerId, AppOrServer = "Server" });
                }

                return View(createServerDependencyViewModel);
            }
            catch
            {
                return View();
            }
        }

        public ActionResult DeleteAppDependency(int id)
        {
            ApplicationServerDependency applicationServerDependency = DependRepo.GetDependency(id);
            if (applicationServerDependency == null)
            {
                return HttpNotFound();
            }
            return View("DeleteAppDependency", applicationServerDependency);
        }

        //
        // POST: /Application/Delete/5

        [HttpPost, ActionName("DeleteAppDependency")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteAppDependencyConfirmed(int id)
        {
            ApplicationServerDependency applicationServerDependency = DependRepo.GetDependency(id);
            DependRepo.DeleteDependency(applicationServerDependency);
            return RedirectToAction("Details", new { id = applicationServerDependency.ApplicationId, AppOrServer = "Application" });
        }



        public ActionResult DeleteServerDependency(int id)
        {
            ApplicationServerDependency applicationServerDependency = DependRepo.GetDependency(id);
            if (applicationServerDependency == null)
            {
                return HttpNotFound();
            }
            return View("DeleteServerDependency", applicationServerDependency);
        }

        //
        // POST: /Application/Delete/5

        [HttpPost, ActionName("DeleteServerDependency")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteServerDependencyConfirmed(int id)
        {
            ApplicationServerDependency applicationServerDependency = DependRepo.GetDependency(id);
            DependRepo.DeleteDependency(applicationServerDependency);
            return RedirectToAction("Details", new { id = applicationServerDependency.ServerId, AppOrServer = "Server" });
        }

    }
}
