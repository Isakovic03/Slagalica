using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Slagalica
{
    public partial class KoZnaZna : Page
    {
        private int Poeni
        {
            get => (int)(ViewState["i"] ?? 0);
            set => ViewState["i"] = value;
        }

        private int BrojPitanja
        {
            get => (int)(ViewState["brpt"] ?? 0);
            set => ViewState["brpt"] = value;
        }

        private string TacanOdgovor
        {
            get => ViewState["TacanOdgovor"]?.ToString();
            set => ViewState["TacanOdgovor"] = value;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UcitajNasumicnoPitanje();
                Poeni = 0;
                BrojPitanja = 0;
                Session["ubp1"] = 0;
            }
        }

        private static void Shuffle<T>(List<T> lista)
        {
            Random rng = new Random();
            int n = lista.Count;
            while (n > 1)
            {
                n--;
                int k = rng.Next(n + 1);
                (lista[n], lista[k]) = (lista[k], lista[n]);
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

                        List<string> odgovori = new List<string>
                        {
                            reader["Tnodgovor"].ToString(),
                            reader["Nnodgovor1"].ToString(),
                            reader["Nnodgovor2"].ToString(),
                            reader["Nnodgovor3"].ToString()
                        };

                        Shuffle(odgovori);

                        btnOption1.Text = odgovori[0];
                        btnOption2.Text = odgovori[1];
                        btnOption3.Text = odgovori[2];
                        btnOption4.Text = odgovori[3];

                        TacanOdgovor = reader["Tnodgovor"].ToString();
                    }
                }
            }
        }

        protected void OptionClicked(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            string izabraniOdgovor = clickedButton.Text;

            if (BrojPitanja < 10)
            {
                if (izabraniOdgovor == TacanOdgovor)
                {
                    Poeni += 10;
                }
                else
                {
                    Poeni -= 4;
                }

                lblPoeni.Text = "Poeni: " + Poeni;
                BrojPitanja++;
            }

            if (BrojPitanja >= 10)
            {
                kzz.Visible = false;
                kzz2.Visible = false;
                nextgame.Visible = true;
                lblUkupniPoeni.Text = "Ukupan broj poena: " + Poeni;
                Session["ubp1"] = Poeni;
            }

            UcitajNasumicnoPitanje();
        }

        protected void SkipQuestion(object sender, EventArgs e)
        {
            BrojPitanja++;

            if (BrojPitanja >= 10)
            {
                kzz.Visible = false;
                kzz2.Visible = false;
                nextgame.Visible = true;
                lblUkupniPoeni.Text = "Ukupan broj poena: " + Poeni;
                Session["ubp1"] = Poeni;
            }

            UcitajNasumicnoPitanje();
        }
    }
}
