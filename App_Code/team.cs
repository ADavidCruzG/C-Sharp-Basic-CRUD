using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Clase para manejo de equipos de fútbol
/// </summary>
public class team {
    public static sqlConnection connection = new sqlConnection();

    public DataSet getAllTeams() {

        SqlCommand sqlInstruction = new SqlCommand();
        DataSet teams = new DataSet();

        sqlInstruction.CommandText = "Sel_TeamAll";
        sqlInstruction.CommandType = CommandType.StoredProcedure;

        teams = connection.buildDataset(sqlInstruction);

        return teams;
    }

    public int createTeam(string name, int foundationYear, string nickname, string stadiumName) {

        SqlCommand sqlInstruction = new SqlCommand();
        int affectedRows;

        sqlInstruction.CommandText = "Cre_TeamCreate";
        sqlInstruction.CommandType = CommandType.StoredProcedure;
        sqlInstruction.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = name;
        sqlInstruction.Parameters.Add("@foundationYear", SqlDbType.Int, 4).Value = foundationYear;
        sqlInstruction.Parameters.Add("@nickname", SqlDbType.NVarChar, 50).Value = nickname;
        sqlInstruction.Parameters.Add("@stadiumName", SqlDbType.NVarChar, 50).Value = stadiumName;

        affectedRows = connection.executeInstruction(sqlInstruction);

        return affectedRows;
    }

    public DataSet getTeamById(int teamId) {

        SqlCommand sqlInstruction = new SqlCommand();
        DataSet team = new DataSet();

        sqlInstruction.CommandText = "Sel_TeamById";
        sqlInstruction.CommandType = CommandType.StoredProcedure;
        sqlInstruction.Parameters.Add("@id", SqlDbType.Int, 4).Value = teamId;

        team = connection.buildDataset(sqlInstruction);

        return team;
    }

    public int updateTeam(string name, int foundationYear, string nickname, string stadiumName, int teamId) {

        SqlCommand sqlInstruction = new SqlCommand();
        int affectedRows;

        sqlInstruction.CommandText = "Upd_TeamUpdate";
        sqlInstruction.CommandType = CommandType.StoredProcedure;
        sqlInstruction.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = name;
        sqlInstruction.Parameters.Add("@foundationYear", SqlDbType.Int, 4).Value = foundationYear;
        sqlInstruction.Parameters.Add("@nickname", SqlDbType.NVarChar, 50).Value = nickname;
        sqlInstruction.Parameters.Add("@stadiumName", SqlDbType.NVarChar, 50).Value = stadiumName;
        sqlInstruction.Parameters.Add("@id", SqlDbType.Int, 4).Value = teamId;

        affectedRows = connection.executeInstruction(sqlInstruction);

        return affectedRows;
    }

    public int deleteTeam(int teamId) {

        SqlCommand sqlInstruction = new SqlCommand();
        int affectedRows;

        sqlInstruction.CommandText = "Del_TeamDelete";
        sqlInstruction.CommandType = CommandType.StoredProcedure;
        sqlInstruction.Parameters.Add("@id", SqlDbType.Int, 4).Value = teamId;

        affectedRows = connection.executeInstruction(sqlInstruction);

        return affectedRows;
    }
}