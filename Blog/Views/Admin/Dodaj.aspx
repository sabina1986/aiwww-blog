<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Theme="niebieski" Inherits="System.Web.Mvc.ViewPage<Blog.Models.HelperClass>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Dodaj
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="../../Scripts/MicrosoftAjax.js"></script>
<script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
<script src="../../Scripts/MicrosoftMvcValidation.js" type="text/javascript"></script>
    <h2><%= Html.Encode(ViewData["action"]) %></h2>
    
    <h2>Dodaj</h2>
    <% Html.EnableClientValidation(); %>
    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.id) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.id) %>
                <%= Html.ValidationMessageFor(model => model.id) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.data_dodania) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.data_dodania) %>
                <%= Html.ValidationMessageFor(model => model.data_dodania) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Tytul Posta") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.tytul) %>
                <%= Html.ValidationMessageFor(model => model.tytul) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.tresc) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.tresc) %>
                <%= Html.ValidationMessageFor(model => model.tresc) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.status) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.status) %>
                <%= Html.ValidationMessageFor(model => model.status) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.data_modyfikacji) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.data_modyfikacji) %>
                <%= Html.ValidationMessageFor(model => model.data_modyfikacji) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.keywords) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.keywords) %>
                <%= Html.ValidationMessageFor(model => model.keywords) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.description) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.description) %>
                <%= Html.ValidationMessageFor(model => model.description) %>
            </div>
            
            <p>
                <input type="submit" value="Dodaj" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

