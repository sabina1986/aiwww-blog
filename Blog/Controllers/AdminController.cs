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

        public ActionResult Zarzadzanie()
        {
            var _db = new BlogDataDataContext();
            var posts = from m in _db.Posts
                        select m;
            return View(posts);
            //return View();
        }

        public ActionResult DodajPost()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DodajPost(PostNew obiekt)
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

        public ActionResult DodajKomentarz(int id)
        {
            return View(db_admin.KomentarzDoPost(id));
        }

        [HttpPost]
        public ActionResult DodajKomentarz(int id, Komentarze new_komentarz)
        {
            if (db_admin.DodajKomentarz(id, new_komentarz))
            {
                ViewData["action"] = "Komentarz zostal dodany ;)";
            }
            else
            {
                ViewData["action"] = "Komentarz nie zostal dodany ;(";
            }
            return View(new_komentarz);
        }

        /*[HttpPost]
        public ActionResult Edytuj()*/

        public ActionResult EdytujPosta(int id) //w argumencie jedna wartosc
        {

           // ViewData["post"]=db_admin.edytuj(id);
           // var oryginalPost = (from m in db.Posts where m.id == id select m).First();
           // return View(oryginalPost);            
            return View(db_admin.Edytuj(id));
           
        }

        [HttpPost]
        public ActionResult EdytujPosta(int id, Post obiekt)
        {
            //<input type="text" value="<%=Model.id.ToString() %>" readonly = "readonly" />
            if (db_admin.EdytujPosta(id, obiekt))
            {
                ViewData["action"] = "Post zostal zedytowany ;)";
            }
            else
            {
                ViewData["action"] = "Post nie zostal zedytowany ;(";
            }
            return View(obiekt);
        }

        public ActionResult UsunPosta(int id) //w argumencie jedna wartosc
        {

            // ViewData["post"]=db_admin.edytuj(id);
            // var oryginalPost = (from m in db.Posts where m.id == id select m).First();
            // return View(oryginalPost);            
            return View(db_admin.UsunDoPost(id));

        }

        [HttpPost]
        public ActionResult UsunPosta(int id, Post post)
        {
            //<input type="text" value="<%=Model.id.ToString() %>" readonly = "readonly" />
            if (db_admin.UsunPosta(id))
            {
                ViewData["action"] = "Post zostal usuniety ;)";
            }
            else
            {
                ViewData["action"] = "Post nie zostal usuniety ;(";
            }
            return View(post);
        }

        public ActionResult UsunKomentarz(int id) //w argumencie jedna wartosc
        {

            // ViewData["post"]=db_admin.edytuj(id);
            // var oryginalPost = (from m in db.Posts where m.id == id select m).First();
            // return View(oryginalPost);            
            return View(db_admin.UsunDoKomentarzaIdKomentarz(id));

        }

        [HttpPost]
        public ActionResult UsunKomentarz(int id, Komentarze komentarz)
        {
            //<input type="text" value="<%=Model.id.ToString() %>" readonly = "readonly" />
            if (db_admin.UsunKomentarz(id))
            {
                ViewData["action"] = "Komentarz zostal usuniety ;)";
            }
            else
            {
                ViewData["action"] = "Komentarz nie zostal usuniety ;(";
            }
            return View(komentarz);
        }

       
            
    }
}
