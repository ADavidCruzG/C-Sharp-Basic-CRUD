<%@ Page Title="Creación" Language="C#" MasterPageFile="~/masterPageCRUD.master" AutoEventWireup="true" CodeFile="create.aspx.cs" Inherits="create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $(".nav li").removeClass("active");
            $('#create').addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h6 class="text-center">Crear nuevo equipo</h6>
        </div>
        <div class="panel-body">
            <div class="form-group col-sm-6">
                <label class="control-label" for="txtName">Nombre</label>
                <span class="input-icon">
                    <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Nombre" required="true"></asp:TextBox>
                    <i class="fa fa-id-card-o"></i>
                </span>
            </div>
            <div class="form-group col-sm-6">
                <label class="control-label" for="txtNickname">Apodo</label>
                <span class="input-icon">
                    <asp:TextBox ID="txtNickname" runat="server" class="form-control" placeholder="Apodo" required="true"></asp:TextBox>
                    <i class="fa fa-id-card-o"></i>
                </span>
            </div>
            <div class="form-group col-sm-6">
                <label class="control-label" for="txtFoundationYear">Año de fundación</label>
                <span class="input-icon">
                    <asp:TextBox ID="txtFoundationYear" runat="server" class="form-control" placeholder="Año de fundación" required="true" TextMode="Number"></asp:TextBox>
                    <asp:RegularExpressionValidator
                        ID="foundationYearValidator"
                        runat="server"
                        Display="Dynamic"
                        ControlToValidate="txtFoundationYear"
                        ValidationExpression="^[0-9]{4}$"
                        ErrorMessage="*Escriba el año con 4 dígitos"
                        ForeColor="Red">
                    </asp:RegularExpressionValidator>
                    <i class="fa fa-birthday-cake "></i>
                </span>
            </div>
            <div class="form-group col-sm-6">
                <label class="control-label" for="txtStadium">Estadio</label>
                <span class="input-icon">
                    <asp:TextBox ID="txtStadium" runat="server" class="form-control" placeholder="Estadio" required="true"></asp:TextBox>
                    <i class="fa fa fa-home"></i>
                </span>
            </div>
            <div class="form-group text-center  col-sm-12">
                <button id="btnCreate" runat="server" class="btn btn-sm btn-primary" type="submit" onserverclick="createTeam">
                    <i class="fa fa-floppy-o"></i>
                    <span class="hidden-xs"><b>Guardar equipo</b></span>
                </button>
            </div>
        </div>
    </div>
</asp:Content>

