using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace Blog.Models
{
    [MetadataType(typeof(PostObiektValidate))]
    public class HelperClass
    {
        public int id { get; set; }
        public DateTime data_dodania {get; set;}
        public string tytul{get; set;}
        public string tresc{get; set;}
        public int status{get; set;}
        public DateTime data_modyfikacji{get; set;}
        
        public string keywords{get; set;}
        public string description { get; set; }

        //przepisac pola z tabel polaczonych;)
    }

    [Bind(Exclude="id, status")]
    public class PostObiektValidate
    {
        [RegularExpression(@"[A-za-z ]{3,100}", ErrorMessage = "Niedozwolony znak")]
        [Required(ErrorMessage="Pole wymagane")]
        public string tytul { get; set; }

        [RegularExpression(@"[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]", ErrorMessage = "Wymagany format daty dd-mm-yyyy")]
        [Required(ErrorMessage = "Pole wymagane")]
        public DateTime data_dodania { get; set; }




    }

}