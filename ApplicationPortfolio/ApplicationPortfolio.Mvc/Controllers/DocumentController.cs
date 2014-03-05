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
    public class DocumentController : Controller
    {
        ApplicationPortfolio.Domain.DataConnections.Repositories.DocumentRepository DocumentRepo = new DocumentRepository();
        //
        // GET: /Document/

        public ActionResult Index()
        {
            return View(DocumentRepo.GetAllDocuments());
        }

        //
        // GET: /Document/Details/5

        public ActionResult Details(Guid id)
        {
            Document document = DocumentRepo.GetDocument(id);
            if (document == null)
            {
                return HttpNotFound();
            }
            return View(document);
        }

        //
        // GET: /Document/Create

        public ActionResult Create()
        {
            ViewBag.DocumentTypeId = new SelectList(DocumentRepo.GetAllDocumentTypes(), "DocumentTypeId", "Name");
            return View();
        }

        //
        // POST: /Document/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Document document)
        {
            if (ModelState.IsValid)
            {

                DocumentRepo.CreateDocument(document);
                return RedirectToAction("Index");
            }

            ViewBag.DocumentTypeId = new SelectList(DocumentRepo.GetAllDocumentTypes(), "DocumentTypeId", "Name", document.DocumentTypeId);
            return View(document);
        }

        //
        // GET: /Document/Edit/5

        public ActionResult Edit(Guid id)
        {
            Document document = DocumentRepo.GetDocument(id);
            if (document == null)
            {
                return HttpNotFound();
            }
            ViewBag.DocumentTypeId = new SelectList(DocumentRepo.GetAllDocumentTypes(), "DocumentTypeId", "Name", document.DocumentTypeId);
            return View(document);
        }

        //
        // POST: /Document/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Document document)
        {
            if (ModelState.IsValid)
            {
                DocumentRepo.EditDocument(document);
                return RedirectToAction("Index");
            }
            ViewBag.DocumentTypeId = new SelectList(DocumentRepo.GetAllDocumentTypes(), "DocumentTypeId", "Name", document.DocumentTypeId);
            return View(document);
        }

        //
        // GET: /Document/Delete/5

        public ActionResult Delete(Guid id)
        {
            Document document = DocumentRepo.GetDocument(id);
            if (document == null)
            {
                return HttpNotFound();
            }
            return View(document);
        }

        //
        // POST: /Document/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Document document = DocumentRepo.GetDocument(id);

            DocumentRepo.DeleteDocument(document);
            return RedirectToAction("Index");
        }
}
}