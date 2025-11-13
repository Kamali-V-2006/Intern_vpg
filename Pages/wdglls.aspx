<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Main.Master" AutoEventWireup="true" CodeBehind="wdglls.aspx.cs" Inherits="FiveS.Pages.wdglls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <title>New WDGLL Standard</title>
    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/bootstrap-icons.css" rel="stylesheet" />
    
<style>
    /* 🌸 Overall Page */
    body {
        background: linear-gradient(135deg, #ede7f6, #f3e5f5);
        font-family: 'Segoe UI', sans-serif;
        color: #3a2d5f;
        min-height: 100vh;
        overflow-x: hidden;
    }

    /* 🌸 Card Styling */
    .card {
        border: none;
        border-radius: 16px;
        background: rgba(255, 255, 255, 0.9);
        backdrop-filter: blur(8px);
        box-shadow: 0 6px 18px rgba(155, 89, 182, 0.12);
        transition: all 0.3s ease;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 28px rgba(155, 89, 182, 0.25);
    }

    /* 🌸 Form Labels & Inputs */
    .form-label {
        font-weight: 600;
        color: #6a1b9a;
    }

    .form-control, 
    .form-select {
        border-radius: 10px;
        border: 1px solid #d1a1f2;
        padding: 10px 12px;
        transition: 0.3s ease;
        background-color: #fff;
    }

    .form-control:focus,
    .form-select:focus {
        border-color: #9c27b0;
        box-shadow: 0 0 0 0.25rem rgba(156, 39, 176, 0.25);
    }

    /* 🌸 Upload Box */
    .upload-box {
        border: 2px dashed #d1a1f2;
        border-radius: 12px;
        padding: 35px 20px;
        text-align: center;
        color: #7b1fa2;
        background: #faf5ff;
        transition: all 0.3s ease;
    }

    .upload-box:hover {
        border-color: #9c27b0;
        background: #f7edff;
        box-shadow: 0 4px 12px rgba(156, 39, 176, 0.15);
        transform: scale(1.02);
    }

    /* 🌸 Buttons */
    .btn-purple {
        background: linear-gradient(90deg, #8e24aa, #ba68c8);
        border: none;
        border-radius: 10px;
        color: #fff;
        font-weight: 500;
        padding: 8px 16px;
        transition: all 0.3s ease;
        box-shadow: 0 3px 10px rgba(156, 39, 176, 0.2);
    }

    .btn-purple:hover {
        background: linear-gradient(90deg, #9c27b0, #ce93d8);
        transform: scale(1.05);
        box-shadow: 0 6px 16px rgba(156, 39, 176, 0.3);
    }

    /* 🌸 Highlight Header */
    .highlight-header {
        background: linear-gradient(90deg, rgba(156,39,176,0.08), rgba(186,104,200,0.12));
        border-left: 5px solid #9c27b0;
        padding: 15px 20px;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(156, 39, 176, 0.1);
    }

    .highlight-header h4 {
        color: #7b1fa2;
        font-weight: 700;
    }

    .highlight-header p {
        color: #5e5a78;
        margin-bottom: 0;
    }

    /* 🌸 Preview Media */
    #previewImage {
        display: none;
        margin-top: 15px;
        border-radius: 10px;
        max-height: 250px;
        border: 2px solid #d1a1f2;
        box-shadow: 0 4px 10px rgba(156, 39, 176, 0.15);
        transition: transform 0.3s ease;
    }

    #previewImage:hover {
        transform: scale(1.05);
    }

    #video {
        display: none;
        width: 100%;
        border-radius: 10px;
        margin-top: 10px;
        border: 2px solid #d1a1f2;
        box-shadow: 0 4px 10px rgba(156, 39, 176, 0.15);
    }

    /* 🌸 Upload Action Buttons */
    .upload-actions {
        margin-top: 15px;
        display: flex;
        justify-content: center;
        gap: 12px;
    }

    /* 🌸 Responsive */
    @media (max-width: 992px) {
        .card {
            margin-bottom: 20px;
        }
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
            <div class="card p-4">
                <div class="highlight-header mb-4">
                    <h4 class="fw-bold mb-1">New WDGLL Standard</h4>
                    <p>Upload the “What Does Good Look Like” reference</p>
                </div>

                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Title</label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="e.g., Bench Layout – Torque Tools"></asp:TextBox>
                    </div>

                    <div class="col-md-3">
                        <label class="form-label">Site</label>
                        <asp:DropDownList ID="ddlSite" runat="server" CssClass="form-select">
                            <asp:ListItem>Plant A</asp:ListItem>
                            <asp:ListItem>Plant B</asp:ListItem>
                            <asp:ListItem>Plant C</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-3">
                        <label class="form-label">Zone</label>
                        <asp:DropDownList ID="ddlZone" runat="server" CssClass="form-select">
                            <asp:ListItem>Assembly</asp:ListItem>
                            <asp:ListItem>Packaging</asp:ListItem>
                            <asp:ListItem>Testing</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Checklist Points</label>
                        <asp:TextBox ID="txtChecklist" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" Columns="50" Placeholder="One per line"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Photo / Evidence</label>
                        <div class="upload-box">
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="d-none" accept="image/*" />
                            <div class="upload-actions">
                                <button type="button" id="uploadBtn" class="btn btn-purple">
                                    <i class="bi bi-upload"></i> Upload
                                </button>
                                <button type="button" id="captureBtn" class="btn btn-purple">
                                    <i class="bi bi-camera-fill"></i> Capture
                                </button>
                            </div>
                            <asp:Label ID="lblFileName" runat="server" CssClass="text-muted mt-2 d-block"></asp:Label>
                        </div>

                        <img id="previewImage" class="img-fluid" alt="Preview" />
                        <video id="video" autoplay playsinline></video>
                    </div>

                    <div class="col-md-12 text-end mt-4">
                        <asp:Button ID="btnSave" runat="server" Text="Save Standard" CssClass="btn btn-purple" OnClick="btnSave_Click" />
                    </div>

                    <div class="text-center mt-3">
                        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>


    <script>
        // Handle Upload button click
        document.getElementById('uploadBtn').addEventListener('click', function () {
            document.getElementById('<%= FileUpload1.ClientID %>').click();
        });

        // Show preview after upload
        document.getElementById('<%= FileUpload1.ClientID %>').addEventListener('change', function (event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.getElementById('previewImage');
                    img.src = e.target.result;
                    img.style.display = 'block';
                };
                reader.readAsDataURL(file);
                document.getElementById('<%= lblFileName.ClientID %>').innerText = file.name;
            }
        });

        // Camera capture
        const captureBtn = document.getElementById('captureBtn');
        const video = document.getElementById('video');
        const preview = document.getElementById('previewImage');

        captureBtn.addEventListener('click', async () => {
            if (video.style.display === 'none' || video.style.display === '') {
                try {
                    const stream = await navigator.mediaDevices.getUserMedia({ video: true });
                    video.srcObject = stream;
                    video.style.display = 'block';
                    preview.style.display = 'none';
                    captureBtn.innerHTML = '<i class="bi bi-camera"></i> Take Snapshot';
                } catch (err) {
                    alert('Camera access denied or not available.');
                }
            } else {
                const canvas = document.createElement('canvas');
                canvas.width = video.videoWidth;
                canvas.height = video.videoHeight;
                canvas.getContext('2d').drawImage(video, 0, 0);
                const dataUrl = canvas.toDataURL('image/png');
                preview.src = dataUrl;
                preview.style.display = 'block';
                video.style.display = 'none';
                captureBtn.innerHTML = '<i class="bi bi-camera"></i> Capture Again';

                // Stop camera stream
                const stream = video.srcObject;
                const tracks = stream.getTracks();
                tracks.forEach(track => track.stop());
            }
        });
    </script>
</asp:Content>



        

