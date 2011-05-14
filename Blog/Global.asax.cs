using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Blog
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );



            routes.MapRoute(
              "WyswietlPostData",
              "{controller}/{WyswietlPostData}/{data}",
              new { controller = "Admin", action = "WyswietlPostData" }
              );
           

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);
        }
    }
}



/*
 
 
 
   <!-- 
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">id</div>
        <div class="display-field"><%= Html.Encode(Model.id) %></div>
        
        <div class="display-label">tytul</div>
        <div class="display-field"><%= Html.Encode(Model.tytul) %></div>
        
        <div class="display-label">tresc</div>
        <div class="display-field"><%= Html.Encode(Model.tresc) %></div>
        
        <div class="display-label">status</div>
        <div class="display-field"><%= Html.Encode(Model.status) %></div>
        
        <div class="display-label">data_dodania</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.data_dodania)) %></div>
        
        <div class="display-label">data_modyfikacji</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.data_modyfikacji)) %></div>
        
    </fieldset>
    <p>

        <%= Html.ActionLink("Edit", "Edit", new { id=Model.id }) %> |
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>-->
 */