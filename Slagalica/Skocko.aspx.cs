using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Slagalica
{
    public partial class Skocko : System.Web.UI.Page
    {
        private int Poeni
        {
            get => (int)(ViewState["poeni"] ?? 35);
            set => ViewState["poeni"] = value;
        }
        private int Brkkomb
        {
            get => (int)(ViewState["brkomb"] ?? 0);
            set => ViewState["brkomb"] = value;
        }
        private int BrDiv
        {
            get => (int)(ViewState["brdiv"] ?? 5);
            set => ViewState["brdiv"] = value;
        }
        private int Brk
        {
            get => (int)(ViewState["brpt"] ?? 1);
            set => ViewState["brpt"] = value;
        }
        private int Brkk
        {
            get => (int)(ViewState["brkk"] ?? 1);
            set => ViewState["brkk"] = value;
        }
        private int[] Kombinacije
        {
            get => (int[])ViewState["Kombinacije"];
            set => ViewState["Kombinacije"] = value;
        }

        private int[] KonacnaKomb
        {
            get => (int[])ViewState["KonacnaKomb"];
            set => ViewState["KonacnaKomb"] = value;
        }
        private HtmlGenericControl div
        {
            get => (HtmlGenericControl)FindControl("Div" + Brkk);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GenerisiKonKomb();
                ViewState["Kombinacije"] = new int[] { 1, 1, 1, 1 };
                Session["ubp4"] = 0;
            }
        }
        private void GenerisiKonKomb()
        {
            Random rnd = new Random();
            int[] kombinacija = new int[4];

            for (int i = 0; i < 4; i++)
            {
                kombinacija[i] = rnd.Next(1, 7); 
            }

            KonacnaKomb = kombinacija;
        }
        protected void Klik(object sender, EventArgs e)
        {
            if(Brkkomb<4)
            {
                Button clickedButton = (Button)sender;
                int k = int.Parse(clickedButton.CommandArgument);
                div.ID = "Div" + Brkk;
                div.InnerHtml = clickedButton.Text;
                Kombinacije[Brkkomb] = k;
                Brkkomb++;
                Brk++;
                Brkk++;
            }

        }
        protected void Potvrdi(object sender, EventArgs e)
        {
            if (Brkkomb == 4)
            {
                if (Kombinacije.SequenceEqual(KonacnaKomb))
                {
                    kviz.Visible = false;
                    nextgame.Visible = true;
                    lblUkupniPoeni.Text = "Ukupno poena:" + Poeni;
                    Session["ubp4"] = Poeni;
                }
                else
                {
                    if (Brk < 43)
                    {
                        int[] niz1 = new int[4];
                        niz1 = (int[])KonacnaKomb.Clone();
                        for (int i = 0; i < 4; i++)
                        {
                            if (Kombinacije[i] == KonacnaKomb[i])
                            {
                                div.ID = "Div" + BrDiv;
                                div.Style["background-color"] = "red";
                                BrDiv++;
                                Kombinacije[i] = 7;
                                KonacnaKomb[i] = 8;
                                Brkk++;
                            }
                        }

                        for (int i = 0; i < 4; i++)
                        {
                            {
                                for (int j = 0; j < 4; j++)
                                {
                                    if (Kombinacije[i] == KonacnaKomb[j])
                                    {
                                        KonacnaKomb[j] = 8;
                                        div.ID = "Div" + BrDiv;
                                        div.Style["background-color"] = "yellow";
                                        BrDiv++;
                                        Brkk++;
                                    }
                                }
                            }
                        }
                        KonacnaKomb = niz1;
                        Poeni--;
                    }
                    else
                    {
                        Poeni = 0;
                        kviz.Visible = false;
                        nextgame.Visible = true;
                        lblUkupniPoeni.Text = "Ukupno poena:" + Poeni;
                        Session["ubp4"] = Poeni;
                    }
                }
                Brk = Brk + 4;
                Brkk = Brk;
                BrDiv = Brk + 4;
                Brkkomb = 0;
            }
        }

        protected void Izbrisi(object sender, EventArgs e)
        {
            if (Brkkomb > 0)
            {
                Brkk--;
                div.ID = "Div" + Brkk;
                div.InnerHtml = "";
                Brk--;
                Brkkomb--;
            }
        }
    }
}