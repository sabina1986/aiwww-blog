<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Blog.Models.Post>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UsunPosta
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>UsunPosta</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">id</div>
        <div class="display-field"><%= Html.Encode(Model.id) %></div>
        
        <div class="display-label">tytul</div>
        <div class="display-field"><%= Html.Encode(Model.tytul) %></div>
        
        <div class="display-label">tresc</div>
        <div class="display-field"><%= Html.Encode(Model.tresc) %></div>
        
        <div class="display-label">status</div>
        <div class="display-field"><%= Html.Encode(Model.status) %></div>
        
        <div class="display-label">data_dodania</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.data_dodania)) %></div>
        
        <div class="display-label">data_modyfikacji</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.data_modyfikacji)) %></div>
        
    </fieldset>

     <h2>
        <%= ViewData["action"] %>
    </h2>

    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%= Html.ActionLink("Home", "Index", "Home") %>
        </p>
    <% } %>

</asp:Content>

