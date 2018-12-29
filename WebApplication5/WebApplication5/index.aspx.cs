using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

namespace WebApplication5
{
    public partial class index : System.Web.UI.Page
    {
        string connString = "Server=den1.mssql8.gear.host;" + "Initial Catalog=michael11;"
                        + "User ID=michael11;" + "Password=Po8n!X~5qv3R;" + "Integrated Security=false";
        SqlConnection conn = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                
                conn.ConnectionString = connString;
                conn.Open();
            }
            catch (Exception ex)
            {
                errormsg.InnerText = "Error. Connection lost.";
            }
            conn.Close();
        }

   
        protected void State_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Country_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string stateResult = "";
            //DataTable states = new DataTable();
            if (Country.SelectedItem.Value == "1")
            {
                try
                {
                    conn.ConnectionString = connString;
                    conn.Open();
                    SqlCommand comm = new SqlCommand("SELECT State FROM tblStateProvince;", conn);
                    SqlDataReader reader = comm.ExecuteReader();

                    

                    while (reader.Read())
                    {

                        stateResult += reader[1].ToString();
                        

                    }
                    divResult.InnerHtml = stateResult + "<br />";

                }
                catch (Exception ex)
                {
                    errormsg.InnerText = "Errrrorrrrrr.";
                }
                finally
                {
                    conn.Close();
                }
            }



            //state.Items.Add(new ListItem("All Record","1"));


            else if (Country.SelectedItem.Value == "2")
            {
                errormsg.InnerHtml = "fuckyou";
            }

        }
    }
}