<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Testing.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WebForm1</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
           
            <!-- Search Button -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateEmployeeModal">
                Search           
            </button>
        </div>

        <!-- Register Employee Modal -->
        <div class="modal fade" id="updateEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="updateEmployeeModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <!-- Register Employee Form -->
                        <asp:Panel ID="UpdatePanel" runat="server">
                            <asp:Label ID="Label1" runat="server" Text="Employee ID:"></asp:Label>
                            <asp:TextBox ID="txtEmployeeID" runat="server"></asp:TextBox><br />
                            <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
                            <asp:Label ID="Label3" runat="server" Text="Email:"></asp:Label>
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />
                            <asp:Label ID="Label4" runat="server" Text="Position:"></asp:Label>
                            <asp:TextBox ID="txtPosition" runat="server"></asp:TextBox><br />
                        </asp:Panel>
                    </div>
                    
                    <%--Button--%> 
                    <div style="display: flex; justify-content: center">
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Register" OnClick="btnSave_Click" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
