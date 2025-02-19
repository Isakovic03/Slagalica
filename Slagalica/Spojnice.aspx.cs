using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace Slagalica
{
    public partial class Spojnice : System.Web.UI.Page
    {
        private int Poeni
        {
            get { return ViewState["poeni"] != null ? (int)ViewState["poeni"] : 0; }
            set { ViewState["poeni"] = value; }
        }

        private int BrojPogodaka
        {
            get { return ViewState["br"] != null ? (int)ViewState["br"] : 0; }
            set { ViewState["br"] = value; }
        }

        private string LevaStrana
        {
            get { return ViewState["ls"] as string ?? ""; }
            set { ViewState["ls"] = value; }
        }

        private string LevaDugmadID
        {
            get { return ViewState["levaBtn"] as string ?? ""; }
            set { ViewState["levaBtn"] = value; }
        }

        private int LeviKlik
        {
            get { return ViewState["LeviKlik"] != null ? (int)ViewState["LeviKlik"] : 0; }
            set { ViewState["LeviKlik"] = value; }
        }

        private string[] TacniOdgovori
        {
            get { return (string[])ViewState["tacniodg"] ?? new string[8]; }
            set { ViewState["tacniodg"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Nasumicno();
                Poeni = 0;
                BrojPogodaka = 0;
                Session["ubp2"] = 0;
            }

        }
        private static void Zamena<T>(List<T> lista, Random rng)
        {
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
                            TacniOdgovori = leva.Zip(desna, (l, d) => l + d).ToArray();


                            Random rng = new Random();
                            Zamena(leva, rng);
                            Zamena(desna, rng);
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
        
        protected void GameButtonClicked1(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            LevaStrana= clickedButton.Text;
            LevaDugmadID = clickedButton.ID;
            LeviKlik = 0;
        }

        protected void GameButtonClicked2(object sender, EventArgs e)
        {
            if (LeviKlik == 1)
            {
                return;
            }
            Button clickedButton = (Button)sender;
            string desnastrana = clickedButton.Text;
            Button levaBtn = (Button)FindControl(LevaDugmadID);
            
            for (int i = 0; i < TacniOdgovori.Length; i++)
            {
                
                if (LevaStrana + desnastrana == TacniOdgovori[i])
                {

                    Poeni = Poeni + 4;
                    clickedButton.CssClass = "correct-answer";
                    levaBtn.CssClass = "correct-answer";
                    levaBtn.Enabled = false;
                    LeviKlik = 1;
                    BrojPogodaka++;
                    break;
                }
                
            }
            if(levaBtn.Enabled != false)
            {
                levaBtn.CssClass = "not-correct-answer";
                levaBtn.Enabled = false;
                LeviKlik = 1;
                BrojPogodaka++;
            }
            if(BrojPogodaka == 8)
            {
                Session["ubp2"] = Poeni.ToString();
                lblUkupniPoeni.Text = "Ukupan broj poena: " + Poeni;
                sp.Visible = false;
                nextgame.Visible = true;
            }
            
        }

    }
}