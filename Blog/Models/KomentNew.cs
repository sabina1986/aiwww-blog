using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace Blog.Models
{
    [MetadataType(typeof(KomentObiektValidate))]
    public class KomentNew
    {
        public int id { get; set; }
        public int id_posta { get; set; }
        public string tresc { get; set; }
        public string autor { get; set; }
        public DateTime data_dodania { get; set; }
        public int status { get; set; }
        /*
        public string keywords { get; set; }
        public string description { get; set; }
        */
        //przepisac pola z tabel polaczonych;)
    }

    [Bind(Exclude = "id, status")]
    public class KomentObiektValidate
    {
        [RegularExpression(@"[A-za-z ]{1, 5}", ErrorMessage = "Niedozwolony znak")]
        [Required(ErrorMessage = "Pole wymagane")]
        public string autor { get; set; }

        [RegularExpression(@"[A-za-z 0-9]{3,100}", ErrorMessage = "Niedozwolony znak")]
        [Required(ErrorMessage = "Pole wymagane")]
        public string tresc { get; set; }

        //[RegularExpression(@"[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]", ErrorMessage = "Wymagany format daty dd-mm-yyyy")]
        //[RegularExpression(@"[0-9]{2}-[0-9]{2}-[0-9]{4}", ErrorMessage = "Wymagany format daty dd-mm-yyyy")]
        [Required(ErrorMessage = "Pole wymagane")]
        public DateTime data_dodania { get; set; }
        
        [RegularExpression(@"[0-1]", ErrorMessage = "Niedozwolony znak")]
        [Required(ErrorMessage = "Pole wymagane")]
        public string status { get; set; }

    }

}