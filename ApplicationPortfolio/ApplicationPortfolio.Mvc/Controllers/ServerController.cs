using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ApplicationPortfolio.Domain.DataConnections;

namespace ApplicationPortfolio.Mvc.Controllers
{
    public class ServerController : Controller
    {
        private AppPortfolioEntities db = new AppPortfolioEntities();

        //
        // GET: /Server/

        public ActionResult Index()
        {
            return View(db.Servers.ToList());
        }

        //
        // GET: /Server/Details/5

        public ActionResult Details(Guid id)
        {
            Server server = db.Servers.Find(id);
            if (server == null)
            {
                return HttpNotFound();
            }
            return View(server);
        }

        //
        // GET: /Server/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Server/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Server server)
        {
            if (ModelState.IsValid)
            {
                server.ServerId = Guid.NewGuid();
                db.Servers.Add(server);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(server);
        }

        //
        // GET: /Server/Edit/5

        public ActionResult Edit(Guid id)
        {
            Server server = db.Servers.Find(id);
            if (server == null)
            {
                return HttpNotFound();
            }
            return View(server);
        }

        //
        // POST: /Server/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Server server)
        {
            if (ModelState.IsValid)
            {
                db.Entry(server).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(server);
        }

        //
        // GET: /Server/Delete/5

        public ActionResult Delete(Guid id)
        {
            Server server = db.Servers.Find(id);
            if (server == null)
            {
                return HttpNotFound();
            }
            return View(server);
        }

        //
        // POST: /Server/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Server server = db.Servers.Find(id);
            db.Servers.Remove(server);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}