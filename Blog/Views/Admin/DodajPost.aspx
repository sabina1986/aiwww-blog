<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Blog.Models.PostNew>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DodajPost
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Dodaj post</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Pola</legend>
            
            <div class="editor-label">
                <%= Html.Label("ID posta") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.id) %>
                <%= Html.ValidationMessageFor(model => model.id) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Data dodania posta") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.data_dodania) %>
                <%= Html.ValidationMessageFor(model => model.data_dodania) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Tytuł posta")%>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.tytul) %>
                <%= Html.ValidationMessageFor(model => model.tytul) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Treść posta") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.tresc) %>
                <%= Html.ValidationMessageFor(model => model.tresc) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Status posta") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.status) %>
                <%= Html.ValidationMessageFor(model => model.status) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Data modyfikacji") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.data_modyfikacji) %>
                <%= Html.ValidationMessageFor(model => model.data_modyfikacji) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Słowa kluczowe") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.keywords) %>
                <%= Html.ValidationMessageFor(model => model.keywords) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Opis") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.description) %>
                <%= Html.ValidationMessageFor(model => model.description) %>
            </div>
            
            <p>
                <input type="submit" value="Dodaj post" />
            </p>
        </fieldset>

    <% } %>

    <h2>
        <%= ViewData["action"] %>
    </h2>

    <div>
        <%= Html.ActionLink("Home", "Index", "Home") %>
    </div>

</asp:Content>

