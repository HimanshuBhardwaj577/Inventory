<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Repair_Center.Login" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <script type="text/javascript">
        function preback() { window.history.forward(); }
        setTimeout("preback()", 0);
        window.onunload = function () { null };
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="fonts/icomoon/style.css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <title>Login | Repair Center</title>
    <script src="Error/tostr.js"></script>
</head>
<body onload="preback()" >
    <form id="form1" runat="server">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 order-md-2">
                        <img src="images/undraw_file_sync_ot38.svg" alt="Image" class="img-fluid" />
                    </div>
                    <div class="col-md-6 contents">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div class="mb-4">
                                    <h3>Sign In to <strong>Inventory</strong></h3>
                                    <p>Please enter your registered Email Id to get OTP.</p>
                                </div>
                                <div class="form-group first">
                                    <asp:TextBox ID="TextBox1" placeholder="Enter Your Email Id" Height="50px" autocomplete="off" class="form-control" Font-Names="calabric" runat="server"></asp:TextBox>
                                </div>
                                <br />
                                <br />
                                <asp:Button ID="Button1" OnClick="getotp_Click" CssClass="btn text-white btn-block btn-primary" runat="server" Text="Send OTP" />
                            </div>
                        </div>
                        <!-- Modal -->
                        <div class="modal fade" id="Otp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document" style="position: absolute; top: 8px; right: 16px; font-size: 18px; width: 100%;">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Login Form</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group first">
                                            <label for="username">You Otp</label>
                                            <asp:TextBox ID="TextBox2" Height="50px" autocomplete="off" class="form-control" Font-Names="calabric" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="Button2" OnClick="okotp_Click" CssClass="btn text-white btn-block btn-primary" runat="server" Text="Login" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="nullemail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;"
                                role="document">
                                <div class="modal-content">
                                    <div class="modal-body" style="background-color: purple; color: whitesmoke;">
                                        <i class='fas fa-exclamation-circle'>&nbsp;&nbsp;Please enter Your EMAIL Id!</i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="nullotp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;"
                                role="document">
                                <div class="modal-content">
                                    <div class="modal-body" style="background-color: purple; color: whitesmoke;">
                                        <i class='fas fa-exclamation-circle'>&nbsp;&nbsp;Please enter Your OTP!</i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="wrongemailid" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;"
                                role="document">
                                <div class="modal-content">
                                    <div class="modal-body" style="background-color: purple; color: whitesmoke;">
                                        <i class='fas fa-exclamation-circle'>&nbsp;&nbsp;Please enter Your Registered EMAIL Id!</i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="wrongotp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;"
                                role="document">
                                <div class="modal-content">
                                    <div class="modal-body" style="background-color: purple; color: whitesmoke;">
                                        <i class='fas fa-exclamation-circle'>&nbsp;&nbsp;Please enter valid Otp</i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="Error/jquery-3.3.1.min.js"></script>
        <script src="Error/popper.min.js"></script>
        <script src="Error/bootstrap.min.js"></script>
        <script src="Error/main.js"></script>

    </form>
</body>
</html>
