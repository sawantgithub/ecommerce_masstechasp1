<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ecommerce_masstechasp1.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h2 class="text-center mb-4">Register</h2>
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" />
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server" />
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" />
                        </div>
                        <div class="d-grid">
                            <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-primary" Text="Register" OnClick="btnRegister_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
