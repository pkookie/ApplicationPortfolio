using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Entity;

namespace ApplicationPortfolio.Domain.DataConnections.Repositories
{
    public class ContactRepository
    {
        private AppPortfolioEntities db = new AppPortfolioEntities();

        public IEnumerable<Contact> GetAllContacts()
        {
            return db.Contacts.ToList();
        }

        public Contact GetBusinessCriticality(Guid Id)
        {
            return db.Contacts.Find(Id);
        }

        public String CreateApplication(Contact contact)
        {

            db.Contacts.Add(contact);
            db.SaveChanges();

            return "Success";
        }

        public String EditBusinessCriticality(Contact contact)
        {
            db.Entry(contact).State = EntityState.Modified;
            db.SaveChanges();

            return "Success";
        }

        public String DeleteBusinessCriticality(Contact contact)
        {

            db.Contacts.Remove(contact);
            db.SaveChanges();

            return "Success";
        }
    }
}
