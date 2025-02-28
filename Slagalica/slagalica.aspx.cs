using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Slagalica
{
    public partial class slagalica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ubp2"] == null)
            {
                Session["ubp2"] = 0;
            }
            lblSpojnice.Text = "Poeni: " + Session["ubp2"].ToString();
            if (Session["ubp1"] == null)
            {
                Session["ubp1"] = 0;
            }
            lblKoZnaZna.Text = "Poeni: " + Session["ubp1"].ToString();
            if (Session["ubp3"] == null)
            {
                Session["ubp3"] = 0;
            }
            lblAsocijacije.Text = "Poeni: " + Session["ubp3"].ToString();
            if (Session["ubp4"] == null)
            {
                Session["ubp4"] = 0;
            }
            lblSkocko.Text = "Poeni: " + Session["ubp4"].ToString();
            if (Session["ubp5"] == null)
            {
                Session["ubp5"] = 0;
            }
            lblMojBroj.Text = "Poeni: " + Session["ubp5"].ToString();
            if (Session["ubp6"] == null)
            {
                Session["ubp6"] = 0;
            }
            lblSlagalica.Text = "Poeni: " + Session["ubp6"].ToString();
        }
        protected void btnkzz(object sender, EventArgs e)
        {
            Response.Redirect("KoZnaZna.aspx");
        }
        protected void btnsp(object sender, EventArgs e)
        {
            Response.Redirect("Spojnice.aspx");
        }
        protected void btnasc(object sender, EventArgs e)
        {
            Response.Redirect("Asocijacije.aspx");
        }
        protected void btnsk(object sender, EventArgs e)
        {
            Response.Redirect("Skocko.aspx");
        }
        protected void btnmb(object sender, EventArgs e)
        {
            Response.Redirect("MojBroj.aspx");
        }
        protected void btnnr(object sender, EventArgs e)
        {
            Response.Redirect("NajduzaRec.aspx");
        }
    }
}