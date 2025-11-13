<%@ Page Title="Dashboard" Language="C#"  MasterPageFile="~/Pages/Main.Master" AutoEventWireup="true" CodeBehind="Dashboard1.aspx.cs" Inherits="FiveS.Pages.Dashboard1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Chart.js -->
    <script src="../Js/Chart.js"></script>
    
    <style>
        body {
            background: linear-gradient(135deg, #f3e8ff, #ede2ff);
            min-height: 100vh;
        }

        .dashboard-card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            background-color: #fff;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 18px rgba(138, 43, 226, 0.25);
        }

        .text-purple {
            color: #8a2be2;
        }

        .bg-gradient-purple {
            background: linear-gradient(90deg, #8a2be2, #b57aff);
        }

        .upcoming-hover {
            transition: all 0.3s ease-in-out;
            cursor: pointer;
        }

        .upcoming-hover:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(138, 43, 226, 0.3);
            background-color: #f6f0ff;
        }

        .chart-container {
            position: relative;
            height: 220px;
            width: 100%;
        }
        /* 🌟 Purple-Themed Tabs */
/* 🌟 Tab Container Styling */
.nav-tabs1 {
    border-bottom: 3px solid #8a2be2;
    background:#ffff;
    border-radius: 1rem 1rem 0 0; /* Rounded top corners */
    padding: 0.5rem 1rem;
    display: flex;
    justify-content: center;
    flex-wrap: nowrap;
    width: 100%;
  
}

/* 🌟 Tab Buttons */
.nav-tabs1 .nav-link {
    color: #ffff;
    font-weight: 600;
    border: none;
    border-radius: 0.5rem 0.5rem 0 0;
    padding: 0.9rem 3rem;
    transition: all 0.3s ease;
    background-color: #8a2be2;
    
}

/* Hover effect */
.nav-tabs1 .nav-link:hover {
    background-color: #f3e5f5;
    color: #6a1bb2;
}

/* 🌟 Active Tab */
.nav-tabs1 .nav-link.active {
   
    color:#d92323 ;
    border: none;
    box-shadow: 0 4px 12px rgba(138, 43, 226, 0.3);
}

/* 🌟 Default Background (Purple Tabs) */
.nav-tabs1 .nav-link#plant-tab,
.nav-tabs1 .nav-link#user-tab {
    background-color:white;
    color: purple ;
      gap:100px;
      margin-right:200px;
      margin-left:200px;
}



/* 🌟 Dashboard Tab Content (extends full width with borders) */

/* Container */
.user-dashboard-container {
    width: 100%;
    max-width: 100%;
    background-color: #f3e8ff;
    border-radius: 20px;
    padding: 2rem 3rem;
    box-shadow: 0 8px 30px rgba(138, 43, 226, 0.25);
}
.dashboard-title-box mb-4{
    color:#6a1bb2;
}

/* Inner Tabs */
.inner-tabs {
    background-color: #fff;
    color: #9c27b0;
    border-radius: 12px;
    padding: 0.7rem;
    box-shadow: inset 0 0 10px rgba(138, 43, 226, 0.15);
}

/* Tab Buttons */
.inner-tabs .nav-link {
    color: #9c27b0;
    font-weight: 600;
    border-radius: 8px;
    padding: 10px 18px;
    transition: all 0.25s ease;
}

/* Active Tab */
.inner-tabs .nav-link.active {
    background:#f3e5f5;
    color: #6a1bb2 ;
    box-shadow: 0 4px 12px rgba(138, 43, 226, 0.4);
}

 Hover 
.inner-tabs .nav-link:hover {
    background-color: #edd7ff;
    color: #6a1bb2;
}

/* Table Styling */


/* Status Badges */
.status-badge {
    padding: 4px 10px;
    border-radius: 8px;
    font-weight: 600;
    font-size: 0.85rem;
}

/* Status Colors */
.status-inprogress {
    background-color: #ffca28;
    color: #6d4c00;
}

.status-pending {
    background-color: #d1c4e9;
    color: #4a148c;
}

.status-completed {
    background-color: #66bb6a;
    color: #0f3f12;
}
.user-dashboard-container {
    background: white;
    border-radius: 20px;
    padding: 2rem 3rem;
    box-shadow: 0 6px 20px rgba(0,0,0,0.08);
}


/* Table Container */
.table {
    background: #ffffff;
    border-radius: 12px;
    overflow: hidden;
    border: none;
}



.table thead th {
    color:black;
    font-weight: 600;
    font-size: 15px;
    border-bottom: none;
      text-align: center;
    vertical-align: middle;
    background-color: rgba(156, 39, 176, 0.3);
}
.table tbody td {
        padding: 12px;
        background-color: #fff;
        border: none;
        border-bottom: 1px solid #f0e5f9;
        color: #4a148c;
        vertical-align: middle;
        text-align: center;
    }

/* Rows */
.table tbody tr {
    border-bottom: 1px solid #f0e6ff;
    transition: 0.25s ease;
}

.table tbody tr:hover {
    background:  #9c27b0;
    transform: scale(1.005);
}

/* Status Badges */
.badge {
    font-size: 13px;
    padding: 6px 10px;
    border-radius: 6px;
}

/* Purple Accent Badges (Optional) */
.badge-status {
    background: #9c27b0;
    color: #fff;
}
.dashboard-title-box {
    background: #f7ecff; /* light purple highlight */
    border-left: 6px solid #9c27b0; /* purple accent line */
    padding: 18px 22px;
    border-radius: 12px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.05);
}

.dashboard-title-box h2 {
    margin: 0;
    color:#9c27b0;
    font-weight: 700;
    font-size: 24px;
}

.dashboard-title-box p {
    margin: 4px 0 0;
    color: #7a5cb1;
    font-size: 14px;
}


    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container mt-4">

    <!-- 🔹 Tab Navigation -->
    <ul class="nav nav-tabs1 mb-4" id="dashboardTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="plant-tab" data-bs-toggle="tab" data-bs-target="#plantDashboard" type="button" role="tab" aria-controls="plantDashboard" aria-selected="true">
                Plant Dashboard
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link " id="user-tab" data-bs-toggle="tab" data-bs-target="#userDashboard" type="button" role="tab" aria-controls="userDashboard" aria-selected="false">
                User Dashboard
            </button>
        </li>
    </ul>

    <!-- TAB CONTENT -->
    <div class="tab-content" id="dashboardTabsContent">

        <!-- ✅ PLANT DASHBOARD TAB -->
        <div class="tab-pane fade show active" id="plantDashboard" role="tabpanel" aria-labelledby="plant-tab">
            <div class="row g-4 justify-content-center">

                <!-- ✅ Site Score -->
                <div class="col-md-6">
                    <div class="card dashboard-card text-center p-3">
                        <div class="card-body">
                            <h6 class="fw-bold text-dark">Site Score</h6>
                            <h6 class="fw-bold text-secondary">
                                <asp:Label ID="lblSiteName" runat="server" Text="Plant A • Packaging"></asp:Label>
                            </h6>

                            <h1 class="display-4 fw-bold text-purple my-2">
                                <asp:Label ID="lblSiteScore" runat="server" Text="88"></asp:Label>
                            </h1>

                            <p class="badge bg-gradient-purple text-light px-3 py-2 rounded-pill mb-3">
                                <asp:Label ID="lblPerformance" runat="server" Text="Excellent"></asp:Label>
                            </p>

                            <div class="chart-container">
                                <canvas id="siteScoreChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ✅ Open Red Tags Chart -->
                <div class="col-md-6">
                    <div class="card dashboard-card text-center p-3">
                        <div class="card-body">
                            <canvas id="redTagChart" style="width:100%; height:390px;"></canvas>
                        </div>
                    </div>
                </div>

                <!-- ✅ Upcoming Audits -->
                <div class="col-md-6">
                    <div class="card dashboard-card p-3">
                        <h6 class="text-center fw-bold text-dark mb-2">Upcoming Audits</h6>
                        <p class="small text-secondary text-center mb-3">Next 7 days</p>

                        <div class="audit-list" style="max-height: 250px; overflow-y: auto;">
                            <asp:Repeater ID="UpcomingRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="audit-item mb-2 p-2 rounded d-flex justify-content-between align-items-center shadow-sm upcoming-hover">
                                        <span><%# Eval("Date") %> • <%# Eval("Type") %></span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

                <!-- ✅ Completed Audits -->
                <div class="col-md-6">
                    <div class="card dashboard-card p-3">
                        <h6 class="text-center fw-bold text-dark mb-2">Completed Audits</h6>
                        <p class="small text-secondary text-center mb-3">Past 7 days</p>

                        <div class="audit-list" style="max-height: 250px; overflow-y: auto;">
                            <asp:Repeater ID="CompletedRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="audit-item mb-2 p-2 rounded d-flex justify-content-between align-items-center shadow-sm">
                                        <span><%# Eval("Date") %> • <%# Eval("Type") %></span>
                                        <span class='<%# GetBadgeClass((int)Eval("Score")) %> badge text-light px-2 py-1 rounded-pill'>
                                            <%# Eval("Score") %>
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

            </div>
        </div>

     <!-- USER DASHBOARD -->
<div class="tab-pane fade" id="userDashboard" role="tabpanel" aria-labelledby="user-tab">
    <div class="user-dashboard-container">

        <div class="dashboard-title-box mb-4">
    <h2 class="fw-bold">My Audit Dashboard</h2>
    <p>View your assigned audits, team progress, and recent completions</p>
</div>


        <!-- INNER TABS -->
        <ul class="nav nav-tabs inner-tabs mt-4" id="auditTabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#assignedToMe">Assigned To Me</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#assignedToTeam">Assigned To Team</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#completedAudits">Completed Audits</a>
            </li>
        </ul>

        <div class="tab-content mt-4">
            <!-- Assigned To Me -->
            <div class="tab-pane fade show active" id="assignedToMe">
                
                <table class="table table-hover align-middle rounded">
                    <thead class="table-light">
                        <tr>
                            <th>AuditID</th>
                            <th>Audit Name</th>
                            <th>Auditor</th>
                            <th>Cell/Area</th>
                            <th>Due Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>101</td>
                            <td>Safety Audit - Plant A</td>
                            <td>Kamal</td>
                            <td>cell 1</td>
                            <td>2025-11-15</td>
                            <td>
                                    <select class="form-select form-select-sm text-muted" onchange="updateStatusColor(this)">
                                        <option value="" disabled selected>Select status</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Actioned">Actioned</option>
                                        <option value="Reviewed">Reviewed</option>
                                    </select>
                             </td>
                        </tr>
                        <tr>
                            <td>102</td>
                            <td>Quality Audit - Line 3</td>
                            <td>Niranjan</td>
                            <td>cell 4</td>
                            <td>2025-11-22</td>
                            <td>
                                    <select class="form-select form-select-sm text-muted" onchange="updateStatusColor(this)">
                                        <option value="" disabled selected>Select status</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Actioned">Actioned</option>
                                        <option value="Reviewed">Reviewed</option>
                                    </select>
                             </td>
                        </tr>
                        <tr>
                            <td>103</td>
                            <td>Quality Audit - Line 3</td>
                            <td>Niranjan</td>
                            <td>cell 4</td>
                            <td>2025-11-22</td>
                            <td>
                                    <select class="form-select form-select-sm text-muted" onchange="updateStatusColor(this)">
                                        <option value="" disabled selected>Select status</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Actioned">Actioned</option>
                                        <option value="Reviewed">Reviewed</option>
                                    </select>
                             </td>
                        </tr>
                       <tr>
                            <td>104</td>
                            <td>Quality Audit - Line 3</td>
                            <td>Niranjan</td>
                            <td>cell 4</td>
                            <td>2025-11-22</td>
                            <td>
                                    <select class="form-select form-select-sm text-muted" onchange="updateStatusColor(this)">
                                        <option value="" disabled selected>Select status</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Actioned">Actioned</option>
                                        <option value="Reviewed">Reviewed</option>
                                    </select>
                             </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Assigned To Team -->
            <div class="tab-pane fade" id="assignedToTeam">
                <table class="table table-hover align-middle rounded">
                    <thead class="table-light">
                        <tr>
                            <th>AuditID</th>
                            <th>Audit Name</th>
                            <th>Auditor</th>
                            <th>Team</th>
                            <th>Cell/Area</th>
                            <th>Due Date</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>101</td>
                            <td>Safety Audit - Plant A</td>
                            <td>Kamal</td>
                            <td>Alpha</td>
                            <td>cell 1</td>
                            <td>2025-11-15</td>
                        </tr>
                        <tr>
                            <td>102</td>
                            <td>Quality Audit - Line 3</td>
                            <td>Niranjan</td>
                            <td>Beta</td>
                            <td>cell 4</td>
                            <td>2025-11-22</td>
                        </tr>
                        <tr>
                            <td>103</td>
                            <td>Quality Audit - Line 3</td>
                            <td>Niranjan</td>
                            <td>Gamma</td>
                            <td>cell 4</td>
                            <td>2025-11-22</td>
                        </tr>
                       <tr>
                            <td>104</td>
                            <td>Quality Audit - Line 3</td>
                            <td>Niranjan</td>
                           <td>Beta</td>
                            <td>cell 4</td>
                            <td>2025-11-22</td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Completed Audits -->
            <div class="tab-pane fade" id="completedAudits">
                
                <table class="table table-hover align-middle rounded">
                    <thead class="table-light">
                        <tr>
                            <th>AuditID</th>
                            <th>Audit Name</th>
                            <th>Auditor</th>
                            <th>Team</th>
                            <th>Cell/Area</th>
                            <th>Due Date</th>
                            <th>Score</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>101</td>
                            <td>Safety Audit - Plant A</td>
                            <td>Kamal</td>
                            <td>Alpha</td>
                            <td>cell 1</td>
                            <td>2025-11-15</td>
                            <td>98</td>
                        </tr>
                        <tr>
                            <td>102</td>
                            <td>Quality Audit - Line 3</td>
                            <td>Niranjan</td>
                            <td>Beta</td>
                            <td>cell 4</td>
                            <td>2025-11-22</td>
                            <td>90</td>
                        </tr>
                        <tr>
                            <td>103</td>
                            <td>Quality Audit - Line 3</td>
                            <td>Niranjan</td>
                            <td>Gamma</td>
                            <td>cell 4</td>
                            <td>2025-11-22</td>
                            <td>87</td>
                        </tr>
                       <tr>
                            <td>104</td>
                            <td>Quality Audit - Line 3</td>
                            <td>Niranjan</td>
                           <td>Beta</td>
                            <td>cell 4</td>
                            <td>2025-11-22</td>
                           <td>76</td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

    </div>
</div>




    <!-- ✅ Chart.js Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // ✅ Site Score Line Chart
        const ctxLine = document.getElementById("siteScoreChart").getContext("2d");
        const siteScoreLineChart = new Chart(ctxLine, {
            type: "line",
            data: {
                labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"],
                datasets: [{
                    label: "Site Score Trend",
                    data: [60, 68, 72, 78, 82, 85, 88],
                    borderColor: "#8a2be2",
                    backgroundColor: "rgba(138,43,226,0.15)",
                    borderWidth: 3,
                    tension: 0.4,
                    fill: true,
                    pointBackgroundColor: "#8a2be2",
                    pointRadius: 5,
                    pointHoverRadius: 8,
                    pointHoverBackgroundColor: "#b57aff"
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: {
                        grid: { display: false },
                        ticks: { color: "#333", font: { size: 13 } }
                    },
                    y: {
                        beginAtZero: true,
                        grid: { color: "#eee" },
                        ticks: { color: "#666" }
                    }
                },
                plugins: {
                    legend: { display: false },
                    tooltip: {
                        backgroundColor: "#8a2be2",
                        titleColor: "#fff",
                        bodyColor: "#fff",
                        displayColors: false
                    }
                },
                animation: {
                    duration: 1500,
                    easing: "easeInOutQuart"
                }
            }
        });

        // ✅ Red Tag Bar Chart
        new Chart(document.getElementById("redTagChart"), {
            type: "bar",
            data: {
                labels: ["Pending", "Reviewed", "Actioned"],
                datasets: [{
                    data: [3, 2, 1],
                    backgroundColor: "#9c27b0",
                    borderRadius: 8,
                    barThickness: 45
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: { grid: { display: false }, ticks: { color: "#333", font: { size: 13 } } },
                    y: { beginAtZero: true, max: 4, grid: { color: "#eee" }, ticks: { stepSize: 1, color: "#666" } }
                },
                plugins: {
                    legend: { display: false },
                    title: {
                        display: true,
                        text: "Open Red Tags",
                        color: "#000",
                        font: { size: 15, weight: "bold" },
                        padding: { bottom: 5 }
                    },
                    subtitle: {
                        display: true,
                        text: "Pending review or action",
                        color: "#666",
                        font: { size: 13 }
                    }
                },
                animation: {
                    duration: 1200,
                    easing: "easeOutBounce"
                }
            }
        });

    </script>
</asp:Content>
