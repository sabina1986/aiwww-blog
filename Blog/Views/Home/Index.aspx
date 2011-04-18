<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Blog.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">

     <ul>
          <% foreach (Post m in (IEnumerable)ViewData.Model)

          { %>
               <li> <%= m.tytul %> </li>
          <% } %>
     </ul>

     <!--wstawka-->
     <table>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                Tytul
            </th>
         </tr>

    <% foreach (Post m in (IEnumerable)ViewData.Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edytuj", "EdytujPosta", "Admin", new { id=m.id }, null) %> |
                <%= Html.ActionLink("Komentarz", "DodajKomentarz", "Admin", new { id=m.id }, null ) %> |
                <%= Html.ActionLink("Usun Post", "UsunPosta", "Admin", new { id=m.id }, null ) %> |
                 
               
            </td>
                <td>
                    <%= Html.Encode(m.id) %>
                </td>
            <td>

                <table>
                    <tr>
                        <td>
                            <h1><%= Html.Encode(m.tytul) %></h1><br />
                              <%=Html.Encode(m.tresc) %>
                        </td>
                     </tr>
                
                <% AdminRespository ad = new AdminRespository();
                          Komentarze[] tab=ad.WyswietlKomentarze(m.id);
           
                        if(tab.Length>0)
                        {%>
                    <tr>
                        <td>

                        <table>
                                <tr>
                                    <th></th>
                                    <th> ID</th>
                                    <th> Komentarz</th>
                                </tr>
                                
                                 
                                       <% foreach (Komentarze k in tab)
                                       {%>

                                <tr>

                                    <td>
                                        <%= Html.ActionLink("Usun", "UsunKomentarz", "Admin", new { id=k.id_komentarza }, null) %> |
                                    </td>
                                    <td>
                                            <%=Html.Encode(k.id_komentarza) %>
                                    </td>
                                    <td>
                                       
                                           <%=Html.Encode(k.tresc_komentarza) %>
                                           <br />
                                           <%=Html.Encode("Autor: ") %>
                                           <%=Html.Encode(k.autor_komentarza) %>
                                           <br />
                                           <%=Html.Encode("Data dodania: ") %>
                                           <%=Html.Encode(k.data_dodania_komentarza) %>

                                    
                                    </td>
                                

                                </tr>
                                     <% }%>
                                    
                            </table>
                            
                           
                               
                        </td>
                    </tr>
                    <% }%>        

                </table>
                

            </td>
            
        </tr>
    
    <% } %>

    </table>

     <!--wstawka-->

      <p>
        <%= Html.ActionLink("Dodaj Post", "DodajPost", "Admin") %>
        
     </p>


</asp:Content>




