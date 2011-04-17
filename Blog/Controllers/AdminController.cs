using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.Models;

namespace Blog.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        BlogDataDataContext db = new BlogDataDataContext();

        AdminRespository db_admin = new AdminRespository();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Dodaj()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Dodaj(HelperClass obiekt)
        {
            if (db_admin.DodajPosta(obiekt))
            {
                ViewData["action"] = "Post zostal dodany ;)";
            }
            else
            {
                ViewData["action"] = "Post nie zostal dodany ;(";
            }
            return View(obiekt);
        }

        /*[HttpPost]
        public ActionResult Edytuj()*/

        public ActionResult Edytuj(int id) //w argumencie jedna wartosc
        {

           // ViewData["post"]=db_admin.edytuj(id);
            var oryginalPost = (from m in db.Posts where m.id == id select m).First();
            var oryginalTag = (from m in db.Tagis where m.id_post == id select m).First();
            
            HelperClass oryginal = new HelperClass();
            oryginal.id = oryginalPost.id;
            oryginal.data_dodania = oryginalPost.data_dodania;
            oryginal.data_modyfikacji = oryginalPost.data_modyfikacji;
            oryginal.tresc = oryginalPost.tresc;
            oryginal.tytul = oryginalPost.tytul;
            oryginal.status = oryginalPost.status;

            oryginal.description=oryginalTag.description;
            oryginal.keywords=oryginalTag.keywords;

            return View(oryginal);
            //return 
        }

        [HttpPost]
        public ActionResult Edytuj(Post postToEdit, HelperClass obiekt)
        {
            
            if (db_admin.EdytujPosta(postToEdit.id, obiekt))
            {
                ViewData["action"] = "Post zostal zedytowany ;)";
            }
            else
            {
                ViewData["action"] = "Post nie zostal zedytowany ;(";
            }
            return View(obiekt);
        }

        /*public ActionResult Edit(int id)
        {
            var movieToEdit = (from m in _db.Movies where m.ID == id select m).First();
            return View(movieToEdit);
        }

        //
        // POST: /Home/Edit/5

        [HttpPost]
        public ActionResult Edit(Movie movieToEdit)
        {
            var oryginalMovie = (from m in _db.Movies where m.ID == movieToEdit.ID select m).First();

            if (!ModelState.IsValid)
                return View(oryginalMovie);

            _db.ApplyPropertyChanges(oryginalMovie.EntityKey.EntitySetName, movieToEdit);
            _db.SaveChanges();

            return RedirectToAction("Index");
         }*/

    
    }
}
