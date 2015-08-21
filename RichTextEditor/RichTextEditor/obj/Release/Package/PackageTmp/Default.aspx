<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RichTextEditor.Default" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <style type="text/css">
       
        a {
            color:inherit !important;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
 
    <div>
   CK Editor
        <CKEditor:CKEditorControl ID="CKEditor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
    </div>
    </form>
    <script type="text/javascript">
       //CKEDITOR.config.extraPlugins = 'devtools';
        CKEDITOR.config.linkShowAdvancedTab = false;
        CKEDITOR.on('dialogDefinition', function (ev) {
            // Take the dialog name and its definition from the event data.
            var dialogName = ev.data.name;
            var dialogDefinition = ev.data.definition;
            var isFirstTime;
            // Check if the definition is from the dialog window you are interested in (the "Link" dialog window).
            if (dialogName == 'link') {
                // Get a reference to the "Link Info" tab.
               // dialogDefinition.removeContents('advanced');
                console.log(dialogDefinition);
             
             
              
                var dialog = ev.data.definition.dialog;
                dialog.on('show', function () {
                    //console.log(ev.editor.getSelection());
                    //var native = ev.editor.getSelection().getNative();
                    
                    //selectionText = ev.editor.getSelection().getNative();
                    //console.log(selectionText);
                    //if (selectionText && selectionText.indexOf('color:inherit') > 0) {
                       
                    //}
                    setTimeout(function () {
                        var urlTextBox = getControlFromInfoTab('url');
                        var styleTextBox = getAdvStyleTexBox();
                        if (urlTextBox.value && styleTextBox.value) {
                            var checkbox = getControlFromInfoTab('chkColor');
                            checkbox.checked = true;
                        }
                    }, 10);
                   
                   
                    
                });
              
            } 
                //var advanceTab = dialogDefinition.getContents('advanced');
                //var advStyles = advanceTab.get('advStyles');
            //advStyles['default'] = 'color:inherit';
            var infoTab = dialogDefinition.getContents('info');
            if (infoTab) {
                infoTab.add({
                    type: 'hbox',
                    widths: ['5%', '55%'],
                    children: [{
                        type: 'button',
                        label: 'Inherit format',
                        id: 'chkColor',
                        onClick: function () {
                            var textBox = getAdvStyleTexBox();
                            textBox.value = 'color:inherit';
                        }
                        //onChange: function () {
                        //    var isChecked = this.getValue();
                        //    var textBox = getAdvStyleTexBox();
                        //    if (isChecked) {
                        //        textBox.value = 'color:inherit';
                        //    }
                        //    else {
                        //        textBox.value = '';
                        //    }

                        //}

                    },
                    {
                        type: 'button',
                        label: 'Clear format',
                        id: 'btnClear',
                        onClick: function () {
                            var textBox = getAdvStyleTexBox();
                            textBox.value = '';
                            var checkbox = getControlFromInfoTab('chkColor');
                            checkbox.checked = false;
                        }

                    }]
                });
            }

           
                //infoTab.add({
                //    type: 'checkbox',
                //    label: 'Inherit color',
                //    id: 'chkColor',
                //    onChange: function () {
                //        var isChecked = this.getValue();
                //        var textBox = getAdvStyleTexBox();
                //        if(isChecked)
                //        {
                //            textBox.value = 'color:inherit';
                //        }
                //        else {
                //            textBox.value = '';
                //        }
                       
                //    }
                   
                //});

         
        });

        function getAdvStyleTexBox() {
            var dialog = CKEDITOR.dialog.getCurrent();
            var elem = dialog.getContentElement('advanced', 'advStyles');
            var styleContainer = $('#' + elem.domId);
            return styleContainer.find('input')[0];
        }
        function getControlFromInfoTab(contorlId) {
            var dialog = CKEDITOR.dialog.getCurrent();
            var elem = dialog.getContentElement('info', contorlId);
            var styleContainer = $('#' + elem.domId);
            return styleContainer.find('input')[0];
        }
    </script>
</body>
</html>
