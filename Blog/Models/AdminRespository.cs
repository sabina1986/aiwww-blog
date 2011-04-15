using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Blog.Models
{
    public class AdminRespository
    {
        //tworzymy obiekt bazy danych
        BlogDataDataContext db = new BlogDataDataContext();
       // Post p = new Post();

        //funkcja dodawania posta
        public bool DodajPosta(HelperClass new_obiekt)
        {
            try
            {
                Post post = new Post();
                post.data_dodania = new_obiekt.data_dodania;
                post.data_modyfikacji = new_obiekt.data_modyfikacji;
                post.status = 0;
                post.tresc = new_obiekt.tresc;
                post.tytul = new_obiekt.tytul;

                db.Posts.InsertOnSubmit(post);
                db.SubmitChanges();


                Tagi tag = new Tagi();
                tag.id_post = post.id;
                tag.description = new_obiekt.description;
                tag.keywords = new_obiekt.keywords;

                db.Tagis.InsertOnSubmit(tag);
                db.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }


        }
       /* public Post edytuj(int id)
        {
            return db.Posts.Single(p => p.id = id);
        }*/

       /* public bool zapisz_zmiany(Post new_post)
        {
            try
            {
                Post post = db.Posts.Single(p => p.id == new_post.id);
                post.tytul = new_post.tytul;
                post.tresc = new_post.tresc;
                post.data_modyfikacji = DateTime.Now;

                db.SubmitChanges();
                return true;

            }
            catch
            {
                return false;
            }
        }*/

       

        //funkcja edytowania posta
        public bool EdytujPosta(int id, HelperClass post)
        {

            try
            {
                Post oryginalPost = (from m in db.Posts where m.id == id select m).First();
             
                oryginalPost.id=oryginalPost.id;
                
                oryginalPost.data_dodania=oryginalPost.data_dodania;
                oryginalPost.data_modyfikacji= post.data_modyfikacji;
                oryginalPost.tytul= oryginalPost.tytul;
                oryginalPost.tresc=post.tresc;
                oryginalPost.status= post.status;

                db.Posts.InsertOnSubmit(oryginalPost);
                db.SubmitChanges();

                Tagi oryginalTagi = (from m in db.Tagis where m.id_post == id select m).First();
                oryginalTagi.id_post =id;
                 oryginalTagi.description = post.description;
                oryginalTagi.keywords = post.keywords;

                db.Tagis.InsertOnSubmit(oryginalTagi);
                db.SubmitChanges();
                return true;

               
            }
            catch (Exception e)
            {
                return false;
            }

        }

    }
}