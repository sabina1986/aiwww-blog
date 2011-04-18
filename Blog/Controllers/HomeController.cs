using System.Linq;
using System.Web.Mvc;

using Blog.Models;

namespace Blog.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            /*ViewData["Message"] = from m in _db.Posts
                                        select m;
           
            return (ViewData["Message"]);*/

            var _db = new BlogDataDataContext();
            var posts = from m in _db.Posts
                         select m;
            return View(posts);
        }
    }

}
