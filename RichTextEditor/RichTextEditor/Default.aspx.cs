using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RichTextEditor
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            string [] ckTools = new string[] { "Bold", "Italic", "Underline","Undo", "Redo", "-", "Link", "Unlink","Subscript","Superscript","Paste", "PasteText", "-", "Styles","Source" };
            CKEditor1.config.toolbar = new object[]
            {
                ckTools
            };

            string styles = @"[ { name: 'Blue', element: 'span', styles: { color: 'Blue' } }, { name: 'Red', element: 'span', styles: { color: 'Red' } }]";
            CKEditor1.StylesSet = styles;

        }
    }
}