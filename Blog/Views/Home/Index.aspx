<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Blog.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">

<table id="posty" width="1000" border="2px" rules="groups" cellpadding="10" style="border-collapse: collapse;  margin-left: 80px; margin-top: 20px;">
    <tr>
        <th> ID </th>
        <th colspan="2"> Tytuł i treść </th>
    </tr>

    <% foreach (Post m in (IEnumerable)ViewData.Model) { %>
    <tbody  style="background-color: #00ACCC;">
    <tr align="center">
        <td> <%= Html.Encode(m.id) %> </td>
        <td colspan="2"> <h1><%= Html.Encode(m.tytul) %></h1> </td>
    </tr>
    <tr align="center">
        <td colspan="3"> <%=Html.Encode(m.tresc) %> </td> 
    </tr>
    </tbody>
    <tbody >
    <tr align="center">
        <td colspan="3"> <%= Html.ActionLink("Dodaj komentarz", "DodajKomentarz", "Admin", new { id=m.id }, null ) %> </td>
    </tr>
    </tbody>
    <tr>
    <td colspan="3">

<!-- tabelka z komentarzami -->
    <table width="600" border="none" style="float: right;">
    
     <% AdminRespository ad = new AdminRespository();
                          Komentarze[] tab=ad.WyswietlKomentarze(m.id);
           
                        if(tab.Length>0)
                            {%>
    <tr>
        <th> ID </th>
        <th colspan="2"> Treść </th>
    </tr>
          <% foreach (Komentarze k in tab)
                                       {%>
    <tbody style="background-color: #22EC68;">
    <tr align="center">
        <td>
             <%=Html.Encode(k.id_komentarza) %>
        </td>     
        <td colspan="2">
             <%=Html.Encode(k.tresc_komentarza) %>
             <br />
             <%=Html.Encode("Autor: ") %>
             <%=Html.Encode(k.autor_komentarza) %>
             <br />
             <%=Html.Encode("Data dodania: ") %>
             <%=Html.Encode(k.data_dodania_komentarza) %>
        </td> 
    </tr>
    </tbody>
  <% }%>   <% }%>
    </table>
    </td>
    </tr>
     <% } %>

</table>




<br />
---------------------------------------------------------------------------------------------
<br />
     <!--<ul>
          <% foreach (Post m in (IEnumerable)ViewData.Model)

          { %>
               <li> <%= m.tytul %> </li>
          <% } %>
     </ul>-->

     <!--wstawka-->
     <table>
        <tr>
            <th></th>
            <!--<th>
                ID
            </th> -->
            <th>
                Tytul
            </th>
         </tr>

    <% foreach (Post m in (IEnumerable)ViewData.Model) { %>
    
        <tr>
            <td>
               <!-- <%= Html.ActionLink("Edytuj", "EdytujPosta", "Admin", new { id=m.id }, null) %> |-->
                <%= Html.ActionLink("Dodaj Komentarz", "DodajKomentarz", "Admin", new { id=m.id }, null ) %> |
               <!-- <%= Html.ActionLink("Usun Post", "UsunPosta", "Admin", new { id=m.id }, null ) %> |-->
                 
               
            </td>
                <!-- <td>
                    <%= Html.Encode(m.id) %>
                </td> -->
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
                                    <!-- <th></th> -->
                                    <!--<th> ID</th>-->
                                    <th> Komentarz</th>
                                </tr>
                                
                                 
                                       <% foreach (Komentarze k in tab)
                                       {%>

                                <tr>

                                    <!-- <td>
                                        <%= Html.ActionLink("Usun", "UsunKomentarz", "Admin", new { id=k.id_komentarza }, null) %> |
                                    </td> -->
                                    <!-- <td>
                                            <%=Html.Encode(k.id_komentarza) %>
                                    </td> -->
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

      <!-- <p>
        <%= Html.ActionLink("Dodaj Post", "DodajPost", "Admin") %>
        
     </p> -->


</asp:Content>




