
<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Main.Master" AutoEventWireup="true" CodeBehind="Audit_eval.aspx.cs" Inherits="FiveS.Pages.Audit_eval" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">


    <link href="../Css/all.min.css" rel="stylesheet" />
    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/bootstrap-icons.css" rel="stylesheet" />
    <!-- Updated Style Section -->
   <style>
    body {
        background: linear-gradient(135deg, #ede7f6, #f3e5f5);
        font-family: 'Segoe UI', sans-serif;
        color: #3a2d5f;
        overflow-x: hidden;
    }
    .card {
        border-radius: 16px;
        border: none;
        background: rgba(255, 255, 255, 0.85);
        backdrop-filter: blur(10px);
        box-shadow: 0 6px 18px rgba(155, 89, 182, 0.1);
        transition: all 0.3s ease;
    }

    .card:hover {
        transform: translateY(-6px);
        box-shadow: 0 12px 30px rgba(155, 89, 182, 0.25);
    }

    .header-title {
        font-weight: 700;
        color: #7b1fa2;
        text-transform: uppercase;
        letter-spacing: 0.8px;
    }
    #questionForm {
        background-color: #f8f0ff;
        border-radius: 12px;
        padding: 15px;
        border: 1px solid #e0b3ff;
    }
    .btn-primary {
        background: linear-gradient(90deg, #7b1fa2, #9c27b0);
        border: none;
        color: #fff;
        transition: 0.3s;
    }

    .btn-primary:hover {
        background: linear-gradient(90deg, #8e24aa, #ab47bc);
        transform: scale(1.05);
        box-shadow: 0 4px 12px rgba(156, 39, 176, 0.3);
    }

    .btn-success {
        background: linear-gradient(90deg, #8e24aa, #ce93d8);
        border: none;
        color: #fff;
        transition: 0.3s;
    }

    .btn-success:hover {
        background: linear-gradient(90deg, #9c27b0, #ba68c8);
        transform: scale(1.05);
        box-shadow: 0 4px 12px rgba(156, 39, 176, 0.3);
    }

    /* 🌸 Form Inputs */
    .form-label {
        font-weight: 600;
        color: #4a148c;
    }

    .form-control,
    .form-select {
        border-radius: 8px;
        border: 1px solid #cba5ff;
        transition: all 0.3s ease;
        background-color: #fff;
    }

    .form-control:focus,
    .form-select:focus {
        border-color: #8e24aa;
        box-shadow: 0 0 0 0.25rem rgba(142, 36, 170, 0.25);
    }

    /* 🌸 Score Card */
    .score-card {
        background: linear-gradient(180deg, #ffffff, #f3e5f5);
        border-radius: 18px;
        box-shadow: 0 8px 20px rgba(123, 31, 162, 0.1);
        padding: 25px;
        text-align: center;
        transition: all 0.3s;
    }

    .score-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 12px 30px rgba(123, 31, 162, 0.2);
    }

    .score-card h5 {
        font-weight: 700;
        color: #6a1b9a;
    }

    #lblScore {
        font-size: 2.6rem;
        font-weight: 800;
        color: #7b1fa2;
        text-shadow: 0 0 10px rgba(155, 89, 182, 0.2);
    }

    /* 🌸 Tabs */
    .nav-tabs1 {
        border-bottom: 2px solid #9c27b0;
        background-color: #ffffff;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(155, 89, 182, 0.1);
    }

    .nav-tabs1 .nav-link {
        color: #7b1fa2;
        font-weight: 600;
        border: none;
        padding: 10px 20px;
        transition: 0.3s;
    }

    .nav-tabs1 .nav-link:hover {
        color: #ffffff;
        background: linear-gradient(90deg, #8e24aa, #ab47bc);
    }

    .nav-tabs1 .nav-link.active {
        background: linear-gradient(90deg, #7b1fa2, #9c27b0);
        color: white;
        border-radius: 10px 10px 0 0;
        box-shadow: 0 4px 12px rgba(123, 31, 162, 0.25);
    }

    /* 🌸 Questions Section */
    .question-item {
        background-color: #fdf8ff;
        border: 1px solid #e1bee7;
        border-radius: 10px;
        padding: 15px;
        margin-bottom: 15px;
        transition: all 0.25s ease;
    }

    .question-item:hover {
        border-color: #9c27b0;
        box-shadow: 0 4px 15px rgba(155, 89, 182, 0.2);
    }

    .score-btn {
        border-radius: 8px;
        font-weight: 600;
        transition: 0.25s;
        border: 1px solid #ba68c8;
        color: #7b1fa2;
        background-color: #f3e5f5;
    }

    .score-btn:hover {
        background-color: #9c27b0;
        color: white;
        transform: scale(1.05);
    }

    .score-btn.active {
        background-color: #8e24aa;
        color: white;
        transform: scale(1.07);
        box-shadow: 0 0 10px rgba(156, 39, 176, 0.3);
    }

    .notes-box {
        border-radius: 8px;
        border: 1px solid #d1a1f2;
        padding: 10px;
        background-color: #faf3ff;
    }

    .photo-preview {
        border-radius: 10px;
        border: 2px solid #9c27b0;
        margin-top: 10px;
        max-width: 120px;
        transition: transform 0.3s ease;
    }

    .photo-preview:hover {
        transform: scale(1.05);
        box-shadow: 0 4px 12px rgba(155, 89, 182, 0.3);
    }



    .question-block {
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 10px;
}

 .popup-overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.5);
      display: none;
      align-items: center;
      justify-content: center;
      z-index: 1000;
    }

    .popup-content {
      background: #fff;
      border-radius: 10px;
      padding: 20px;
      width: 70%;
      max-width: 800px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      animation: fadeIn 0.3s ease-in-out;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: scale(0.95);
      }
      to {
        opacity: 1;
        transform: scale(1);
      }
    }

    .btn-template {
      background: #6f42c1;
      color: #fff;
    }

    .btn-manual {
      background: #17a2b8;
      color: #fff;
    }

    .btn-use {
      background: #28a745;
      color: #fff;
    }



    .btn-close {
      background: transparent;
      border: none;
      font-size: 1.5rem;
      line-height: 1;
      cursor: pointer;
    }
.popup-large {
  width: 600px;
  max-height: 450px;
  overflow-y: auto;
}

.popup-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
}

.btn-close {
  background: transparent;
  border: none;
  font-size: 22px;
  cursor: pointer;
}

/* 🌸 Buttons */
.btn-group .btn {
  width: 50%;
  border-radius: 8px;
}

.btn-primary {
  background-color: #8a2be2;
  border: none;
}

.btn-secondary {
  background-color: #a855f7;
  border: none;
}

.btn-view {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 4px 8px;
  border-radius: 6px;
}

.btn-use {
  background-color: #28a745;
  color: #fff;
  border: none;
  padding: 4px 10px;
  border-radius: 6px;
}

/* 🌸 Table */
.template-table {
  width: 100%;
  border-collapse: collapse;
}

.template-table th,
.template-table td {
  padding: 10px;
  border-bottom: 1px solid #ddd;
}

.template-table th {
  background-color: #f2f2f2;
}

@keyframes fadeIn {
  from { opacity: 0; transform: scale(0.95); }
  to { opacity: 1; transform: scale(1); }
}


#rbl input {
    margin-right: 3px;
}

    /* 🌸 Responsive */
    @media (max-width: 992px) {
        .score-card, .card {
            margin-bottom: 20px;
        }
    }
.question-block {
    background-color: #f9f6ff;
    border: 1px solid #e0d3f5;
    border-radius: 12px;
    transition: all 0.3s ease;
    padding : 20px;
}

.question-block:hover {
    box-shadow: 0 3px 10px rgba(155, 89, 182, 0.1);
}

.btn-outline-danger {
    border-color: #e57373;
    color: #e53935;
}

.btn-outline-danger:hover {
    background-color: #e53935;
    color: #fff;
}

.btn-outline-secondary {
    border-color: #9c27b0;
    color: #7b1fa2;
}

.btn-outline-secondary:hover {
    background-color: #9c27b0;
    color: #fff;
}

</style>


</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class="container-fluid p-4">
    <div class="row g-4 mb-4">

      <!-- LEFT: CREATE AUDIT -->
      <div class="col-lg-6">
  <div class="card p-4 text-center shadow-sm h-100">
    <h5 class="header-title mb-3 text-uppercase">Create Audit</h5>

    <!-- Vertical Buttons -->
    <div class="create-audit-buttons d-flex flex-column align-items-center mb-4">
      <button class="btn btn-template mb-2 w-75" type="button" onclick="openTemplatePopup()">Template</button>
      <button class="btn btn-manual w-75" type="button" onclick="toggleQuestionForm()">Manual</button>
    </div>

    <!-- Manual Form -->
    <div id="questionForm" style="display:none;">
      <label class="form-label text-start w-100">Select S</label>
      <asp:DropDownList ID="ddlChoosenS" runat="server" CssClass="form-select mb-3" AutoPostBack="true" OnSelectedIndexChanged="ddlChoosenS_SelectedIndexChanged">
        <asp:ListItem Text="Select S" Value=""></asp:ListItem>
        <asp:ListItem Value="Sort">Sort</asp:ListItem>
        <asp:ListItem Value="Set in Order">Set in Order</asp:ListItem>
        <asp:ListItem Value="Shine">Shine</asp:ListItem>
        <asp:ListItem Value="Standardize">Standardize</asp:ListItem>
        <asp:ListItem Value="Sustain">Sustain</asp:ListItem>
      </asp:DropDownList>

      <label class="form-label text-start w-100">Select Existing Question</label>
      <asp:DropDownList ID="ddlExistingQuestions" runat="server" CssClass="form-select mb-3">
        <asp:ListItem Text="-- Select a Question or Type Below --" Value=""></asp:ListItem>
      </asp:DropDownList>

      <label class="form-label text-start w-100"> Enter New Question</label>
      <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control mb-3"
        placeholder="Enter new question..." />

      <asp:Button ID="btnAddQuestion" runat="server" Text="Add Question"
        CssClass="btn btn-success w-100" OnClick="btnAddQuestion_Click" />
    </div>
  </div>
</div>


      <!-- CENTER: AUDIT DETAILS -->
<div class="col-lg-3">
  <div class="card p-4 h-100 shadow-sm">
    <h5 class="header-title mb-3">Audit Details</h5>
    <div class="row">
      
      <div class="col-12 mb-3">
        <label class="form-label">Audit Name</label>
        <asp:TextBox ID="txtAuditName" runat="server" CssClass="form-control" placeholder="Enter name"></asp:TextBox>
      </div>

      <div class="col-12 mb-3">
        <label class="form-label">Auditor</label>
        <asp:TextBox ID="txtAuditor" runat="server" CssClass="form-control" placeholder="Enter auditor"></asp:TextBox>
      </div>

      <div class="col-12 mb-3">
        <label class="form-label">Area / Line / Cell</label>
        <asp:TextBox ID="txtArea" runat="server" CssClass="form-control" placeholder="Enter area"></asp:TextBox>
      </div>

      <div class="col-12 mb-3">
        <label class="form-label">Date</label>
        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
      </div>

      <div class="col-12">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary w-100" OnClick="btnSubmit_Click" />
      </div>

    </div>
  </div>
</div>

      <!-- RIGHT: SCORE CHART -->
      <div class="col-lg-3">
        <div class="card p-4 text-center shadow-sm h-100 d-flex flex-column justify-content-center">
          <h5 class="header-title mb-3">Overall Score <i class="bi-solid bi-chart-line ms-1"></i></h5>
          <h3 id="lblScore" class="mb-2">0%</h3>
          <p>Average Audit Performance</p>
          <canvas id="spiderChart" height="200"></canvas>
        </div>
      </div>

    </div>
  </div>

  <!-- 🌟 Template Popup (Modal) -->
  <div id="templatePopup" class="popup-overlay" style="display:none;">
    <div class="popup-content popup-large">
      <div class="popup-header d-flex justify-content-between align-items-center mb-3">
        <h4 class="m-0">Select Template</h4>
        <button class="btn btn-close" onclick="closeTemplatePopup()">×</button>
      </div>
      <table class="table table-bordered align-middle">
        <thead class="table-light">
          <tr>
            <th>Template Name</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Development</td>
            <td>
              <button class="btn btn-view" title="View"><i class="fa-solid fa-eye"></i></button>
              <button class="btn btn-use">Use</button>
            </td>
          </tr>
          <tr>
            <td>Manufacturing</td>
            <td>
              <button class="btn btn-view" title="View"><i class="fa-solid fa-eye"></i></button>
              <button class="btn btn-use">Use</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>


            <!-- ========== BOTTOM 5S SECTION ========== -->
        <ul class="nav nav-tabs1" id="auditTabs">
    <li class="nav-item"><a class="nav-link active" href="#sort" data-bs-toggle="tab">Sort</a></li>
    <li class="nav-item"><a class="nav-link" href="#set" data-bs-toggle="tab">Set in Order</a></li>
    <li class="nav-item"><a class="nav-link" href="#shine" data-bs-toggle="tab">Shine</a></li>
    <li class="nav-item"><a class="nav-link" href="#standardize" data-bs-toggle="tab">Standardize</a></li>
    <li class="nav-item"><a class="nav-link" href="#sustain" data-bs-toggle="tab">Sustain</a></li>
</ul>

<div class="tab-content mt-3">

    <!-- SORT -->
    <div class="tab-pane fade show active" id="sort">
    <div class="card p-4">
        <h5 class="header-title mb-3">Sort (Seiri)</h5>

        <asp:Repeater ID="rptSort" runat="server">
            <ItemTemplate>
                <div class="question-block mb-4 p-3 rounded shadow-sm" style="background-color: #f9f6ff;">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <p class="fw-semibold text-dark mb-0"><%# Eval("Question") %></p>
                        <div class="button-group">
                            <button type="button" class="btn btn-outline-danger btn-sm me-2"
                                onclick="window.location.href='Red_tags.aspx'">Red Tag</button>
                            <button type="button" class="btn btn-outline-secondary btn-sm"
                                onclick="window.location.href='wdglls.aspx'">WDGLL</button>
                        </div>
                    </div>

                    <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal"
                        CssClass="form-check-inline">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>


    <!-- SET IN ORDER -->
    <div class="tab-pane fade" id="set">
        <div class="card p-4">
            <h5 class="header-title mb-3">Set in Order (Seiton)</h5>

            <asp:Repeater ID="rptSetInOrder" runat="server">
               <ItemTemplate>
    <div class="question-block mb-3">
        <p><%# Eval("Question") %></p>

        <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal">
          
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
        </asp:RadioButtonList>

     
    </div>
</ItemTemplate>


            </asp:Repeater>

        </div>
    </div>

    <!-- SHINE -->
    <div class="tab-pane fade" id="shine">
        <div class="card p-4">
            <h5 class="header-title mb-3">Shine (Seiso)</h5>

            <asp:Repeater ID="rptShine" runat="server">
               <ItemTemplate>
    <div class="question-block mb-3">
        <p><%# Eval("Question") %></p>

        <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal" >
         
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
        </asp:RadioButtonList>

    </div>
</ItemTemplate>


            </asp:Repeater>

        </div>
    </div>

    <!-- STANDARDIZE -->
    <div class="tab-pane fade" id="standardize">
        <div class="card p-4">
            <h5 class="header-title mb-3">Standardize (Seiketsu)</h5>

            <asp:Repeater ID="rptStandardize" runat="server">
               <ItemTemplate>
    <div class="question-block mb-3">
        <p><%# Eval("Question") %></p>

        <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal" >
            
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
        </asp:RadioButtonList>

      
    </div>
</ItemTemplate>


            </asp:Repeater>

        </div>
    </div>

    <!-- SUSTAIN -->
    <div class="tab-pane fade" id="sustain">
        <div class="card p-4">
            <h5 class="header-title mb-3">Sustain (Shitsuke)</h5>

            <asp:Repeater ID="rptSustain" runat="server">
              <ItemTemplate>
    <div class="question-block mb-3">
        <p><%# Eval("Question") %></p>

        <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal" >
            
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
        </asp:RadioButtonList>

  
    </div>
</ItemTemplate>


            </asp:Repeater>

        </div>
    </div>

</div>

        </div>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Custom JS -->
    <script>
        let questions = { sort: [], set: [], shine: [], standardize: [], sustain: [] };
        let spiderChart = null;

        function toggleQuestionForm() {
            const form = document.getElementById("questionForm");
            form.style.display = form.style.display === "none" ? "block" : "none";
        }

        function addQuestion() {
            const text = document.getElementById("<%= txtQuestion.ClientID %>").value.trim();

            const cat = document.getElementById("ddlCategory").value;
            if (!text) return alert("Please enter a question");

            const newQ = { id: Date.now(), text, score: 0, notes: "", photo: "" };
            questions[cat].push(newQ);
            
            document.getElementById("<%= txtQuestion.ClientID %>").value = "";

            renderQuestions();
        }

        function renderQuestions() {
            for (let cat in questions) {
                const container = document.getElementById(cat + "Questions");
                container.innerHTML = "";
                questions[cat].forEach((q, index) => {
                    container.innerHTML += `
                        <div class="question-item">
                            <strong>${index + 1}. ${q.text}</strong>
                            <label class="btn btn-sm btn-outline-secondary ms-2">
                                <i class="fa fa-image"></i> Add photo
                                <input type="file" accept="image/*" style="display:none" onchange="previewPhoto('${cat}', ${q.id}, this)">
                            </label>
                            <textarea class="form-control mb-2 notes-box" rows="2" placeholder="Notes / observations" onchange="updateNotes('${cat}', ${q.id}, this.value)"></textarea>
                            <div class="d-flex align-items-center flex-wrap mb-2">
                                ${[1, 2, 3, 4, 5].map(num => `<button type="button" class="btn btn-sm btn-outline-primary score-btn" onclick="setScore('${cat}', ${q.id}, ${num}, this)">${num}</button>`).join("")}
                                <span class="ms-2">Score: <strong id="score-${cat}-${q.id}">0</strong></span>
                            </div>
                            <img id="photo-${cat}-${q.id}" class="photo-preview" />
                        </div>`;
                });
            }
        }

        function setScore(cat, id, score, btn) {
            questions[cat].forEach(q => { if (q.id === id) q.score = score; });
            const parent = btn.parentElement;
            parent.querySelectorAll(".score-btn").forEach(b => b.classList.remove("active"));
            btn.classList.add("active");
            document.getElementById(`score-${cat}-${id}`).innerText = score;
            updateOverallScore();
        }

        function updateNotes(cat, id, value) {
            const q = questions[cat].find(x => x.id === id);
            if (q) q.notes = value;
        }

        function previewPhoto(cat, id, input) {
            const file = input.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.getElementById(`photo-${cat}-${id}`);
                    img.src = e.target.result;
                    img.style.display = "block";
                };
                reader.readAsDataURL(file);
                const q = questions[cat].find(x => x.id === id);
                if (q) q.photo = file.name;
            }
        }

        function updateOverallScore() {
            let totalScore = 0, count = 0;
            let categoryScores = { sort: 0, set: 0, shine: 0, standardize: 0, sustain: 0 };
            let categoryCounts = { sort: 0, set: 0, shine: 0, standardize: 0, sustain: 0 };

            for (let cat in questions) {
                questions[cat].forEach(q => {
                    if (q.score > 0) {
                        categoryScores[cat] += q.score;
                        categoryCounts[cat]++;
                        totalScore += q.score;
                        count++;
                    }
                });
            }

            const percent = count > 0 ? ((totalScore / (count * 5)) * 100).toFixed(1) : 0;
            document.getElementById("lblScore").innerText = percent + "%";

            const radarData = [
                categoryCounts.sort ? (categoryScores.sort / (categoryCounts.sort * 5)) * 100 : 0,
                categoryCounts.set ? (categoryScores.set / (categoryCounts.set * 5)) * 100 : 0,
                categoryCounts.shine ? (categoryScores.shine / (categoryCounts.shine * 5)) * 100 : 0,
                categoryCounts.standardize ? (categoryScores.standardize / (categoryCounts.standardize * 5)) * 100 : 0,
                categoryCounts.sustain ? (categoryScores.sustain / (categoryCounts.sustain * 5)) * 100 : 0
            ];

            updateRadarChart(radarData);
        }

        function initRadarChart() {
            const ctx = document.getElementById('spiderChart')?.getContext('2d');
            if (!ctx) return;

            spiderChart = new Chart(ctx, {
                type: 'radar',
                data: {
                    labels: ['Sort (Seiri)', 'Set in Order (Seiton)', 'Shine (Seiso)', 'Standardize (Seiketsu)', 'Sustain (Shitsuke)'],
                    datasets: [{
                        label: '5S Audit Scores',
                        data: [0, 0, 0, 0, 0],
                        fill: true,
                        backgroundColor: 'rgba(13,110,253,0.2)',
                        borderColor: '#0d6efd',
                        pointBackgroundColor: '#0d6efd'
                    }]
                },
                options: {
                    scales: {
                        r: {
                            beginAtZero: true,
                            max: 100,
                            ticks: { stepSize: 20 },
                            grid: { color: 'rgba(0,0,0,0.1)' },
                            pointLabels: { font: { size: 12 } }
                        }
                    },
                    plugins: { legend: { display: false } }
                }
            });
        }

        function updateRadarChart(values) {
            if (spiderChart) {
                spiderChart.data.datasets[0].data = values;
                spiderChart.update();
            }
        }

        window.onload = function () {
            initRadarChart();
        };



        // Show popup
        function openTemplatePopup() {
            document.getElementById("templatePopup").style.display = "flex";
        }

        // Hide popup
        function closeTemplatePopup() {
            document.getElementById("templatePopup").style.display = "none";
        }

        // Toggle manual form
        function toggleQuestionForm() {
            const form = document.getElementById("questionForm");
            form.style.display = (form.style.display === "none") ? "block" : "none";
        }


    </script>

</asp:Content>


