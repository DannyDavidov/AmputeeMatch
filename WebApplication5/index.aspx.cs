/* This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program. If not, see <https://www.gnu.org/licenses/>. */



using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace WebApplication5
{
    public partial class index : System.Web.UI.Page
    {
        //Establishes a connection to the database specified
        string connString = "Server=den1.mssql8.gear.host;" + "Initial Catalog=michael11;"
                        + "User ID=michael11;" + "Password=Po8n!X~5qv3R;" + "Integrated Security=false";
        SqlConnection conn = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Establishes an open connection through a try/catch and proceeds to close after.
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

        /* Function using a dropdownlist of countries to populate a dropdownlist of states or provinces
        based upon the chosen country option */
        protected void Country_SelectedIndexChanged1(object sender, EventArgs e)
        {
            //Creation of a data set to hold information of the the states/provinces
            DataSet dsStates = new DataSet();
            state.Visible = true;
           
            //An if/else statement used to populate states/provinces based upon country chosen
            if (Country.SelectedItem.Value == "1")
            {
                //Try/Catch scheme used to establish a connection to the database for country selected being the USA
                try
                {
                    //Connection used to gather only the number of provinces for the United States and storing it in a dataset
                    conn.ConnectionString = connString;
                    conn.Open();
                    SqlDataAdapter comm = new SqlDataAdapter("SELECT TOP 50 StateID, State FROM tblStateProvince", conn);

                    //Dataset used to store the states into a dataset
                    comm.Fill(dsStates);
                    state.DataSource = dsStates;
                    state.DataValueField = "StateID";
                    state.DataTextField = "State";
                    state.DataBind();

                    //Close the connection and insert the states into the states/provinces dropdownlist
                    conn.Close();
                    state.Items.Insert(0, new ListItem("Select State", "0"));
                    state.SelectedIndex = 0;
                }
                catch (Exception ex)
                {
                    errormsg.InnerText = "Error. Could not connect to database.";
                }
                finally
                {
                    conn.Close();
                }
            }
            else if (Country.SelectedItem.Value == "2")
            {
                //Try/Catch scheme used to establish a connection to the database for country selected being the USA
                try
                {
                    //Connection used to gather only the number of provinces for Canada 
                    conn.ConnectionString = connString;
                    conn.Open();
                    SqlDataAdapter comm = new SqlDataAdapter("SELECT TOP 10 StateID, State FROM tblStateProvince ORDER BY StateID DESC", conn);

                    //Dataset used to store the provinces into a dataset
                    comm.Fill(dsStates);
                    state.DataSource = dsStates;
                    state.DataValueField = "StateID";
                    state.DataTextField = "State";
                    state.DataBind();

                    //Close the connection and insert the provinces into the states/provinces dropdownlist
                    conn.Close();
                    state.Items.Insert(0, new ListItem("Select Province", "0"));
                    state.SelectedIndex = 0;
                }
                catch (Exception ex)
                {
                    errormsg.InnerText = "Error. Could not connect to database."; 
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        //Function used to read data from the db and retrieving data using a stored procedure via a button click
        protected void buttonGo_Click(object sender, EventArgs e)
        {
            //Try/Catch used to establish a connection to the db otherwise it throws out an error
            try
            {
                //Set of code used to establish a connection to the stored procedure
                conn = new SqlConnection(connString);
                SqlCommand cmd = new SqlCommand("AddUserInfo", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "AddUserInfo"
                };

                //Adds user info to the user table
                cmd.Parameters.Add("@spfirstName", SqlDbType.NVarChar).Value = firstName.Text;
                cmd.Parameters.Add("@splastName", SqlDbType.NVarChar).Value = lastName.Text;
                cmd.Parameters.Add("@spEmail", SqlDbType.NVarChar).Value = Email.Text;
                cmd.Parameters.Add("@spStateID", SqlDbType.Int).Value = state.Text;
                cmd.Parameters.Add("@spFoot", SqlDbType.NVarChar).Value = Foot.Text;
                cmd.Parameters.Add("@spGender", SqlDbType.NVarChar).Value = Gender.Text;
                cmd.Parameters.Add("@spSize", SqlDbType.Float).Value = Size.Text;

                //Opens the connection
                conn.Open();

                //String to hold all matched users with user input
                string matchUser = "";

                //Data Reader used to go through the database to find matching users
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    msg1.Text = "Your entry has been stored in our database." + "<br/>";
                    msg2.Text= "Matches Found:" + "<br/>";
                    while (reader.Read())
                    {
                        msg2.Visible = true;
                        matchUser += "Name: ";
                        matchUser += reader["FirstName"].ToString();
                        matchUser += "         ";
                        matchUser += reader["LastName"].ToString();
                        matchUser += " Email: ";
                        matchUser += reader["Email"].ToString();
                        matchUser += "<br/>";
                    }

                    //Closes the reader
                    reader.Close();
                }
                
                //Outputs the matching users to html label
                matchFound.Text = matchUser;
            }
            catch (Exception ex)
            {
                errormsg.InnerText = "Error. Could not connect to database.";
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }
    }
}