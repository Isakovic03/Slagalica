using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Slagalica
{
    public partial class NajduzaRec : System.Web.UI.Page
    {

        private int BrBtn
        {
            get => (int)(ViewState["brbtn"] ?? 1);
            set => ViewState["brbtn"]=value;
        }
        private int BrBtn2
        {
            get => (int)(ViewState["brbtn2"] ?? 1);
            set => ViewState["brbtn2"] = value;
        }
        private Button GetButton(int index)
        {
            return (Button)updatePanel.FindControl("btn" + index);
        }
        private string[] IzabanButton
        {
            get => (string[])ViewState["ib"];
            set => ViewState["ib"] = value;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["ib"] = new string[12];
                Session["ubp6"] = 0;
            }
        }
        protected void Slovo(object sender, EventArgs e)
        {
            Button clickedButton = sender as Button;
            txtInput.Text = txtInput.Text + clickedButton.Text;
            clickedButton.Enabled = false;
            clickedButton.CssClass = clickedButton.CssClass.Replace("game-btn", "game-btn-gray");
            IzabanButton[BrBtn] = clickedButton.ID;
            BrBtn++;
        }
        protected void Stop(object sender, EventArgs e)
        {
            if (BrBtn <=12)
            {
                Button btn = GetButton(BrBtn);
                Random rnd = new Random();
                string slova = "abcčćdžđefghijklmnoprsštuvz";
                btn.Text = slova[rnd.Next(slova.Length)].ToString().ToUpper();
                BrBtn++;
                
            }
            if(BrBtn>12)
            {
                btnStop.Visible = false;
                btnPotvrdi.Visible = true;
                BrBtn = 0;
                for (int i = 1; i <= 12; i++)
                {
                    Button btn = GetButton(i);
                    btn.Enabled = true;
                }
                btnIzbrisi.Enabled = true;
                
            }
        }
        protected void Potvrdi(object sender, EventArgs e)
        {
            if (txtInput.Text.Length > 0)
            {
                string putanja = Server.MapPath("~/BazaSrpskihReci/serbian-words-latin.txt");
                List<string> listasrpskihreci = File.ReadAllLines(putanja).Select(r => r.ToUpper()).ToList();
                string unetarec = txtInput.Text;
                if (listasrpskihreci.Contains(unetarec))
                {
                    gamecont.Visible = false;
                    nextgame.Visible = true;
                    Session["ubp6"] = unetarec.Length*2;
                    lblUkupniPoeni.Text = "Ukupan broj poena: " + Session["ubp6"].ToString();

                }
                else
                {
                    gamecont.Visible = false;
                    nextgame.Visible = true;
                    Session["ubp6"] = 0;
                    lblUkupniPoeni.Text = "Rec nije pronadjena, ukupan broj poena: " + Session["ubp6"].ToString();

                }
            }

        }
        protected void Izbrisi(object sender, EventArgs e)
        {
            if (BrBtn > 0)
            {
            BrBtn--;
            string lastButtonId = IzabanButton[BrBtn];
            Button btn = GetButton(int.Parse(lastButtonId.Replace("btn", "")));
            btn.Enabled = true;
            btn.CssClass = btn.CssClass.Replace("game-btn-gray", "game-btn");
            txtInput.Text = txtInput.Text.Remove(txtInput.Text.Length - 1);

        }
        }
    }
}