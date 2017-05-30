using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class read : System.Web.UI.Page {

    public int totalSelectedTeams = 0;
    DataSet OriginalTeamsDataset;

    protected void Page_Load(object sender, EventArgs e) {

        if (Page.IsPostBack == false) {
            getTeams();
        } else {
            OriginalTeamsDataset = (DataSet)ViewState["OriginalTeamsDatasetState"];
        }

    }

    private void getTeams() {
        team teams = new team();
        DataSet returnedTeams = new DataSet();

        returnedTeams = teams.getAllTeams();
        gridViewTeams.DataSource = returnedTeams.Tables[0].DefaultView;
        gridViewTeams.DataBind();

        if (returnedTeams.Tables[0].Rows.Count == 0) {
            this.lblTotalText.Visible = false;
            Response.Write("<script>alert('Aún no hay equipos creados')</script>");
        } else {
            OriginalTeamsDataset = new DataSet();
            OriginalTeamsDataset = returnedTeams;

            this.lblTotalTeams.Text = OriginalTeamsDataset.Tables[0].Rows.Count.ToString();
        }
    }

    protected void Page_PreRender(object sender, System.EventArgs e) {
        this.ViewState.Add("OriginalTeamsDatasetState", OriginalTeamsDataset);
    }

    protected void gridViewTeams_RowCommand(object sender, GridViewCommandEventArgs e) {

        int index;
        team team = new team();

        switch (e.CommandName) {
            case "Delete":
                index = Convert.ToInt16(e.CommandArgument);
                team.deleteTeam(index);
                this.getTeams();
                break;
            case "Update":
                // Primero se formatea la cadena enviada por commandArgument (posición del grid y el id del equipo)
                string[] updateArguments = new string[2];
                int teamId;
                updateArguments = e.CommandArgument.ToString().Split(';');
                index = Convert.ToInt16(updateArguments[0]);
                teamId = Convert.ToInt16(updateArguments[1]);

                // Luego se actualiza
                GridViewRow row = gridViewTeams.Rows[index];
                string teamName = (row.FindControl("txtTeamName") as TextBox).Text;
                string teamFoundation = (row.FindControl("txtTeamFoundation") as TextBox).Text;
                string teamNickname = (row.FindControl("txtTeamNickname") as TextBox).Text;
                string teamStadium = (row.FindControl("txtTeamStadium") as TextBox).Text;

                gridViewTeams.EditIndex = -1;
                team.updateTeam(teamName, int.Parse(teamFoundation), teamNickname, teamStadium, teamId);
                this.getTeams();
                break;
            case "Cancel":
                gridViewTeams.EditIndex = -1;
                this.getTeams();
                break;
            default:
                break;
        }
    }

    protected void gridViewTeams_RowDeleting(object sender, GridViewDeleteEventArgs e) {
        getTeams();
        this.lblInfo.Text = "¡Equipo eliminado!";
        this.lblInfo.CssClass = "label label-success";
    }

    protected void gridViewTeams_RowEditing(object sender, GridViewEditEventArgs e) {
        gridViewTeams.EditIndex = e.NewEditIndex;
        this.getTeams();
    }

    protected void gridViewTeams_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e) {
        this.lblInfo.Text = "¡Edición cancelada!";
        this.lblInfo.CssClass = "label label-danger";
    }

    protected void gridViewTeams_RowUpdating(object sender, GridViewUpdateEventArgs e) {

    }

    public string GridViewSortDirection {

        get {
            object o = ViewState["SortDirection"];
            return ((o == null) ? "ASC" : Convert.ToString(o));
        }
        set { ViewState["SortDirection"] = value; }
    }

    public string GridViewSortExpression {
        get {
            object o = ViewState["SortExpression"];
            return ((o == null) ? string.Empty : Convert.ToString(o));
        }
        set { ViewState["SortExpression"] = value; }
    }

    protected string GetSortDirection() {
        switch ((GridViewSortDirection)) {

            case "ASC":
                GridViewSortDirection = "DESC";

                break;
            case "DESC":
                GridViewSortDirection = "ASC";

                break;
        }

        return GridViewSortDirection;

    }

    protected DataView SortDataTable(DataView teamDataTable, bool isPageIndexChanging) {
        if ((teamDataTable != null)) {
            DataView view = teamDataTable;

            if ((!string.IsNullOrEmpty(GridViewSortExpression))) {
                if ((isPageIndexChanging)) {
                    view.Sort = GridViewSortExpression + " " + GridViewSortDirection;
                } else {
                    view.Sort = GridViewSortExpression + " " + GetSortDirection();

                }
            }
            return view;
        } else {
            return new DataView();
        }
    }

    protected void gridViewTeams_PageIndexChanging(object sender, GridViewPageEventArgs e) {

        gridViewTeams.DataSource = SortDataTable(OriginalTeamsDataset.Tables[0].DefaultView, true);
        gridViewTeams.PageIndex = e.NewPageIndex; // Calcula el número de la página actual
        gridViewTeams.SelectedIndex = -1; // Se resetea el index seleccionado
        gridViewTeams.DataBind();

    }

    protected void gridViewTeams_Sorting(object sender, System.Web.UI.WebControls.GridViewSortEventArgs e) {

        GridViewSortExpression = e.SortExpression;
        int pageIndex = gridViewTeams.PageIndex;
        gridViewTeams.DataSource = SortDataTable(OriginalTeamsDataset.Tables[0].DefaultView, false);
        gridViewTeams.DataBind();
        gridViewTeams.PageIndex = pageIndex;

    }
}