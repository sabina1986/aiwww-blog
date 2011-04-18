<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Blog.Models.Komentarze>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UsunKomentarz
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>UsunKomentarz</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">id_komentarza</div>
        <div class="display-field"><%= Html.Encode(Model.id_komentarza) %></div>
        
        <div class="display-label">id_posta</div>
        <div class="display-field"><%= Html.Encode(Model.id_posta) %></div>
        
        <div class="display-label">tresc_komentarza</div>
        <div class="display-field"><%= Html.Encode(Model.tresc_komentarza) %></div>
        
        <div class="display-label">autor_komentarza</div>
        <div class="display-field"><%= Html.Encode(Model.autor_komentarza) %></div>
        
        <div class="display-label">data_dodania_komentarza</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.data_dodania_komentarza)) %></div>
        
        <div class="display-label">status</div>
        <div class="display-field"><%= Html.Encode(Model.status) %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%= Html.ActionLink("Home", "Index", "Home") %>
        </p>
    <% } %>

</asp:Content>

