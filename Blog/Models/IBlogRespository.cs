using System.Collections.Generic;

namespace Blog.Models
{
    public interface IBlogRepository
    {
       
        IList<Post> ListAll();
    }
}
