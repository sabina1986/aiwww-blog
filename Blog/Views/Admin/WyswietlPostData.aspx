<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Blog.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	WyswietlPostData
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>WyswietlPostData</h2>

    <% foreach (Post m in (IEnumerable)ViewData.Model)

          { %>
                <%= m.tytul %> <br />
                <%= m.tresc %>
          <% } %>

<%--    <fieldset>
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
    <p>

        <%= Html.ActionLink("Edit", "Edit", new { id=Model.id }) %> |
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>--%>

</asp:Content>

