
<%@ Page Title="WDGLL Board" 
    Language="C#" 
    MasterPageFile="~/Pages/Main.Master" 
    AutoEventWireup="true" 
    CodeBehind="wdgll_tab.aspx.cs" 
    Inherits="FiveS.Pages.Wdgll_tab" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap -->
 
    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
<style>
    /* 🌸 Lavender–Violet Theme */
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
        padding: 20px;
    }

    /* 🌸 Title */
    .title {
        font-weight: 700;
        font-size: 1.7rem;
        color: #fff;
        background: linear-gradient(90deg, #7b1fa2, #9c27b0);
        padding: 10px 20px;
        border-radius: 8px;
        display: inline-block;
        text-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
    }

    .subtitle {
        color: #6a1b9a;
        font-size: 1rem;
        margin-bottom: 20px;
    }

    /* 🌸 Table */
    .table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 15px rgba(155, 89, 182, 0.1);
    }

    .table thead {
      
        color: #fff;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .table thead th {
          background-color: rgba(156, 39, 176, 0.3);
        padding: 14px;
        border: none;
        text-align: center;
    }

    .table tbody td {
        padding: 12px;
        background-color: #fff;
        border: none;
        border-bottom: 1px solid #f0e5f9;
        color: #4a148c;
        vertical-align: middle;
    }

    .table tbody tr:hover {
        background-color: #f3e5f5;
        transition: 0.2s ease;
    }

    /* 🌸 Buttons */
    .btn-primary {
        background-color: #9c27b0;
        border: none;
        border-radius: 20px;
        padding: 5px 15px;
        font-size: 0.9rem;
        color: white;
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #7b1fa2;
        box-shadow: 0 0 8px rgba(156, 39, 176, 0.3);
    }

    /* 🌸 Search Bar */
    .search-bar {
        border-radius: 25px;
        border: 1px solid #cba5ff;
        padding: 8px 15px;
        width: 250px;
        outline: none;
        transition: all 0.3s ease;
        background-color: #ffffff;
    }

    .search-bar:focus {
        border-color: #9c27b0;
        box-shadow: 0 0 5px rgba(156, 39, 176, 0.4);
    }

    /* 🌸 Modal */
    .modal-content {
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(155, 89, 182, 0.2);
    }

    .modal-header {
        background: linear-gradient(90deg, #7b1fa2, #9c27b0);
        color: #fff;
        border-top-left-radius: 12px;
        border-top-right-radius: 12px;
    }
</style>


</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <div class="card p-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h3 class="title mb-0">WDGLL Board</h3>
                <input type="text" id="searchInput" class="search-bar" placeholder=" Search..." onkeyup="filterTable()" />
            </div>

            <p class="subtitle">Track WDGLL items across sites and zones.</p>

            <div class="table-responsive">
                <table id="wdgllTable" class="table table-bordered align-middle text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Site</th>
                            <th>Zone</th>
                            <th>CheckPoints</th>
                            <th>Image</th>
                        </tr>
                    </thead>
<tbody>
<asp:Repeater ID="RepeaterWDGLL" runat="server">
    <ItemTemplate>
        <tr>
            <td><%# Eval("wdgllId") %></td>
            <td><%# Eval("title") %></td>
            <td><%# Eval("site") %></td>
            <td><%# Eval("zone") %></td>

            <!-- ✅ View Checkpoints Button -->
            <td>
                <button type="button" class="btn btn-sm btn-primary"
                        onclick="showCheckpoints('<%# Eval("checkpoints").ToString().Replace("'", "\\'") %>')">
                    View
                </button>
            </td>

            <!-- ✅ View Image Button -->
            <td>
                <button type="button" class="btn btn-sm btn-primary"
                        onclick="openImageModal('<%# Eval("ImageBase64") %>',
                                                '<%# Eval("title") %>',
                                                '<%# Eval("site") %>',
                                                '<%# Eval("zone") %>',
                                                '<%# Eval("checkpoints").ToString().Replace("'", "\\'") %>')">
                    View Image
                </button>
            </td>
        </tr>
    </ItemTemplate>
</asp:Repeater>
</tbody>




                </table>
            </div>
        </div>
    </div>
<!-- Checkpoints Modal -->
<div class="modal fade" id="checkpointsModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Checkpoints</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <p id="modalCheckpointsText" style="white-space:pre-wrap;"></p>
      </div>
    </div>
  </div>
</div>


<!-- 🖼 Image Preview Modal -->
<div class="modal fade" id="imageModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-2 text-center">
      <img id="previewImg" src="" style="width:100%;border-radius:10px" />
      <button class="btn btn-secondary mt-2" data-bs-dismiss="modal">Close</button>
    </div>
  </div>
</div>
 


<!-- 🖼 Image Modal -->
<div class="modal fade" id="imageModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content p-3 text-center">
      <img id="previewImg" src="" alt="Preview" style="width:100%;border-radius:10px;display:none;" />
      <div id="noImageText" class="text-muted mt-3" style="display:none;">No image available</div>

      <!-- Details Section -->
      <div id="imageDetails" class="mt-3 text-start" style="display:none;">
        <p><strong>Title:</strong> <span id="detailTitle"></span></p>
        <p><strong>Site:</strong> <span id="detailSite"></span></p>
        <p><strong>Zone:</strong> <span id="detailZone"></span></p>
        <p><strong>Checkpoints:</strong> <span id="detailCheckpoints"></span></p>
      </div>

      <div class="mt-3 d-flex justify-content-center gap-3">
        <button class="btn btn-primary" id="detailsBtn" onclick="toggleDetails()">Details</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script src="../Js/bootstrap.bundle.min.js"></script>
<script>


   

        // ✅ Table Search Function
        function filterTable() {
            const input = document.getElementById("searchInput");
            const filter = input.value.toLowerCase();
            const table = document.getElementById("wdgllTable");
            const rows = table.getElementsByTagName("tr");

            for (let i = 1; i < rows.length; i++) {
                const cells = rows[i].getElementsByTagName("td");
                let match = false;
                for (let j = 0; j < cells.length; j++) {
                    if (cells[j]) {
                        const textValue = cells[j].textContent || cells[j].innerText;
                        if (textValue.toLowerCase().indexOf(filter) > -1) {
                            match = true;
                            break;
                        }
                    }
                }
                rows[i].style.display = match ? "" : "none";
            }
        }
        function showCheckpoints(text) {
            document.getElementById("checkpointText").innerText = text;
        new bootstrap.Modal(document.getElementById('checkpointsModal')).show();
    }

        function openImage(src) {
            document.getElementById("previewImg").src = src;
        new bootstrap.Modal(document.getElementById('imageModal')).show();
    }
        function showCheckpoints(text) {
            document.getElementById("modalCheckpointsText").innerText = text;
        var modal = new bootstrap.Modal(document.getElementById('checkpointsModal'));
        modal.show();
    }
   
        function openImageModal(imgUrl, title, site, zone, checkpoints) {
    const img = document.getElementById("previewImg");
        const noImageText = document.getElementById("noImageText");
        const details = document.getElementById("imageDetails");

        // Reset
        img.style.display = "none";
        noImageText.style.display = "none";
        details.style.display = "none";
        document.getElementById("detailsBtn").innerText = "Details";

        // Set image
        if (imgUrl && imgUrl.trim() !== "") {
            img.src = imgUrl;
        img.style.display = "block";
    } else {
            noImageText.style.display = "block";
    }

        // Fill details
        document.getElementById("detailTitle").innerText = title;
        document.getElementById("detailSite").innerText = site;
        document.getElementById("detailZone").innerText = zone;
        document.getElementById("detailCheckpoints").innerText = checkpoints;

        // Show modal
        new bootstrap.Modal(document.getElementById('imageModal')).show();
}

        function toggleDetails() {
    const details = document.getElementById("imageDetails");
        const btn = document.getElementById("detailsBtn");
        const isVisible = details.style.display === "block";
        details.style.display = isVisible ? "none" : "block";
        btn.innerText = isVisible ? "Details" : "Hide Details";
}


    </script>
   
</asp:Content>
