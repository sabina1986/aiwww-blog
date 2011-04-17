<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Theme="niebieski" Inherits="System.Web.Mvc.ViewPage" %>
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
                <%= Html.ActionLink("Edytuj", "Edytuj", new { id=m.id }) %> |
               
            </td>
            <td>
                <%= Html.Encode(m.id) %>
            </td>
            <td>
                <h1><%= Html.Encode(m.tytul) %></h1><br />
                <%=Html.Encode(m.tresc) %>

            </td>
            
        </tr>
    
    <% } %>

    </table>

     <!--wstawka-->

      <p>
        <%= Html.ActionLink("Dodaj Post", "Dodaj", "Admin") %>
        
     </p>


</asp:Content>




