using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Entity;

namespace ApplicationPortfolio.Domain.DataConnections.Repositories
{
    public class DocumentRepository
    {
        private AppPortfolioEntities db = new AppPortfolioEntities();

        //protected override void Dispose(bool disposing)
        //{
        //    db.Dispose();
        //    base.Dispose(disposing);
        //}

        public IEnumerable<Document> GetAllDocuments()
        {
            return db.Documents.ToList();
        }

        public Document GetDocument(Guid Id)
        {
            return db.Documents.Find(Id);
        }

        public String CreateDocument(Document document)
        {
            document.DocumentId = Guid.NewGuid();
            db.Documents.Add(document);
            db.SaveChanges();

            return "Success";
        }

        public String EditDocument(Document document)
        {
            db.Entry(document).State = EntityState.Modified;
            db.SaveChanges();

            return "Success";
        }

        public String DeleteDocument(Document document)
        {

            db.Documents.Remove(document);
            db.SaveChanges();

            return "Success";
        }

        #region Document Types

        public IEnumerable<DocumentType> GetAllDocumentTypes()
        {
            return db.DocumentTypes.ToList();
        }

        public DocumentType GetDocumentType(int Id)
        {
            return db.DocumentTypes.Find(Id);
        }

        public String CreateDocumentType(DocumentType documentType)
        {
            db.DocumentTypes.Add(documentType);
            db.SaveChanges();

            return "Success";
        }

        public String EditDocumentType(DocumentType documentType)
        {
            db.Entry(documentType).State = EntityState.Modified;
            db.SaveChanges();

            return "Success";
        }

        public String DeleteDocumentType(DocumentType documentType)
        {

            db.DocumentTypes.Remove(documentType);
            db.SaveChanges();

            return "Success";
        }

        #endregion

    }
}
