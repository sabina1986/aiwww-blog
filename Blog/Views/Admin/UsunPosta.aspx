<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Blog.Models.Post>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UsunPosta
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Usuń posta</h2>

    <h3>Czy jesteś pewien, że chcesz usunąć ten post ?</h3>
    <fieldset>
        <legend>Pola</legend>
        
        <div class="display-label">ID posta</div>
        <div class="display-field"><%= Html.Encode(Model.id) %></div>
        
        <div class="display-label">Tytuł</div>
        <div class="display-field"><%= Html.Encode(Model.tytul) %></div>
        
        <div class="display-label">Treść</div>
        <div class="display-field"><%= Html.Encode(Model.tresc) %></div>
        
        <div class="display-label">Status</div>
        <div class="display-field"><%= Html.Encode(Model.status) %></div>
        
        <div class="display-label">Data dodania</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.data_dodania)) %></div>
        
        <div class="display-label">Data modyfikacji</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.data_modyfikacji)) %></div>
        
    </fieldset>

     <h2>
        <%= ViewData["action"] %>
    </h2>

    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Usuń" /> |
		    <%= Html.ActionLink("Home", "Index", "Home") %>
        </p>
    <% } %>

</asp:Content>

