<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Blog.Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Logowanie
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Zaloguj się</h2>
    <!--<p>
        Please enter your username and password. < %= Html.ActionLink("Register", "Register") %> if you don't have an account.
    </p>-->

    <% using (Html.BeginForm()) { %>
        <%= Html.ValidationSummary() %>
        <div>
            <fieldset>
                <legend>Informacje o koncie</legend>
                
                <div class="editor-label">
                    <%= Html.Label("Nazwa użytkownika :") %>
                </div>
                <div class="editor-field">
                    <%= Html.TextBoxFor(m => m.UserName) %>
                    <%= Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%= Html.Label("Hasło :") %>
                </div>
                <div class="editor-field">
                    <%= Html.PasswordFor(m => m.Password) %>
                    <%= Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%= Html.CheckBoxFor(m => m.RememberMe) %>
                    <%= Html.Label("Zapamiętaj mnie") %>
                </div>
                
                <p>
                    <input id="potwierdzenie" type="submit" value="Zaloguj" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
