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
        private string levastrana;
        private string desnastrana;
        private string[] tacan;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Nasumicno();
                ViewState["poeni"] = 0;
                ViewState["br"] = 0;
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

                            tacan = new string[8];
                            for (int i = 0; i < 8; i++)
                            {
                                tacan[i] = leva[i] + desna[i];
                                System.Diagnostics.Debug.WriteLine($"Tacan odgovor {i}: {tacan[i]}");
                            }

                            ViewState["tacniodg"] = tacan;

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
            levastrana = clickedButton.Text;
            ViewState["ls"]= levastrana;
            ViewState["levaBtn"] = clickedButton.ID;
            ViewState["LeviKlik"] = 0;
        }

        protected void GameButtonClicked2(object sender, EventArgs e)
        {
            int lk = (int)ViewState["LeviKlik"];
            if (lk == 1)
            {
                return;
            }
            Button clickedButton = (Button)sender;
            desnastrana = clickedButton.Text;
            Button levaBtn = (Button)FindControl(ViewState["levaBtn"].ToString());
            int br = (int)ViewState["br"];
            int poeni = (int)ViewState["poeni"];
            string lS = ViewState["ls"].ToString();
            string[] to = (string[])ViewState["tacniodg"];
            
            for (int i = 0; i < to.Length; i++)
            {
                
                if (lS + desnastrana == to[i])
                {

                    poeni = poeni + 4;
                    ViewState["poeni"] = poeni;
                    clickedButton.CssClass = "correct-answer";
                    levaBtn.CssClass = "correct-answer";
                    levaBtn.Enabled = false;
                    lk = 1;
                    br++;
                    break;
                }
                
            }
            if(levaBtn.Enabled != false)
            {
                levaBtn.CssClass = "not-correct-answer";
                levaBtn.Enabled = false;
                lk = 1;
                br++;
            }
            ViewState["br"] = br;
            ViewState["LeviKlik"] = 1;
            if(br == 8)
            {
                Session["ubp2"] = ViewState["poeni"].ToString();
                lblUkupniPoeni.Text = "Ukupan broj poena: " + poeni;
                sp.Visible = false;
                nextgame.Visible = true;
            }
            
        }

    }
}