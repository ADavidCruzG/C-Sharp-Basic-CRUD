<%@ Page Title="Listado" Language="C#" MasterPageFile="~/masterPageCRUD.master" AutoEventWireup="true" CodeFile="read.aspx.cs" Inherits="read" %>

<asp:Content ID="localHead" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $(".nav li").removeClass("active");
            $('#read').addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="localContent" ContentPlaceHolderID="mainContent" runat="Server">
    <h1 class="margin-bottom-20"><b>Listado de equipos</b></h1>
    <h6 class="margin-bottom-30">
        <span style="float: left;">
            <asp:Label ID="lblInfo" runat="server" />
        </span>
        <span style="float: right;">
            <asp:Label ID="lblTotalText" runat="server"><b>Total de equipos:</b></asp:Label>
            <asp:Label ID="lblTotalTeams" runat="server" CssClass="label label-warning" />
        </span>
    </h6>
    <br />
    <asp:GridView
        ID="gridViewTeams"
        runat="Server"
        AllowPaging="true"
        AllowSorting="true"
        PageSize="10"
        AutoGenerateColumns="false"
        OnPageIndexChanging="gridViewTeams_PageIndexChanging"
        OnSorting="gridViewTeams_Sorting"
        OnRowDeleting="gridViewTeams_RowDeleting"
        OnRowEditing="gridViewTeams_RowEditing"
        OnRowCancelingEdit="gridViewTeams_RowCancelingEdit"
        OnRowUpdating="gridViewTeams_RowUpdating" 
        PagerSettings-Mode="NumericFirstLast"
        OnRowCommand="gridViewTeams_RowCommand"
        CssClass="table table-bordered table-responsive bs-table">
        <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#ffffcc" BorderStyle="Dotted" />
        <EmptyDataRowStyle ForeColor="Red" CssClass="table table-bordered table-responsive" />
        <EmptyDataTemplate>
            <span class="margin-right-20">¡No hay registros!</span>
                <button id="btnGoToCreation" runat="server" class="btn btn-primary" type="button" onclick="document.location.href = 'create.aspx';">
                    <i class="fa fa-plus"></i>
                    <span class="hidden-xs"><b>Agregar equipo</b></span>
                </button>
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField HeaderText="Nombre <i class='fa fa-sort'></i>" SortExpression="name">
                <ItemTemplate>
                    <asp:Label ID="lblTeamName" runat="server"><%# Eval("name")%></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <span class="input-icon">
                        <asp:TextBox ID="txtTeamName" runat="server" Text='<%# Bind("name")%>' CssClass="form-control"></asp:TextBox>
                        <i class="fa fa-id-card-o"></i>
                    </span>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fundación <i class='fa fa-sort'></i>" SortExpression="foundationYear">
                <ItemTemplate>
                    <asp:Label ID="lblTeamFoundation" runat="server"><%# Eval("foundationYear")%></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <span class="input-icon">
                        <asp:TextBox ID="txtTeamFoundation" runat="server" Text='<%# Bind("foundationYear")%>' CssClass="form-control" required="true" TextMode="Number"></asp:TextBox>
                        <asp:RegularExpressionValidator
                            ID="foundationYearValidator"
                            runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtTeamFoundation"
                            ValidationExpression="^[0-9]{4}$"
                            ErrorMessage="*Escriba el año con 4 dígitos"
                            ForeColor="Red">
                        </asp:RegularExpressionValidator>
                        <i class="fa fa-birthday-cake "></i>
                    </span>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Apodo <i class='fa fa-sort'></i>" SortExpression="nickname">
                <ItemTemplate>
                    <asp:Label ID="lblTeamNickname" runat="server"><%# Eval("nickname")%></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <span class="input-icon">
                        <asp:TextBox ID="txtTeamNickname" runat="server" Text='<%# Bind("nickname")%>' CssClass="form-control"></asp:TextBox>
                        <i class="fa fa-id-card-o"></i>
                    </span>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Estadio <i class='fa fa-sort'></i>" SortExpression="stadiumName">
                <ItemTemplate>
                    <asp:Label ID="lblTeamStadium" runat="server"><%# Eval("stadiumName")%></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <span class="input-icon">
                        <asp:TextBox ID="txtTeamStadium" runat="server" Text='<%# Bind("stadiumName")%>' CssClass="form-control"></asp:TextBox>
                        <i class="fa fa-home"></i>
                    </span>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Opciones">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CausesValidation="False" Text="Eliminar" CssClass="btn btn-danger" CommandName="Delete"
                        CommandArgument='<%# Eval("idTeam") %>' OnClientClick="if(!confirm('¿Desea eliminar el equipo seleccionado?')){return false;}" />
                    <asp:Button ID="btnEdit" runat="server" Text="Editar" CssClass="btn btn-info" CommandName="Edit" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" Text="Guardar" CssClass="btn btn-success" CommandName="Update" CommandArgument='<%# Container.DataItemIndex + ";" + Eval("idTeam") %>' />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn btn-default" CommandName="Cancel" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerSettings
            Mode="NumericFirstLast"
            PageButtonCount="5"
            FirstPageText="Inicio"
            LastPageText="Final"
            Position="Bottom" />
        <PagerStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" VerticalAlign="Bottom" HorizontalAlign="Center" CssClass="gridViewPagerSpace" />
    </asp:GridView>
</asp:Content>

