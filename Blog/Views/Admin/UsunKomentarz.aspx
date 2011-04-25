<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Blog.Models.Komentarze>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UsunKomentarz
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Usuń komentarz</h2>

    <h3>Czy jesteś pewien, że chcesz usunąć ten komentarz ?</h3>
    <fieldset>
        <legend>Pola</legend>
        
        <div class="display-label">ID komentarza</div>
        <div class="display-field"><%= Html.Encode(Model.id_komentarza) %></div>
        
        <div class="display-label">ID posta</div>
        <div class="display-field"><%= Html.Encode(Model.id_posta) %></div>
        
        <div class="display-label">Treść komentarza</div>
        <div class="display-field"><%= Html.Encode(Model.tresc_komentarza) %></div>
        
        <div class="display-label">Autor komentarza</div>
        <div class="display-field"><%= Html.Encode(Model.autor_komentarza) %></div>
        
        <div class="display-label">Data dodania komentarza</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.data_dodania_komentarza)) %></div>
        
        <div class="display-label">Status</div>
        <div class="display-field"><%= Html.Encode(Model.status) %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Usuń" /> |
		    <%= Html.ActionLink("Home", "Index", "Home") %>
        </p>
    <% } %>

</asp:Content>

