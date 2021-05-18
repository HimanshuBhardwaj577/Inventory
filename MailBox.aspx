<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailBox.aspx.cs" ValidateRequest="false" MaintainScrollPositionOnPostback="true" Inherits="Repair_Center.UnderRepair" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" />
    <title> Mail Box | Repair Center </title>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
    <link href="assets/css/loader.css" rel="stylesheet" type="text/css" />
    <script src="assets/js/loader.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
    <script src="Error/tostr.js"></script>
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/datatables.css" />
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/custom_dt_html5.css" />
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/dt-global_style.css" />
    <style>
      
  </style>
</head>
<body class="alt-menu sidebar-noneoverflow">
    <form id="form1" runat="server">
        <!--  BEGIN NAVBAR  -->
        <div class="header-container fixed-top">
            <header class="header navbar navbar-expand-sm expand-header">
                <a href="javascript:void(0);" class="sidebarCollapse" data-placement="bottom">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
                        <line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg></a>

                <ul class="navbar-item flex-row ml-auto">



                    <li class="nav-item dropdown notification-dropdown">
                        <a href="javascript:void(0);" class="nav-link dropdown-toggle" id="notificationDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell">
                                <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg><span class="badge badge-success"></span>
                        </a>
                        <div class="dropdown-menu position-absolute" aria-labelledby="notificationDropdown">
                            <div class="notification-scroll">

                                <div class="dropdown-item">
                                    <div class="media server-log">
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div class="media server-log">
                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>

                                <div class="dropdown-item">
                                    <div class="media ">
                                        <asp:Button ID="Button3" OnClick="log_Click" CssClass="btn btn-danger" runat="server" Text="Logout" />
                                    </div>
                                </div>


                            </div>
                        </div>
                    </li>
                    <li class="nav-item dropdown user-profile-dropdown  order-lg-0 order-1"></li>
                </ul>
            </header>
        </div>
        <!--  END NAVBAR  -->

        <!--  BEGIN MAIN CONTAINER  -->
        <div class="main-container sidebar-closed sbar-open" id="container">

            <div class="overlay"></div>
            <div class="cs-overlay"></div>
            <div class="search-overlay"></div>

            <!--  BEGIN SIDEBAR  -->
            <div class="sidebar-wrapper sidebar-theme">

                <nav id="sidebar">

                    <ul class="navbar-nav theme-brand flex-row  text-center">
                        <li class="nav-item theme-logo">
                            <a href="index.html">
                                <img src="assets/img/logo.svg" class="navbar-logo" alt="logo" />
                            </a>
                        </li>
                        <li class="nav-item theme-text">
                            <a href="#" class="nav-link">Inventory</a>
                        </li>
                    </ul>

                    <ul class="list-unstyled menu-categories" id="accordionExample">
                        <li class="menu active">
                            <a href="#datatables" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layers">
                                        <polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
                                    <span>DataTables</span>
                                </div>
                                <div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right">
                                        <polyline points="9 18 15 12 9 6"></polyline></svg>
                                </div>
                            </a>
                            <ul class="collapse submenu recent-submenu mini-recent-submenu list-unstyled show" id="datatables" data-parent="#accordionExample">
                                <li>
                                    <a href="MailBox.aspx">Mail System</a>
                                </li>
                                <li>
                                    <a href="ETMSettlement.aspx">ETM Settlement</a>
                                </li>
                            </ul>
                        </li>

                        <li class="menu">
                            <a href="#forms" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clipboard">
                                        <path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>
                                    <span>Forms</span>
                                </div>
                                <div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right">
                                        <polyline points="9 18 15 12 9 6"></polyline></svg>
                                </div>
                            </a>
                            <ul class="collapse submenu list-unstyled" id="forms" data-parent="#accordionExample">
                                <li>
                                    <a href="ReceivingTerminal.aspx">Receiving ETM</a>
                                </li>
                                <li>
                                    <a href="DispatchTerminal.aspx">Dispatch ETM</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <!--  END SIDEBAR  -->

            <!--  BEGIN CONTENT AREA  -->
            <div id="content" class="main-content">
                <div class="layout-px-spacing">

                    <div class="page-header">
                        <div class="page-title">
                        </div>
                    </div>

                    <div class="row" id="cancel-row">
                        <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
                            <div class="widget-content widget-content-area br-6">
                                <div class="card shadow-sm">
                                    <div class="card-body">
                                        <br />
                                        <hr />
                                        <h4>Mail Box</h4>
                                        <hr />
                                        <div class="form-group">
                                            <asp:TextBox ID="TextBox1" class="form-control" AutoComplete="off" Placeholder="Send To Email Id!" runat="server"></asp:TextBox>
                                        </div>
                                        <hr />
                                        <div class="form-group">
                                            <asp:TextBox ID="TextBox2" class="form-control" AutoComplete="off" Placeholder="Mail Subject!" runat="server"></asp:TextBox>
                                        </div>
                                        <hr />
                                        <div class="form-group">
                                            <asp:TextBox ID="TextBox4" Height="100px" TextMode="MultiLine" class="form-control" AutoComplete="off" Placeholder="Message !" runat="server"></asp:TextBox>
                                        </div>
                                        <hr />
                                        <div class="form-group">
                                            <asp:TextBox ID="TextBox5" ReadOnly="true" Height="100px" Visible="false" Text="Clear Text Than Refresh Your Page" TextMode="MultiLine" class="form-control" AutoComplete="off" Placeholder="Message !" runat="server"></asp:TextBox>
                                        </div>
                                        <hr />
                                        <div class="form-group">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </div>
                                        <hr />
                                        <div class="form-group">
                                            <asp:TextBox ID="TextBox6" Height="100px" TextMode="MultiLine" class="form-control" AutoComplete="off" Placeholder="Enter ETM Number here!" runat="server"></asp:TextBox>
                                        </div>
                                        <hr />
                                        <asp:Button ID="Button2" OnClick="lbEdit_Click" class="form-control" CssClass="btn btn-primary" runat="server" Text="send" />
                                        <asp:Button ID="Button1" OnClick="lbEdi_Click" class="form-control" CssClass="btn btn-danger" runat="server" Text="Clear Text" />
                                        <br />
                                        <hr />
                                    </div>
                                    <div class="modal fade" id="U" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body" style="background-color: darkcyan; color: whitesmoke;">
                                                    <div class="container">
                                                        <div class="card" id="example2" runat="server" style="width: 100%; scroll-behavior: auto">
                                                            <asp:Repeater ID="Repeater1" runat="server">
                                                                <HeaderTemplate>
                                                                    <table id="customers" style="font-family: Arial, Helvetica, sans-serif; border-collapse: collapse; width: 100%;">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Location</th>
                                                                                <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Receiving Date</th>
                                                                                <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">ETM Number</th>
                                                                                <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Received By</th>
                                                                                <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Received AWB No.</th>
                                                                                <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Receiving Gtr</th>
                                                                                <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Asset Type</th>
                                                                                <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Dispatch By</th>
                                                                                <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Dispatch AWB No.</th>
                                                                                <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Dispatch Date</th>
                                                                                <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Terminal Remark</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                </HeaderTemplate>

                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Location") %></td>
                                                                        <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Convert.ToDateTime(Eval("Receiving_Date")).ToShortDateString() %></td>
                                                                        <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("ETM_Number") %></td>
                                                                        <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Received_Courier_Name") %></td>
                                                                        <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Received_AWB_No") %></td>
                                                                        <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Receiving_Gtr") %></td>
                                                                        <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Asset_Type") %></td>
                                                                        <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Dispatch_Courier_Name") %></td>
                                                                        <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Dispatch_AWB") %></td>
                                                                        <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Convert.ToDateTime(Eval("Dispatch_Date")).ToShortDateString() %></td>
                                                                        <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Terminal_Remark") %></td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Location</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Receiving Date</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">ETM Number</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Received By</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Received AWB No.</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Receiving Gtr</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Asset Type</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Dispatch By</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Dispatch AWB No.</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Dispatch Date</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Terminal Remark</th>
                                                                </tr>
                                                            </tfoot>
                                                                    </table>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                            <hr />
                                                            <p style="text-align: center">&copy;&nbsp;Himanshu Bhardwaj Service Center: Ptronics Delhi.</p>
                                                            <hr />
                                                            <br />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="successs" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;" role="document">
                    <div class="modal-content">
                        <div class="modal-body" style="background-color: aquamarine; color: blue;">
                            <i class='fas fa-bell' style='font-size: 24px'>&nbsp;&nbsp;Mail sent</i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="errorr" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;" role="document">
                    <div class="modal-content">
                        <div class="modal-body" style="background-color: antiquewhite; color: blue">
                            <i class='fas fa-bell' style='font-size: 24px'>&nbsp;&nbsp;Sorry Something Issue</i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="mailbutton" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;" role="document">
                    <div class="modal-content">
                        <div class="modal-body" style="background-color: antiquewhite; color: blue">
                            <asp:Button ID="Button5" OnClick="outlook_Click" class="form-control" CssClass="btn btn-danger" runat="server" Text="Outlook" />
                            <br />
                            <hr />
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;" role="document">
                    <div class="modal-content">
                        <div class="modal-body" style="background-color: antiquewhite; color: blue">
                            <i class='fas fa-bell' style='font-size: 24px'>&nbsp;&nbsp;Click Clear Text Button</i>
                        </div>
                    </div>
                </div>
            </div>
            <!--  END CONTENT AREA  -->
            <!-- END MAIN CONTAINER -->

            <div class="modal fade" id="emptyy" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;" role="document">
                    <div class="modal-content">
                        <div class="modal-body" style="background-color: antiquewhite; color: blue">
                            <i class='fas fa-bell' style='font-size: 24px'>&nbsp;&nbsp;Please Fill All Textboxes</i>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function emtytext() {
                    $('#emptyy').modal('show');
                }
                setTimeout(function () {
                    $('#emptyy').modal('hide')
                }, 5000);
            </script>
            <script>
                function fadee() {
                    $('#fade').modal('show');
                }
                setTimeout(function () {
                    $('#fade').modal('hide')
                }, 5000);
            </script>
            <script>
                function sending() {
                    $('#successs').modal('show');
                }
                setTimeout(function () {
                    $('#successs').modal('hide')
                }, 5000);
            </script>
            <script>
                function catching() {
                    $('#errorr').modal('show');
                }
                setTimeout(function () {
                    $('#errorr').modal('hide')
                }, 5000);
            </script>
            <script>
                function mailing() {
                    $('#mailbutton').modal('show');
                }

            </script>


            <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
            <script src="assets/js/libs/jquery-3.1.1.min.js"></script>
            <script src="bootstrap/js/popper.min.js"></script>
            <script src="bootstrap/js/bootstrap.min.js"></script>
            <script src="plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="assets/js/app.js"></script>

            <script>
                $(document).ready(function () {
                    App.init();
                });
            </script>
            <script src="assets/js/custom.js"></script>
            <!-- END GLOBAL MANDATORY SCRIPTS -->

            <!-- BEGIN PAGE LEVEL CUSTOM SCRIPTS -->
            <script src="plugins/table/datatable/datatables.js"></script>
            <!-- NOTE TO Use Copy CSV Excel PDF Print Options You Must Include These Files  -->
            <script src="plugins/table/datatable/button-ext/dataTables.buttons.min.js"></script>
            <script src="plugins/table/datatable/button-ext/jszip.min.js"></script>
            <script src="plugins/table/datatable/button-ext/buttons.html5.min.js"></script>
            <script src="plugins/table/datatable/button-ext/buttons.print.min.js"></script>
            <script>
                $('#html5-extension').DataTable({
                    "dom": "<'dt--top-section'<'row'<'col-sm-12 col-md-6 d-flex justify-content-md-start justify-content-center'B><'col-sm-12 col-md-6 d-flex justify-content-md-end justify-content-center mt-md-0 mt-3'f>>>" +
                        "<'table-responsive'tr>" +
                        "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
                    buttons: {
                        buttons: [
                            { extend: 'excel', className: 'btn btn-sm' }
                        ]
                    },
                    "oLanguage": {
                        "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
                        "sInfo": "Showing page _PAGE_ of _PAGES_",
                        "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
                        "sSearchPlaceholder": "Search...",
                        "sLengthMenu": "Results :  _MENU_",
                    },
                    "stripeClasses": [],
                    "lengthMenu": [7, 10, 20, 50],
                    "pageLength": 10
                });
            </script>
            <script>
                $('#html5-extensionn').DataTable({
                    "dom": "<'dt--top-section'<'row'<'col-sm-12 col-md-6 d-flex justify-content-md-start justify-content-center'B><'col-sm-12 col-md-6 d-flex justify-content-md-end justify-content-center mt-md-0 mt-3'f>>>" +
                        "<'table-responsive'tr>" +
                        "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
                    buttons: {
                        buttons: [
                            { extend: 'excel', className: 'btn btn-sm' }
                        ]
                    },
                    "oLanguage": {
                        "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
                        "sInfo": "Showing page _PAGE_ of _PAGES_",
                        "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
                        "sSearchPlaceholder": "Search...",
                        "sLengthMenu": "Results :  _MENU_",
                    },
                    "stripeClasses": [],
                    "lengthMenu": [7, 10, 20, 50],
                    "pageLength": 10
                });
            </script>
    </form>
</body>
</html>
