using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Clase que permite la conexión a Sql server
/// </summary>
public class sqlConnection {

    SqlConnection localConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["DavidLocal"].ConnectionString); // --> Cadena de conexión definida en el Web.config

    /// <summary>
    /// Método que crea y retorna un dataset a partir del resulato de un procedimiento almacenado o instrucción sql
    /// </summary>
    /// <param name="sqlInstruction"></param>
    /// <returns>Retorna un Dataset</returns>
    public DataSet buildDataset(SqlCommand sqlInstruction) {

        localConnection.Open(); // --> Se abre la conexión

        sqlInstruction.Connection = localConnection; // --> Al comando sql que se pase como parámetro se le asigna la conexión antes establecida

        SqlDataAdapter sqlAdapter = new SqlDataAdapter(); // --> Se define el puente de conexión entre el Dataset y Sql
        sqlAdapter.SelectCommand = sqlInstruction; // --> Se ejecuta la instrucción

        DataSet datasetToReturn = new DataSet(); // --> El dataset que va ser llenado y retornado

        sqlAdapter.Fill(datasetToReturn); // --> Se llena el dataset con el resultado de la ejecución del adaptador (Instrucción pasada por parámetro)

        localConnection.Close(); // --> Se cierra la conexión

        return datasetToReturn; // --> Se retorna el dataset solicitado

    }

    /// <summary>
    /// Método que ejecuta un procedimiento almacenado o instrucción sql
    /// </summary>
    /// <param name="sqlInstruction"></param>
    public int executeInstruction(SqlCommand sqlInstruction) {

        localConnection.Open();
        sqlInstruction.Connection = localConnection;
 
        int rowsAffected = sqlInstruction.ExecuteNonQuery(); // --> Ejecuta la instrucción sql (Realizada para update, insert o delete)
        localConnection.Close();

        return rowsAffected;
    }
}