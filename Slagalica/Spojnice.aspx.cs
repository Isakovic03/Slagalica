using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Slagalica
{
    public partial class Spojnice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Nasumicno();

        }
        private static void Zamena<T>(List<T> lista)
        {
            Random rng = new Random();
            int n = lista.Count;
            while (n > 1)
            {
                n--;
                int k = rng.Next(n + 1);
                T temp = lista[n];
                lista[n] = lista[k];
                lista[k] = temp;
            }
        }
        protected void Nasumicno()
        {
            string connString = "Data Source=DESKTOP-RP1BINM\\SQLEXPRESS;Initial Catalog=Slagalica;Integrated Security=True;Connect Timeout=30;";
            string query = "SELECT TOP 1 * FROM Spajanje ORDER BY NEWID()";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            opis.Text = reader["opisigre"].ToString();
                            List<string> leva = new List<string>
                            {
                                reader["leva1"].ToString(),
                                reader["leva2"].ToString(),
                                reader["leva3"].ToString(),
                                reader["leva4"].ToString(),
                                reader["leva5"].ToString(),
                                reader["leva6"].ToString(),
                                reader["leva7"].ToString(),
                                reader["leva8"].ToString()
                            };
                            List<string> desna = new List<string>
                            {
                                reader["desna1"].ToString(),
                                reader["desna2"].ToString(),
                                reader["desna3"].ToString(),
                                reader["desna4"].ToString(),
                                reader["desna5"].ToString(),
                                reader["desna6"].ToString(),
                                reader["desna7"].ToString(),
                                reader["desna8"].ToString()
                            };
                            Zamena(leva);
                            Zamena(desna);
                            btn1.Text = leva[0];
                            btn2.Text = desna[0];
                            btn3.Text = leva[1];
                            btn4.Text = desna[1];
                            btn5.Text = leva[2];
                            btn6.Text = desna[2];
                            btn7.Text = leva[3];
                            btn8.Text = desna[3];
                            btn9.Text = leva[4];
                            btn10.Text = desna[4];
                            btn11.Text = leva[5];
                            btn12.Text = desna[5];
                            btn13.Text = leva[6];
                            btn14.Text = desna[6];
                            btn15.Text = leva[7];
                            btn16.Text = desna[7];
                        }
                    }
                }
            }
        }
        protected void GameButtonClicked(object sender, EventArgs e)
        {
            
        }
    }
}