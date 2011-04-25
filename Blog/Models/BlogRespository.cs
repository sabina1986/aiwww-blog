using System.Collections.Generic;
using System.Linq;

namespace Blog.Models
{
    public class BlogRespository :IBlogRepository
    {
        private BlogDataDataContext _db;

        public BlogRespository()
        {
            _db = new BlogDataDataContext();
        }

        #region IBlogRespository Members

        public IList<Post> ListAll()
        {
            var posts = from m in _db.Posts
                        select m;

            return posts.ToList();
        }

        #endregion

    }
}

