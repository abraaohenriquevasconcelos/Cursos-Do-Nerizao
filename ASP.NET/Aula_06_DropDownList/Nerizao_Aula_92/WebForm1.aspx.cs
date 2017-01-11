using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nerizao_Aula_92
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dropDownList_Cursos.Items.Add(new ListItem("Android", "3"));
                ListBox_Cores.Items.Add(new ListItem("Amarelo", "3(Amarelo)"));
            }
         }

        protected void dropDownListaCursos_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelCursos.Text = dropDownList_Cursos.SelectedValue;
        }

        protected void ListBoxCores_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelCursos.Text = ListBox_Cores.SelectedValue;
        }
    }
}