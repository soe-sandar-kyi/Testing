<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageTesting.aspx.cs" Inherits="Testing.ImageTesting" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile Image Upload</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .profile-pic {
            position: relative;
            display: inline-block;
        }
        .profile-pic img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
        }
        .profile-pic .upload-button {
            position: absolute;
            top: 0;
            left: 0;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 20px;
            cursor: pointer;
            opacity: 0;
            transition: opacity 0.3s;
        }
        .profile-pic:hover .upload-button {
            opacity: 1;
        }
        .hidden-input {
            display: none;
        }
    </style>
    <script>
        function triggerFileInput() {
            document.getElementById('fileUpload').click();
        }

        function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('imgProfile').src = e.target.result;
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="container mt-5">
            <h2>Profile Image Upload</h2>
            <div class="form-group profile-pic">
                <asp:Image ID="imgProfile" runat="server" CssClass="rounded-circle" Width="150px" Height="150px" ImageUrl="~/images/rabbit.jpg" />
                <div class="upload-button" onclick="triggerFileInput()">&#x1F4F7;</div>
                <asp:FileUpload ID="fileUpload" runat="server" CssClass="hidden-input" OnChange="previewImage(this)" />
            </div>
            <div class="form-group mt-3">
                <asp:Button ID="btnUpload" runat="server" Text="Change Profile" CssClass="btn btn-primary" OnClick="btnUpload_Click" />
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

