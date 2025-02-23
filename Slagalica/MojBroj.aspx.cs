using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Slagalica
{
    public partial class MojBroj : System.Web.UI.Page
    {
        private int TacanBroj
        {
            get
            {
                int broj1 = int.Parse(((Button)FindControl("btn1")).Text);
                int broj2 = int.Parse(((Button)FindControl("btn2")).Text);
                int broj3 = int.Parse(((Button)FindControl("btn3")).Text);

                return broj1 * 100 + broj2 * 10 + broj3;
            }
        }
        private int BrIB
        {
            get => (int)(ViewState["brib"] ?? 0);
            set => ViewState["brib"] = value;
        }
        private int BrBB
        {
            get => (int)(ViewState["brbb"] ?? 4);
            set => ViewState["brbb"] = value;
        }
        private string[] IzabanButton
        {
            get => (string[])ViewState["ib"];
            set => ViewState["ib"] = value;
        }
        private string[] BrojButton
        {
            get => (string[])ViewState["bb"];
            set => ViewState["bb"] = value;
        }
        private int BrBtn
        {
            get => (int)(ViewState["brbtn"] ?? 1);
            set => ViewState["brbtn"] = value;
        }
        private Button btn
        {
            get => (Button)UpdatePanel1.FindControl("btn"+BrBtn);
        }
        private Button btnn
        {
            get => (Button)UpdatePanel1.FindControl("btn"+BrBB);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["bb"] = new string[]{"btn4","btn5", "btn6", "btn7", "btn8", "btn9" };
                ViewState["ib"] = new string[6];
                Session["ubp5"] = 0;
            }
        }
        protected void Stop(object sender, EventArgs e)
        {
            Random rnd = new Random();
            btn.ID = "btn" + BrBtn;
            if (BrBtn < 4)
            {
                btn.Text = rnd.Next(0, 10).ToString();
            }
            if (BrBtn > 3 && BrBtn < 8)
            {
                btn.Text = rnd.Next(1,10).ToString();
            }
            else if (BrBtn == 8)
            {
                int broj =rnd.Next(1,4)*5+10;
                btn.Text = broj.ToString();
            }
            else if (BrBtn == 9)
            {
                int broj = rnd.Next(1, 5) * 25;
                btn.Text = broj.ToString();
                btn10.Visible = false;
                btn11.Visible = true;
            }
            BrBtn++;
        }
        protected void Potvrdi(object sender, EventArgs e)
        {
            string izraz = txtInput.Text;
            try
            {
                if (izraz != "")
                {
                    var rezultat = new DataTable().Compute(izraz, null);
                    int rez = Convert.ToInt32(rezultat);

                    if (rez == TacanBroj)
                    {
                        Session["ubp5"] = 30;
                        Kont.Visible = false;
                        nextgame.Visible = true;
                        lblUkupniPoeni.Text = "Ukupan broj poena:" + Session["ubp5"].ToString();
                    }
                    else if (rez + 1 == TacanBroj || rez - 1 == TacanBroj)
                    {
                        Session["ubp5"] = 20;
                        Kont.Visible = false;
                        nextgame.Visible = true;
                        lblUkupniPoeni.Text = "Ukupan broj poena:" + Session["ubp5"].ToString();
                    }
                    else
                    {
                        Session["ubp5"] = 0;
                        Kont.Visible = false;
                        nextgame.Visible = true;
                        lblUkupniPoeni.Text = "Ukupan broj poena:" + Session["ubp5"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Session["ubp5"] = 0;
                Kont.Visible = false;
                nextgame.Visible = true;
                lblUkupniPoeni.Text = "Pogrešan izraz, ukupan broj poena:" + Session["ubp5"].ToString();
            }

        }
        protected void broj(object sender, EventArgs e)
        {
            if(txtInput.Text.Length == 0 || "*+-/(".Contains(txtInput.Text[txtInput.Text.Length-1]))
            {
                Button clickedButton = (Button)sender;
                if (BrBtn == 10)
                {
                    txtInput.Text = txtInput.Text + clickedButton.Text;
                    clickedButton.Enabled = false;
                    clickedButton.CssClass = "game-btn-gray";
                    IzabanButton[BrIB] = clickedButton.ID;
                    BrIB++;
                }
            }
            
        }
        protected void znak(object sender, EventArgs e)
        {
            
                Button clickedButton = (Button)sender;
                if (BrBtn == 10)
                {
                    txtInput.Text = txtInput.Text + clickedButton.Text;
                }
        }
        protected void Izbrisi(object sender, EventArgs e)
        {
            if (txtInput.Text.Length > 0 && Char.IsDigit(txtInput.Text[txtInput.Text.Length - 1]))
            {
                if(txtInput.Text.Length > 1 && Char.IsDigit(txtInput.Text[txtInput.Text.Length - 2]))
                {
                    if (txtInput.Text.Length > 2 && Char.IsDigit(txtInput.Text[txtInput.Text.Length - 3]))
                    {
                        for (int i = 0; i < 7; i++)
                        {
                            if (IzabanButton[BrIB - 1] == BrojButton[i])
                            {
                                BrBB = BrBB + i;
                                btnn.ID = "btn" + BrBB;
                                btnn.Enabled = true;
                                btnn.CssClass = btnn.CssClass.Replace("game-btn-gray", "game-btn");
                                BrIB--;
                                BrBB = 4;
                                txtInput.Text = txtInput.Text.Remove(txtInput.Text.Length - 1);
                                txtInput.Text = txtInput.Text.Remove(txtInput.Text.Length - 1);
                                break;
                            }

                        }
                    }
                    else
                    {
                        for (int i = 0; i < 7; i++)
                        {
                            if (IzabanButton[BrIB - 1] == BrojButton[i])
                            {
                                BrBB = BrBB + i;
                                btnn.ID = "btn" + BrBB;
                                btnn.Enabled = true;
                                btnn.CssClass = btnn.CssClass.Replace("game-btn-gray", "game-btn");
                                BrIB--;
                                BrBB = 4;
                                txtInput.Text = txtInput.Text.Remove(txtInput.Text.Length - 1);
                                break;
                            }

                        }
                    }

                }
                else
                {
                    for (int i = 0; i < 7; i++)
                    {
                        if (IzabanButton[BrIB - 1] == BrojButton[i])
                        {
                            BrBB = BrBB + i;
                            btnn.ID = "btn" + BrBB;
                            btnn.Enabled = true;
                            btnn.CssClass = btnn.CssClass.Replace("game-btn-gray", "game-btn");
                            BrIB--;
                            BrBB = 4;
                            break;
                        }

                    }
                }
            }
            if (txtInput.Text.Length > 0)
            {
                txtInput.Text = txtInput.Text.Remove(txtInput.Text.Length - 1);
            }
        }
    }
}