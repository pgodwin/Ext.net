<%@ Page Language="C#" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!X.IsAjaxRequest)
        {
            this.Store1.DataSource = new object[]
            {
                new object[] { "3m Co", 71.72, 0.02, 0.03, "9/1 12:00am" },
                new object[] { "Alcoa Inc", 29.01, 0.42, 1.47, "9/1 12:00am" },
                new object[] { "Altria Group Inc", 83.81, 0.28, 0.34, "9/1 12:00am" },
                new object[] { "American Express Company", 52.55, 0.01, 0.02, "9/1 12:00am" },
                new object[] { "American International Group, Inc.", 64.13, 0.31, 0.49, "9/1 12:00am" },
                new object[] { "AT&T Inc.", 31.61, -0.48, -1.54, "9/1 12:00am" },
                new object[] { "Boeing Co.", 75.43, 0.53, 0.71, "9/1 12:00am" },
                new object[] { "Caterpillar Inc.", 67.27, 0.92, 1.39, "9/1 12:00am" },
                new object[] { "Citigroup, Inc.", 49.37, 0.02, 0.04, "9/1 12:00am" },
                new object[] { "E.I. du Pont de Nemours and Company", 40.48, 0.51, 1.28, "9/1 12:00am" }
            };

            this.Store1.DataBind();
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu Row Command - Ext.NET Examples</title>
    <link href="../../../../resources/css/examples.css" rel="stylesheet" type="text/css" />    

    <script type="text/javascript">
        var template = '<span style="color:{0};">{1}</span>';

        var change = function (value) {
            return String.format(template, (value > 0) ? "green" : "red", value);
        };

        var pctChange = function (value) {
            return String.format(template, (value > 0) ? "green" : "red", value + "%");
        };
    </script>

</head>
<body>
    <form runat="server">
        <ext:ResourceManager runat="server" />
        
        <h1>Menu Row Command</h1>
        
        <ext:Store ID="Store1" runat="server">
            <Reader>
                <ext:ArrayReader>
                    <Fields>
                        <ext:RecordField Name="company" />
                        <ext:RecordField Name="price" Type="Float" />
                        <ext:RecordField Name="change" Type="Float" />
                        <ext:RecordField Name="pctChange" Type="Float" />
                        <ext:RecordField Name="lastChange" Type="Date" DateFormat="M/d hh:mmtt" />
                    </Fields>
                </ext:ArrayReader>
            </Reader>
        </ext:Store>

        <ext:GridPanel 
            ID="GridPanel1" 
            runat="server" 
            StoreID="Store1" 
            Title="Menu Row Command" 
            Width="600" 
            Height="300"
            AutoExpandColumn="Company">
            <ColumnModel runat="server">
                <Columns>
                    <ext:Column ColumnID="Company" Header="Company" Width="160" DataIndex="company" />
                    <ext:Column Header="Price" Width="75" DataIndex="price">
                        <Renderer Format="UsMoney" />
                    </ext:Column>
                    <ext:Column Header="Change" Width="75" DataIndex="change">
                        <Renderer Fn="change" />
                    </ext:Column>
                    <ext:Column Header="Change" Width="75" DataIndex="pctChange">
                        <Renderer Fn="pctChange" />
                    </ext:Column>
                    <ext:DateColumn Header="Last Updated" Width="85" DataIndex="lastChange" />
                    <ext:CommandColumn Width="80">
                        <Commands>
                            <ext:GridCommand Icon="ArrowDown">
                                <Menu EnableScrolling="false">
                                    <Items>
                                        <ext:MenuCommand Text="Item" Icon="ArrowRight" CommandName="Item" />
                                        <ext:MenuCommand Text="Submenu" Icon="ArrowRight">
                                            <Menu EnableScrolling="false">
                                                <Items>
                                                    <ext:MenuCommand Text="Item" Icon="ArrowRight" CommandName="Item" />        
                                                    <ext:MenuCommand Text="Item" Icon="ArrowRight" CommandName="Item" />        
                                                </Items>
                                            </Menu>
                                        </ext:MenuCommand>
                                    </Items>
                                </Menu>
                                <ToolTip Text="Menu" />
                            </ext:GridCommand>
                            
                            <ext:CommandSeparator />
                            
                            <ext:SplitCommand Icon="ArrowDown" CommandName="Split">
                                <Menu EnableScrolling="false">
                                    <Items>
                                        <ext:MenuCommand Text="Item" Icon="ArrowRight" CommandName="Item" />
                                        <ext:MenuCommand Text="Submenu" Icon="ArrowRight">
                                            <Menu EnableScrolling="false">
                                                <Items>
                                                    <ext:MenuCommand Text="Item" Icon="ArrowRight" CommandName="Item" />        
                                                    <ext:MenuCommand Text="Item" Icon="ArrowRight" CommandName="Item" />        
                                                </Items>
                                            </Menu>
                                        </ext:MenuCommand>
                                    </Items>
                                </Menu>
                                <ToolTip Text="Split" />
                            </ext:SplitCommand>
                        </Commands>
                    </ext:CommandColumn>
                </Columns>
            </ColumnModel>
            <SelectionModel>
                <ext:RowSelectionModel runat="server" SingleSelect="true" />
            </SelectionModel>
            <Listeners>
                <Command Handler="Ext.Msg.alert(command, record.data.company);" />
            </Listeners>
        </ext:GridPanel>  
    </form>
</body>
</html>
