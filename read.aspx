<%@ Page Title="" Language="C#" MasterPageFile="~/masterPageCRUD.master" AutoEventWireup="true" CodeFile="read.aspx.cs" Inherits="read" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script>
        $(document).ready(function () {
            $(".nav li").removeClass("active");
            $('#read').addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Listado</h1>
</asp:Content>

