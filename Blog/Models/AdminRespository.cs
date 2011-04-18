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
       

        //funkcja dodawania posta
        public bool DodajPosta(PostNew new_post)
        {
            try
            {
                Post post = new Post();
                post.data_dodania = new_post.data_dodania;
                post.data_modyfikacji = new_post.data_modyfikacji;
                post.status = 0;
                post.tresc = new_post.tresc;
                post.tytul = new_post.tytul;

                db.Posts.InsertOnSubmit(post);
                db.SubmitChanges();


                Tagi tag = new Tagi();
                tag.id_post = post.id;
                tag.description = new_post.description;
                tag.keywords = new_post.keywords;

                db.Tagis.InsertOnSubmit(tag);
                db.SubmitChanges();

                return true;
            }
            catch 
            {
                return false;
            }


        }

        public Komentarze KomentarzDoPost(int id_post)
        {
            Komentarze komentarz = new Komentarze();
            komentarz.id_posta = id_post;
            komentarz.data_dodania_komentarza = DateTime.Now;
            return komentarz;
        }

        //funkcja dodawania komentarza
        public bool DodajKomentarz(int id_post, Komentarze new_komentarz)
        {
            try
            {

                Komentarze komentarz = KomentarzDoPost(id_post);
                komentarz.id_komentarza = new_komentarz.id_komentarza;
                
                //komentarz.id_posta = new_komentarz.id_posta;
                komentarz.id_posta = id_post;

                komentarz.tresc_komentarza = new_komentarz.tresc_komentarza;
                komentarz.autor_komentarza = new_komentarz.autor_komentarza;
                komentarz.data_dodania_komentarza = DateTime.Now;// new_komentarz.data_dodania_komentarza;
                komentarz.status = new_komentarz.status;

                db.Komentarzes.InsertOnSubmit(komentarz);
                db.SubmitChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public Komentarze UsunDoKomentarzaIdKomentarz(int id)
        {
            Komentarze deleteKomentarz = (from m in db.Komentarzes where m.id_komentarza == id select m).First();
            return deleteKomentarz;
        }

        public bool UsunKomentarz(int id)
        {
             Komentarze deleteKomentarz= UsunDoKomentarzaIdKomentarz(id);
                    
            try
            {
                        
               db.Komentarzes.DeleteOnSubmit(deleteKomentarz);
               db.SubmitChanges();
               return true;
            }
            catch
            {
               return false;
            }
          
        }

        
       public Post Edytuj(int id)
       {
           Post post = (from m in db.Posts where m.id == id select m).First();
           return post;
       }

        //funkcja edytowania posta
        public bool EdytujPosta(int id, Post edit_post)
        {

            try
            {
                //Post oryginalPost = (from m in db.Posts where m.id == id select m).First();
                Post oryginalPost = Edytuj(id);
             
                //oryginalPost.id=oryginalPost.id;
                //oryginalPost.data_dodania=oryginalPost.data_dodania;

                oryginalPost.data_modyfikacji = System.DateTime.Now;
                oryginalPost.tytul= edit_post.tytul;
                oryginalPost.tresc = edit_post.tresc;
                oryginalPost.status = edit_post.status;

                //db.Posts.InsertOnSubmit(oryginalPost);
                db.SubmitChanges();

               return true;

               
            }
            catch 
            {
                return false;
            }

        }

        public Post UsunDoPost(int id)
        {
            Post post = (from m in db.Posts where m.id == id select m).First();
            return post;
        }

        public Tagi UsunDoTagi(int id)
        {
            Tagi deleteTag = (from m in db.Tagis where m.id_post == id select m).First();
            return deleteTag;
        }

        public Komentarze UsunDoKomentarze(int id)
        {
            Komentarze deleteKomentarz = (from m in db.Komentarzes where m.id_posta == id select m).First();
            return deleteKomentarz;
        }


        public bool UsunPosta(int id)
        {

            try
            {

                Tagi deleteTag = null;
                do
                {
                    try
                    {
                        deleteTag = UsunDoTagi(id);

                        db.Tagis.DeleteOnSubmit(deleteTag);
                        db.SubmitChanges();
                    }
                    catch
                    {
                        deleteTag = null;
                    }
                    
                } while (deleteTag != null);
                


                Komentarze deleteKomentarz = null;
                do
                {
                    try
                    {
                        deleteKomentarz = UsunDoKomentarze(id);
                        db.Komentarzes.DeleteOnSubmit(deleteKomentarz);
                        db.SubmitChanges();
                    }
                    catch
                    {
                        deleteKomentarz = null;
                    }

                } while (deleteKomentarz != null);

                Post deletePost = UsunDoPost(id);
             
                db.Posts.DeleteOnSubmit(deletePost);
                db.SubmitChanges();

               


                return true;


            }
            catch
            {
                return false;
            }

        }

        public Komentarze[] WyswietlKomentarze(int id_post)
        {
            Komentarze[] komentarz = (from m in db.Komentarzes where m.id_posta == id_post select m).ToArray();
            return komentarz;
        }

    }
}