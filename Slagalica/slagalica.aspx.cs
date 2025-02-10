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
        }
        protected void btnkzz(object sender, EventArgs e)
        {
            Response.Redirect("KoZnaZna.aspx");
        }
        protected void btnsp(object sender, EventArgs e)
        {
            Response.Redirect("Spojnice.aspx");
        }
    }
}