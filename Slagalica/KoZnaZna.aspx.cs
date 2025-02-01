using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Slagalica
{
    public partial class KoZnaZna : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UcitajNasumicnoPitanje();
            }
        }

        private void UcitajNasumicnoPitanje()
        {
            string connString = "Data Source=DESKTOP-RP1BINM\\SQLEXPRESS;Initial Catalog=Slagalica;Integrated Security=True;Connect Timeout=30;";
            string query = "SELECT TOP 1 * FROM Pitanja ORDER BY NEWID()";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        pitanje.Text = reader["Pitanje"].ToString();
                        btnOption1.Text = reader["Tnodgovor"].ToString();
                        btnOption2.Text = reader["Nnodgovor1"].ToString();
                        btnOption3.Text = reader["Nnodgovor2"].ToString();
                        btnOption4.Text = reader["Nnodgovor3"].ToString();

                        ViewState["TacanOdgovor"] = reader["Tnodgovor"].ToString();
                    }
                }
            }
        }

        protected void OptionClicked(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            string izabraniOdgovor = clickedButton.Text;
            string tacanOdgovor = ViewState["TacanOdgovor"].ToString();

            if (izabraniOdgovor == tacanOdgovor)
            {
                int i = 4;
            }
            else
            {
                int i = 0;
            }

            UcitajNasumicnoPitanje(); // Učitava sledeće pitanje
        }
        protected void SkipQuestion(object sender, EventArgs e)
        {

        }
    }
}