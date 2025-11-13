<%@ Page Title="Audit Report" Language="C#" MasterPageFile="~/Pages/Main.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="FiveS.Pages.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* 🌸 Lavender–Violet Unified Theme */
        body {
            background: linear-gradient(135deg, #ede7f6, #f3e5f5);
            font-family: 'Segoe UI', sans-serif;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(155, 89, 182, 0.1);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            padding: 25px 35px;
            margin: 30px auto;
            max-width: 95%;
        }

        

        /* 🌸 Search Bar */
        .search-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .search-bar {
            border-radius: 25px;
            border: 1px solid #cba5ff;
            padding: 10px 15px;
            width: 260px;
            outline: none;
            transition: all 0.3s ease;
            background-color: #ffffff;
        }

        .btn-primary1 {
            background-color: #9c27b0;
            border: none;
            border-radius: 25px;
            padding: 8px 20px;
            font-size: 0.95rem;
            color: white;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-primary1:hover {
            background-color: #7b1fa2;
            box-shadow: 0 0 8px rgba(156, 39, 176, 0.3);
        }

        .btn-clear {
            background-color: #ede7f6;
            color: #7b1fa2;
            border-radius: 25px;
            padding: 8px 20px;
            border: none;
            font-weight: 500;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-clear:hover {
            background-color: #e1bee7;
            box-shadow: 0 0 8px rgba(155, 89, 182, 0.3);
        }

        /* 🌸 Table Styling */
        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(155, 89, 182, 0.1);
            background-color: #fff;
        }

        .table th {
            background: rgba(156, 39, 176, 0.3);
            color:black;
            text-transform: uppercase;
            font-weight: 600;
            text-align: center;
            padding: 14px;
            border: none;
            
        }

        .table td {
            text-align: center;
            color: #4a148c;
            padding: 12px;
            border-bottom: 1px solid #f0e5f9;
        }

        /* 🌸 Header Flex Alignment */
.report-header {
    display: flex;
    justify-content: space-between; /* Title left, controls right */
    align-items: center;
    background: linear-gradient(90deg, #7b1fa2, #9c27b0);
    color: white;
    padding: 15px 25px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(155, 89, 182, 0.2);
    margin-bottom: 25px;
}

.report-title {
    margin: 0;
    font-size: 1.7rem;
    font-weight: 700;
    text-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
}

.search-controls {
    display: flex;
    align-items: center;
    gap: 10px;
}

/* Make responsive */
@media (max-width: 768px) {
    .report-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
    }
    .search-controls {
        width: 100%;
        flex-wrap: wrap;
    }
    .search-bar {
        width: 100%;
    }
}

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <header class="report-header">
            <h2 class="report-title">Audit Report</h2>
            <div class="search-controls">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-bar" Placeholder="Search...🔍 " />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-clear" OnClick="btnSearch_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn-clear" OnClick="btnClear_Click" />
            </div>
    </header>


        <!-- 🔍 Search Section -->
        
<asp:GridView ID="gvAuditReports" runat="server" AutoGenerateColumns="False" CssClass="table">
    <Columns>
        <asp:BoundField DataField="AuditID" HeaderText="Audit ID" />
        <asp:BoundField DataField="AuditName" HeaderText="Audit Name" />
        <asp:BoundField DataField="AuditorName" HeaderText="Auditor Name" />
        <asp:BoundField DataField="DateOfAudit" HeaderText="Date of Audit" DataFormatString="{0:dd/MM/yyyy}" />
        <asp:BoundField DataField="Area" HeaderText="Area / Line / Cell" />
        <asp:BoundField DataField="Score" HeaderText="Score" />
        <asp:BoundField DataField="RedTags" HeaderText="Red Tags" />
        <asp:BoundField DataField="WDGLL" HeaderText="WDGLL" />
    </Columns>
</asp:GridView>

    </div>
</asp:Content>
