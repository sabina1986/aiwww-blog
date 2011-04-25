<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Blog.Models.Komentarze>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DodajKomentarz
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Dodaj komentarz</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Pola</legend>
            
            <div class="editor-label">
                <%= Html.Label("ID komentarza") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.id_komentarza) %>
                <%= Html.ValidationMessageFor(model => model.id_komentarza) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("ID posta") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.id_posta) %>
                <%= Html.ValidationMessageFor(model => model.id_posta) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Treść komentarza") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.tresc_komentarza) %>
                <%= Html.ValidationMessageFor(model => model.tresc_komentarza) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Autor komentarza") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.autor_komentarza) %>
                <%= Html.ValidationMessageFor(model => model.autor_komentarza) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Data dodania komentarza") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.data_dodania_komentarza) %>
                <%= Html.ValidationMessageFor(model => model.data_dodania_komentarza) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Status komentarza") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.status) %>
                <%= Html.ValidationMessageFor(model => model.status) %>
            </div>
            
            <p>
                <input type="submit" value="Dodaj komentarz" />
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

