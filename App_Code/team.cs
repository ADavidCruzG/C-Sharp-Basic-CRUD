using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Clase para manejo de equipos de fútbol
/// </summary>
public class team {
    public static sqlConnection connection = new sqlConnection();

    public DataSet getTeamBy(string userEmail) {

        SqlCommand sqlInstruction = new SqlCommand();
        DataSet team = new DataSet();

        sqlInstruction.CommandText = "Sel_TeamBy";
        sqlInstruction.CommandType = CommandType.StoredProcedure;
        sqlInstruction.Parameters.Add("@param,", SqlDbType.NVarChar, 50).Value = userEmail;

        team = connection.buildDataset(sqlInstruction);

        return team;
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
}