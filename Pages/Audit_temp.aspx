<%@ Page Title="5S Audit Template"
    Language="C#"
    MasterPageFile="~/Pages/Main.Master"
    AutoEventWireup="true"
    CodeBehind="Audit_temp.aspx.cs"
    Inherits="FiveS.Pages.Audit_temp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap -->
    <link href="../Css/all.min.css" rel="stylesheet" />
    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/bootstrap-icons.css" rel="stylesheet" />
    <script src="../Js/bootstrap.bundle.min.js"></script>
    <style>
        /* 🌸 Unified Page Theme */
        body {
            background: linear-gradient(135deg, #ede7f6, #f3e5f5);
            font-family: 'Segoe UI', sans-serif;
            color: #3a2d5f;
            overflow-x: hidden;
        }

        /* 🌸 Main Outer Container */
        .main-container {
            background: linear-gradient(180deg, #f3e5f5, #ffffff);
            border-radius: 20px;
            box-shadow: 0 6px 25px rgba(155, 89, 182, 0.15);
            padding: 30px;
            margin-top: 30px;
        }

        /* 🌸 Section Headers */
        .section-header {
            background: linear-gradient(90deg, #7b1fa2, #9c27b0);
            color: #fff;
            padding: 12px 15px;
            border-radius: 12px 12px 0 0;
            text-align: center;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        /* 🌸 Card Containers */
        .sub-container {
            background: #f8f0ff;
            border-radius: 16px;
            margin-bottom: 20px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
        }

        .available-template-card {
            background: #f9f3ff;
            border-radius: 10px;
            padding: 12px 15px;
            margin-bottom: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        }

            .available-template-card strong {
                color: #7b1fa2;
            }

        /* 🌸 Buttons */
        .btn-purple {
            background: linear-gradient(90deg, #7b1fa2, #9c27b0);
            border: none;
            color: #fff;
            font-weight: 500;
            border-radius: 10px;
            transition: all 0.3s;
        }

            .btn-purple:hover {
                background: linear-gradient(90deg, #8e24aa, #ab47bc);
                box-shadow: 0 4px 12px rgba(156, 39, 176, 0.4);
                transform: translateY(-2px);
            }

        .btn-outline-purple {
            border: 2px solid #ba68c8;
            color: #7b1fa2;
            border-radius: 10px;
            font-weight: 500;
            transition: all 0.3s;
        }

            .btn-outline-purple:hover,
            .active-section {
                background: linear-gradient(90deg, #7b1fa2, #9c27b0);
                color: white !important;
                border: none !important;
            }

        /* 🌸 Scroll Container for Questions */
        #questionContainer {
            max-height: 380px;
            overflow-y: auto;
            background: #faf3ff;
            padding: 15px;
            border-radius: 10px;
        }

        /* 🌸 Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-thumb {
            background: #d1a1f2;
            border-radius: 8px;
        }


        /* Scoped styles — ONLY for the Available Templates table */
        .templates-section {
            width: 100%;
            margin: 30px auto;
            background-color: linear-gradient(180deg, #f3e5f5, #ffffff);
            border-radius: 15px;
            box-shadow: 0px 2px 8px rgba(128, 0, 128, 0.2);
            overflow: hidden;
        }

            .templates-section .header {
                width: 100%;
                background:linear-gradient(90deg, #7b1fa2, #9c27b0);
                color: white;
                text-align: center;
                padding: 15px;
                font-size: 20px;
                font-weight: bold;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
            }

            .templates-section .table-container {
                max-height: 300px;
                overflow-y: auto;
                 background-color: linear-gradient(180deg, #f3e5f5, #ffffff);
                padding: 20px;
                
            }

            .templates-section .table {
                overflow-y: auto;
                width: 100%;
                border-collapse: collapse;
                text-align: center;
                background-color: linear-gradient(180deg, #f3e5f5, #ffffff);
            }

                .templates-section .table th {
                     background: #f3e5f5;
                    color: purple;
                    padding: 25px;
                    position: relative;
                    top: 0;
                   
                }

                .templates-section .table td {
                    
                    padding: 10px;
                    border-bottom: 1px solid #e0d3f5;
                }

                .templates-section .table tr:hover {
                    background-color: linear-gradient(180deg, #f3e5f5, #ffffff);
                }

            /* Buttons inside GridView */
            .templates-section .btn {
                border: none;
                padding: 6px 12px;
                border-radius: 6px;
                cursor: pointer;
                color: white;
                font-size: 13px;
            }

            .templates-section .btn-view {
                background-color: cornflowerblue;
            }

            .templates-section .btn-edit {
                background-color: darkolivegreen;
            }

            .templates-section .btn-delete {
                background-color: red;
            }

            .templates-section .btn:hover {
                opacity: 0.9;
            }
        /* 🌸 Popup overlay */
        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.4);
            justify-content: center;
            align-items: center;
            z-index: 999;
        }

        /* 🌸 Popup content box */
        .popup-content {
            background: #fff;
            padding: 25px;
            border-radius: 15px;
            width: 350px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
            text-align: left;
            animation: fadeIn 0.3s ease-in-out;
        }

        /* Inputs */
        .popup-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        /* Buttons */
        .popup-actions {
            display: flex;
            justify-content: space-between;
        }

        .btn-assign-confirm {
            background-color: #6a0dad;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 8px;
            cursor: pointer;
        }

        .btn-cancel {
            background-color: #ccc;
            border: none;
            padding: 8px 14px;
            border-radius: 8px;
            cursor: pointer;
        }

        .btn-assign {
            background-color: #f8d210;
            border: none;
            color: #000;
            padding: 6px 10px;
            border-radius: 8px;
            cursor: pointer;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }

            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container main-container">
        <!-- 💜 Available Templates Section -->
        <div class="templates-section">
            <div class="container">
                <div class="header">Available Templates</div>
                <div class="table-container">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        GridLines="None" CssClass="table" ShowHeader="True">
                        <Columns>
                            <asp:BoundField DataField="TemplateID" HeaderText="Template ID" />
                            <asp:BoundField DataField="TemplateName" HeaderText="Template Name" />
                            <asp:BoundField DataField="CreatedBy" HeaderText="Created By" />
                            <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="UpdatedDate" HeaderText="Last Updated Date" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <button class="btn btn-view" type="button" title="View">
                                        <i class="bi-eye"></i>
                                    </button>
                                    <button class="btn btn-edit" type="button" title="Edit">
                                        <i class="bi-pen-fill"></i>
                                    </button>
                                    <button class="btn btn-delete" type="button" title="Delete">
                                        <i class="bi-trash"></i>
                                    </button>
                                    <asp:Button ID="btnAssign" runat="server" Text="Assign"
                                        CssClass="btn btn-assign"
                                        OnClientClick="openAssignPopup(); return false;"
                                        CommandName="Assign"
                                        CommandArgument='<%# Eval("TemplateID") %>' />

                                </ItemTemplate>

                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <div id="assignPopup" class="popup-overlay">
                        <div class="popup-content">
                            <h3>Assign Audit</h3>

                            <asp:TextBox ID="TextBox1" runat="server" CssClass="popup-input" Placeholder="Enter audit name"></asp:TextBox>
                            <asp:TextBox ID="txtAuditor" runat="server" CssClass="popup-input" Placeholder="Enter auditor name"></asp:TextBox>
                            <asp:TextBox ID="txtAreaLineCell" runat="server" CssClass="popup-input" Placeholder="Enter area / line / cell"></asp:TextBox>
                            <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="popup-input"></asp:TextBox>

                            <div class="popup-actions">
                                <asp:Button ID="btnAssignConfirm" runat="server" Text="Assign"
                                    CssClass="btn btn-assign-confirm"
                                    OnClick="btnAssignConfirm_Click" />
                                <button type="button" class="btn btn-cancel" onclick="closeAssignPopup()">Cancel</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <!-- 💜 Template Name + Questions -->
        <div class="sub-container">
            <div class="section-header">5S Questionaries</div>
            <div class="p-4">
                <!-- Template Name + Buttons Row -->
                <div class="d-flex align-items-center justify-content-between mb-4 flex-wrap">
                    <!-- Left side: Template Name + TextBox -->
                    <div class="d-flex align-items-center flex-wrap gap-2" style="margin-left: 190px;">

                        <label for="txtAuditName" class="fw-bold mb-0 me-5">Template Name:</label>
                        <asp:TextBox ID="txtAuditName" runat="server"
                            CssClass="form-control text-center"
                            Style="width: 400px;"
                            placeholder="Enter audit name"></asp:TextBox>
                    </div>

                    <!-- Right side: Buttons -->
                    <div class="d-flex align-items-center gap-3">
                        <button type="button" class="btn btn-purple"
                            data-bs-toggle="modal" data-bs-target="#previewModal"
                            onclick="showPreview()">
                            Preview</button>

                        <asp:Button ID="btnSaveTemplate" runat="server"
                            Text="Save Template"
                            CssClass="btn btn-purple"
                            OnClick="SaveTemplate"
                            OnClientClick="return prepareSelectedForServer();" />
                    </div>
                </div>


                <div class="row">
                    <!-- Left Sidebar -->
                    <div class="col-md-3 pe-3">
                        <asp:Repeater ID="SectionRepeater" runat="server">
                            <ItemTemplate>
                                <button type="button" class="btn btn-outline-purple w-100 mb-2"
                                    id="btn<%# Eval("SectionName") %>"
                                    onclick="loadQuestions('<%# Eval("SectionName") %>', this)">
                                    <%# Eval("SectionName") %> (<span id='<%# Eval("SectionName") %>Count'>0</span>)
                                </button>
                            </ItemTemplate>
                        </asp:Repeater>

                        <div class="mt-4">
                            <button type="button" class="btn btn-purple w-100 mb-3" id="toggleCreateBtn">+ Create Question</button>

                            <div id="createQuestionContainer" class="p-3 rounded shadow-sm"
                                style="background: #f5eaff; display: none;">
                                <label class="fw-bold mb-1">Question</label>
                                <input type="text" id="txtQuestion" runat="server"
                                    class="form-control mb-3"
                                    placeholder="Enter question..." />

                                <label class="fw-bold mb-1">Select S</label>
                                <asp:DropDownList ID="ddlSType" runat="server"
                                    CssClass="form-select mb-3">
                                    <asp:ListItem Value="Sort">Sort</asp:ListItem>
                                    <asp:ListItem Value="Set in Order">Set in Order</asp:ListItem>
                                    <asp:ListItem Value="Shine">Shine</asp:ListItem>
                                    <asp:ListItem Value="Standardize">Standardize</asp:ListItem>
                                    <asp:ListItem Value="Sustain">Sustain</asp:ListItem>
                                </asp:DropDownList>

                                <asp:Button ID="btnAddQuestion" runat="server"
                                    Text="Add Question"
                                    CssClass="btn btn-purple w-100"
                                    OnClick="addNewQuestion" />
                            </div>
                        </div>
                    </div>

                    <!-- Right Question Area -->
                    <div class="col-md-9">
                        <h5 id="sectionTitle" class="fw-bold text-center mb-3 text-purple"></h5>
                        <div id="questionContainer"></div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- 💜 Preview Modal -->
    <div class="modal fade" id="previewModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header" style="background: #9726ae; color: white;">
                    <h5 class="modal-title">Audit Preview</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body" id="previewContent"></div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="hfQuestionsJSON" runat="server" />
    <asp:HiddenField ID="hfSelectedQuestionsJSON" runat="server" />


    <script>
        const allQuestions = JSON.parse(document.getElementById('<%= hfQuestionsJSON.ClientID %>').value || "{}");
        const selected = {};

        function loadQuestions(section, btn) {
            document.querySelectorAll('.btn-outline-purple').forEach(b => b.classList.remove('active-section'));
            btn.classList.add('active-section');

            const container = document.getElementById("questionContainer");
            const title = document.getElementById("sectionTitle");
            title.innerText = section + " Section";

            const questions = allQuestions[section] || [];
            container.innerHTML = "";

            questions.forEach((q, i) => {
                const id = section + "_q" + i;
                const checked = selected[section]?.includes(q) ? "checked" : "";
                container.innerHTML += `
                <div class="form-check mb-2">
                    <input type="checkbox" id="${id}" value="${q}" ${checked}
                        onchange="toggleSelect('${section}', '${q}', this.checked)">
                    <label for="${id}" class="ms-1">${q}</label>
                </div>`;
            });
        }

        function toggleSelect(section, question, isChecked) {
            if (!selected[section]) selected[section] = [];
            if (isChecked) selected[section].push(question);
            else selected[section] = selected[section].filter(q => q !== question);
            document.getElementById(section + "Count").innerText = selected[section].length;
        }

        function showPreview() {
            const preview = document.getElementById("previewContent");
            preview.innerHTML = "";

            if (Object.keys(selected).length === 0) {
                preview.innerHTML = "<p class='text-center text-muted'>No questions selected.</p>";
                return;
            }

            for (const [section, questions] of Object.entries(selected)) {
                if (questions.length > 0) {
                    preview.innerHTML += `<h5 class='text-primary mt-3'>${section}</h5><ul>`;
                    questions.forEach(q => preview.innerHTML += `<li>${q}</li>`);
                    preview.innerHTML += "</ul>";
                }
            }
        }

        document.addEventListener("DOMContentLoaded", () => {
            loadQuestions("Sort", document.getElementById("btnSort"));
        });

        document.getElementById("toggleCreateBtn").addEventListener("click", () => {
            const box = document.getElementById("createQuestionContainer");
            box.style.display = (box.style.display === "none" || box.style.display === "") ? "block" : "none";
        });

        function addNewQuestion() {
            const q = document.getElementById("newQuestion").value.trim();
            const section = document.getElementById("selectSection").value;

            if (q === "") {
                alert("Please enter a question.");
                return;
            }

            if (!allQuestions[section]) allQuestions[section] = [];
            allQuestions[section].push(q);

            const currentTitle = document.getElementById("sectionTitle").innerText.replace(" Section", "");
            if (currentTitle === section) {
                loadQuestions(section, document.getElementById("btn" + section.replace(/\s/g, "")));
            }

            document.getElementById("newQuestion").value = "";
            alert("Question added to " + section + " successfully!");
        }
        function prepareSelectedForServer() {
            try {
                var selectedData = JSON.stringify(selected);
                document.getElementById('<%= hfSelectedQuestionsJSON.ClientID %>').value = selectedData;
                return true; // allow postback
            } catch (err) {
                console.error("Error preparing selected data:", err);
                alert("Something went wrong while saving.");
                return false;
            }
        }

        function openAssignPopup() {
            document.getElementById("assignPopup").style.display = "flex";
        }
        function closeAssignPopup() {
            document.getElementById("assignPopup").style.display = "none";
        }


    </script>
</asp:Content>
