<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Theme="niebieski" Inherits="System.Web.Mvc.ViewPage<Blog.Models.HelperClass>" %>
<%@ Import namespace="Blog.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edytuj
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% Post post = (Post)ViewData["post"]; %>
<!-- dodanie posta i przestrzeni nazw namespace="Blog.Models-->
<!--pole hiden do ukrywania i przesyłąnai danych html(hiden)-->
    <h2>Edytuj</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
             ---
            <div class="editor-label">
                
                <input type="text" value="<%=Model.id.ToString() %>" readonly = "readonly" />
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.id) %>
                <%= Html.ValidationMessageFor(model => model.id) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.data_dodania) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.data_dodania /*String.Format("{0:g}", model.data_dodania)*/) %>
               <!-- <%= Html.ValidationMessageFor(model => model.data_dodania) %>-->
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.tytul) %>
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
                <%= Html.TextBoxFor(model => model.data_modyfikacji/*, String.Format("{0:g}",post.data_modyfikacji)*/) %>
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
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

