using System;

public partial class create : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }

    protected void createTeam(object sender, EventArgs e) {

        team team = new team();

        team.createTeam(this.txtName.Text, int.Parse(this.txtFoundationYear.Text), this.txtNickname.Text, this.txtStadium.Text);
        Response.Redirect("read.aspx");

    }
}