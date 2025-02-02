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
                ViewState["i"] = 0;
                ViewState["brpt"] = 0;
                Session["ubp"] = 0;
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
                (lista[n], lista[k]) = (lista[k], lista[n]); // Zamena elemenata mesta
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

                        // Kreiranje liste odgovora
                        List<string> odgovori = new List<string>
                {
                    reader["Tnodgovor"].ToString(), // Tačan odgovor
                    reader["Nnodgovor1"].ToString(),
                    reader["Nnodgovor2"].ToString(),
                    reader["Nnodgovor3"].ToString()
                };

                        // Mešanje odgovora
                        Shuffle(odgovori);

                        // Postavljanje odgovora na dugmad
                        btnOption1.Text = odgovori[0];
                        btnOption2.Text = odgovori[1];
                        btnOption3.Text = odgovori[2];
                        btnOption4.Text = odgovori[3];

                        // Čuvanje tačnog odgovora u ViewState
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
            int i = (int)ViewState["i"];
            int g = (int)ViewState["brpt"];
            if (g < 10)
            {
                if (izabraniOdgovor == tacanOdgovor)
                {

                    i = i + 10;
                    ViewState["i"] = i;
                    lblPoeni.Text = "Poeni: " + ViewState["i"].ToString();
                }
                else
                {
                    i = i - 4;
                    ViewState["i"] = i;
                    lblPoeni.Text = "Poeni: " + ViewState["i"].ToString();
                }
                g++;
                ViewState["brpt"] = g;
            }
            if (g >= 10)
            {
                kzz.Visible = false;
                kzz2.Visible = false;
                nextgame.Visible = true;
                lblUkupniPoeni.Text = "Ukupan broj poena:" + ViewState["i"].ToString();
                Session["ubp"]=ViewState["i"].ToString();
            }
            UcitajNasumicnoPitanje(); // Učitava sledeće pitanje
        }
        protected void SkipQuestion(object sender, EventArgs e)
        {
            
            int g = (int)ViewState["brpt"];
            g++;
            ViewState["brpt"] = g;
            if (g >= 10)
            {
                kzz.Visible = false;
                kzz2.Visible = false;
                nextgame.Visible = true;
                lblUkupniPoeni.Text = "Ukupan broj poena:" + ViewState["i"].ToString();
                Session["ubp"] = ViewState["i"].ToString();
            }
            UcitajNasumicnoPitanje();
        }
    }
}