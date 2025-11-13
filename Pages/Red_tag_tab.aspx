<%@ Page Title="Red Tag Board" 
    Language="C#" 
    MasterPageFile="~/Pages/Main.Master"
    AutoEventWireup="true" 
    CodeBehind="Red_tag_tab.aspx.cs" 
    Inherits="FiveS.Pages.Red_tag_tab" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    
    <link href="../Css/all.min.css" rel="stylesheet" />
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

    /* 🌸 Table Styling */
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
        text-align: center;
    }

    .table tbody tr:hover {
        background-color: #f3e5f5;
        transition: 0.2s ease;
    }

    /* 🌸 Buttons */
    .btn-primary1 {
        background-color: #9c27b0;
        border: none;
        border-radius: 20px;
        padding: 5px 15px;
        font-size: 0.9rem;
        color: white;
        transition: all 0.3s ease;
    }

    .btn-primary1:hover {
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

    /* 🌸 Status Tags */
    .status-pending {
        background-color: #fff3cd !important; /* Light Yellow */
        color: #856404 !important;
        border: 1px solid #ffeeba !important;
        border-radius: 8px;
        padding: 4px 10px;
        font-weight: 500;
        display: inline-block;
    }

    .status-actioned {
        background-color: #d4edda !important; /* Light Green */
        color: #155724 !important;
        border: 1px solid #c3e6cb !important;
        border-radius: 8px;
        padding: 4px 10px;
        font-weight: 500;
        display: inline-block;
    }

    .status-reviewed {
        background-color: #e8ddff !important; /* Soft Lavender */
        color: #5a2d91 !important;
        border: 1px solid #d1c6ff !important;
        border-radius: 8px;
        padding: 4px 10px;
        font-weight: 500;
        display: inline-block;
    }
</style>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container my-5">
    <div class="card p-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="title mb-0">Red Tag Board</h3>
            <input type="text" id="searchInput" class="search-bar" placeholder=" Search..." onkeyup="filterTable()" />
        </div>

        <p class="subtitle">Track, review, and action tagged items.</p>

        <div class="table-responsive">
            <table id="redTagTable" class="table table-bordered align-middle text-center">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Item</th>
                        <th>Zone</th>
                        <th>Owner</th>
                        <th>Type</th>
                        <th>Notes</th>
                        <th>Image</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="RepeaterRedTags" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("RedTagTableID") %></td>
                                <td><%# Eval("Item") %></td>
                                <td><%# Eval("Zone") %></td>
                                <td><%# Eval("Owner") %></td>
                                <td><%# Eval("Type") %></td>

                                <!-- Notes Modal Button -->
                                <td>
                                    <button type="button" class="btn btn-sm btn-primary1"
                                        onclick="openNotesModal('<%# Eval("Notes").ToString().Replace("'", "\\'") %>')">
                                        View
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-sm btn-primary1"
                                        onclick="openImageModal('<%# Eval("ImageBase64") %>', '<%# Eval("Item") %>', '<%# Eval("Zone") %>', '<%# Eval("Owner") %>', '<%# Eval("Type") %>')">
                                         View Image
                                     </button>
                                </td>
                                <!-- Status Dropdown -->
                                <td>
                                    <select class="form-select form-select-sm text-muted" onchange="updateStatusColor(this)">
                                        <option value="" disabled selected>Select status</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Actioned">Actioned</option>
                                        <option value="Reviewed">Reviewed</option>
                                    </select>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- 🗒 Notes Modal -->
<div class="modal fade" id="notesModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Notes</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <p id="modalNotesText" style="white-space: pre-wrap; line-height:1.6;"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- 🖼 Image Preview Modal -->
<div class="modal fade" id="imageModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content p-3 text-center">
      <img id="previewImg" src="" alt="Preview" style="width:100%;border-radius:10px;display:none;" />
      <div id="noImageText" class="text-muted mt-3" style="display:none;">No image available</div>

      

      <div class="mt-3 d-flex justify-content-center gap-3">
        
        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



<script src="../Js/bootstrap.bundle.min.js"></script>
<script>
    function openNotesModal(noteText) {
        document.getElementById("modalNotesText").innerText = noteText || "No notes available.";
        new bootstrap.Modal(document.getElementById('notesModal')).show();
    }

    function openImage(src) {
        document.getElementById("previewImg").src = src;
        new bootstrap.Modal(document.getElementById('imageModal')).show();
    }

    function filterTable() {
        const input = document.getElementById("searchInput").value.toLowerCase();
        const rows = document.querySelectorAll("#redTagTable tbody tr");
        rows.forEach(row => {
            const text = row.innerText.toLowerCase();
            row.style.display = text.includes(input) ? "" : "none";
        });
    }


        function updateStatusColor(select) {
            // Remove previous status classes
            select.classList.remove("status-pending", "status-actioned", "status-reviewed");

        switch (select.value) {
        case "Pending":
        select.classList.add("status-pending");
        break;
        case "Actioned":
        select.classList.add("status-actioned");
        break;
        case "Reviewed":
        select.classList.add("status-reviewed");
        break;
    }
}
  
        function openImageModal(imgUrl, item, zone, owner, type) {
  const img = document.getElementById("previewImg");
        const noImageText = document.getElementById("noImageText");
       

        // Reset
        img.style.display = "none";
        noImageText.style.display = "none";
        

        // Set image
        if (imgUrl && imgUrl.trim() !== "") {
            img.src = imgUrl;
        img.style.display = "block";
  } else {
            noImageText.style.display = "block";
  }



        // Show modal
        new bootstrap.Modal(document.getElementById('imageModal')).show();
}

        


</script>
</asp:Content>
