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
            if (Session["ubp"] == null)
            {
                Session["ubp"] = 0;
            }
            lblKoZnaZna.Text = "Poeni: " + Session["ubp"].ToString();
        }
        protected void btnkzz(object sender, EventArgs e)
        {
            Response.Redirect("KoZnaZna.aspx");
        }
    }
}