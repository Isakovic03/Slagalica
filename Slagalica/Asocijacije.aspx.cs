using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Slagalica
{
    public partial class Asocijacije : System.Web.UI.Page
    {
        private List<string> kolA;
        private List<string> kolB;
        private List<string> kolC;
        private List<string> kolD;
        private List<string> kolone;
        string konacno="";
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ubp3"] = 0;
            txtKonacno.Enabled = false;
            Nasumicno();
        }
        protected void Nasumicno()
        {
            string connString = "Data Source=DESKTOP-RP1BINM\\SQLEXPRESS;Initial Catalog=Slagalica;Integrated Security=True;Connect Timeout=30;";
            string query = "SELECT TOP 1 * FROM Asocijacije ORDER BY NEWID()";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            kolA = new List<string>()
                            {
                                dr["a1"].ToString(),
                                dr["a2"].ToString(),
                                dr["a3"].ToString(),
                                dr["a4"].ToString(),
                            };
                            kolB = new List<string>()
                            {
                                dr["b1"].ToString(),
                                dr["b2"].ToString(),
                                dr["b3"].ToString(),
                                dr["b4"].ToString(),
                            };
                            kolC = new List<string>()
                            {
                                dr["c1"].ToString(),
                                dr["c2"].ToString(),
                                dr["c3"].ToString(),
                                dr["c4"].ToString(),
                            };
                            kolD = new List<string>()
                            {
                                dr["d1"].ToString(),
                                dr["d2"].ToString(),
                                dr["d3"].ToString(),
                                dr["d4"].ToString(),
                            };
                            kolone = new List<string>()
                            {
                                dr["kolonaa"].ToString(),
                                dr["kolonab"].ToString(),
                                dr["kolonac"].ToString(),
                                dr["kolonad"].ToString(),
                            };
                            konacno = dr["konacno"].ToString();
                        }
                    }
                }
            }
        }
        protected void Klik(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            int k = int.Parse(clickedButton.CommandArgument);
            if (k >= 0 && k < 4)
            {
                clickedButton.Text = kolA[k];
            }
            else if (k >= 4 && k < 8)
            {
                clickedButton.Text = kolB[k - 4];
            }
            else if (k >= 8 && k < 12)
            {
                clickedButton.Text = kolC[k - 8];
            }
            else if (k >= 12 && k < 16)
            {
                clickedButton.Text = kolD[k - 12];
            }
        }
        protected void Potvrdi(object sender, EventArgs e)
        {
            int poeni = 40;
            if (txt1.Text.ToLower() == kolone[0].ToLower())
            {
                poeni = poeni - 4;
                opis.Text = poeni.ToString();
                btn1.Text = kolA[0];
                btn5.Text = kolA[1];
                btn9.Text = kolA[2];
                btn13.Text = kolA[3];
                btn1.CssClass = "green-button";
                btn5.CssClass = "green-button";
                btn9.CssClass = "green-button";
                btn13.CssClass = "green-button";
                txt1.CssClass = "green-text-box";
                txt1.Enabled = false;
                txtKonacno.Enabled = true;
            }
            if (txt1.Text.ToLower() != kolone[0].ToLower() && !string.IsNullOrEmpty(txt1.Text))
            {
                txt1.CssClass = "red-text-box";
                txt1.Text = "";
            }
            if (txt2.Text.ToLower() == kolone[1].ToLower())
            {
                poeni = poeni - 4;
                opis.Text = poeni.ToString();
                btn2.Text = kolB[0];
                btn6.Text = kolB[1];
                btn10.Text = kolB[2];
                btn14.Text = kolB[3];
                btn2.CssClass = "green-button";
                btn6.CssClass = "green-button";
                btn10.CssClass = "green-button";
                btn14.CssClass = "green-button";
                txt2.CssClass = "green-text-box";
                txt2.Enabled = false;
                txtKonacno.Enabled = true;
            }
            if (txt2.Text.ToLower() != kolone[1].ToLower() && !string.IsNullOrEmpty(txt2.Text))
            {
                txt2.CssClass = "red-text-box";
                txt2.Text = "";
            }
            if (txt3.Text.ToLower() == kolone[2].ToLower())
            {
                poeni = poeni - 4;
                opis.Text = poeni.ToString();
                btn3.Text = kolC[0];
                btn7.Text = kolC[1];
                btn11.Text = kolC[2];
                btn15.Text = kolC[3];
                btn3.CssClass = "green-button";
                btn7.CssClass = "green-button";
                btn11.CssClass = "green-button";
                btn15.CssClass = "green-button";
                txt3.CssClass = "green-text-box";
                txt3.Enabled = false;
                txtKonacno.Enabled = true;
            }
            if (txt3.Text.ToLower() != kolone[2].ToLower() && !string.IsNullOrEmpty(txt3.Text))
            {
                txt3.CssClass = "red-text-box";
                txt3.Text = "";
            }
            if (txt4.Text.ToLower() == kolone[3].ToLower())
            {
                poeni = poeni - 4;
                opis.Text = poeni.ToString();
                btn4.Text = kolD[0];
                btn8.Text = kolD[1];
                btn12.Text = kolD[2];
                btn16.Text = kolD[3];
                btn4.CssClass = "green-button";
                btn8.CssClass = "green-button";
                btn12.CssClass = "green-button";
                btn16.CssClass = "green-button";
                txt4.CssClass = "green-text-box";
                txt4.Enabled = false;
                txtKonacno.Enabled = true;
            }
            if (txt4.Text.ToLower() != kolone[3].ToLower() && !string.IsNullOrEmpty(txt4.Text))
            {
                txt4.CssClass = "red-text-box";
                txt4.Text = "";
            }
            if (txtKonacno.Text.ToLower() == konacno.ToLower())
            {
                Session["ubp3"] = poeni;
                asocijacije.Visible = false;
                lblUkupniPoeni.Text = "Ukupan broj peona: "+poeni.ToString();
                nextgame.Visible = true;
            }
            if (txtKonacno.Text.ToLower() != konacno.ToLower() && !string.IsNullOrEmpty(txtKonacno.Text))
            {
                txtKonacno.CssClass = "red-text-button";
                txtKonacno.Text = "";
            }

        }
    }
}