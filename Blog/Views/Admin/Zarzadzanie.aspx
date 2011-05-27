<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Blog.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Zarzadzanie
</asp:Content>

<asp:Content ID="zarzadzanieContent2" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript">
    $(function () {
        $("#accordion").accordion({
            autoHeight: false
        }
);
    }
);
</script>

<script type="text/javascript">
 $(document).ready(
 function(){
 $("#more"<% %>).hide();
 $("#link"<% %>).click(
 function(){
 $("#more"<% %>).toggle();
 });
 });

 </script>
 <div id="accordion" style="padding-left: 30px; padding-top: 10px;">
 <% foreach (Post m in (IEnumerable)ViewData.Model) { %>
  
 
    <h2><a href="#" id="link"><%= Html.Encode(m.tytul) %></a></h2>
    <div id="more"><%= Html.Encode(m.tresc) %>
    <br /> <br />
    <div id="klawisze" style="font-size:smaller;">
    <%= Html.ActionLink("Edytuj", "EdytujPosta", "Admin", new { id=m.id }, null) %>
    <%= Html.ActionLink("Usuń post", "UsunPosta", "Admin", new { id=m.id }, null ) %>
    </div>
    <br />
    <hr />
    <h4>    Komentarze :</h4>
    <div id="klawisz" style="font-size:smaller;">
    <%= Html.ActionLink("Dodaj komentarz", "DodajKomentarz", "Admin", new { id=m.id }, null ) %> 
    </div>
    <br /><br />
    <% AdminRespository ad = new AdminRespository();
                          Komentarze[] tab=ad.WyswietlKomentarze(m.id);
           
                        if(tab.Length>0)
                            {%>
    
          <% foreach (Komentarze k in tab)
                                       {%>
             <div id="tresc_k" style="padding-left: 60px; font-size:">
                 <%=Html.Encode(k.tresc_komentarza) %>
                 <br /><br />
                 <div id="v_kom" style="padding-left: 60px; font-size:smaller;">
                 <%=Html.Encode("Autor: ") %>
                 <%=Html.Encode(k.autor_komentarza) %>
                 <br />
                 <%=Html.Encode("Data dodania: ") %>
                 <%=Html.Encode(k.data_dodania_komentarza) %>
                 <br />
                 </div>
             </div>
  
  <% }%>     
  <% }%>

    </div>
 <% } %>
</div>


<br />

    
    <p>
        <%= Html.ActionLink("Dodaj Post", "DodajPost", "Admin") %>
        
     </p> 


</asp:Content>
