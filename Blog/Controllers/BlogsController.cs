using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Blog.Models;


namespace Blog.Controllers
{
    public class BlogsController : Controller
    {
        private IBlogRepository _respository;
 
        public BlogsController() : this(new BlogRespository())
        {
        }
       
        public BlogsController(IBlogRepository respository)
        {
            _respository=respository;
        }

        public ActionResult Index()
        {
            return View(_respository.ListAll());
        }
        

        //
        // GET: /Home/

       

    }
}
