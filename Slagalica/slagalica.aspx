<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="slagalica.aspx.cs" Inherits="Slagalica.slagalica" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Slagalica</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@700&display=swap');

        body {
            margin: 0;
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(135deg, #f8efd4, #d6c9b1);
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            padding: 20px;
        }

        h1 {
            font-size: 5rem;
            margin-top: 2rem;
            margin-bottom: 3rem;
            color: #8B4513;
            text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.3);
            letter-spacing: 0.15rem;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            width: 90%;
            max-width: 1200px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 25px;
            padding: 40px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        .button-wrapper {
            background: linear-gradient(145deg, #f7dec4, #e9c8a9);
            border-radius: 20px;
            box-shadow: 7px 7px 20px rgba(0, 0, 0, 0.2), -7px -7px 20px rgba(255, 255, 255, 0.7);
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .button-wrapper:hover {
            transform: translateY(-10px);
            box-shadow: 12px 12px 30px rgba(0, 0, 0, 0.25), -12px -12px 30px rgba(255, 255, 255, 0.8);
        }

        .button-style {
            background: linear-gradient(145deg, #8B4513, #A0522D);
            color: white;
            border: none;
            border-radius: 15px;
            padding: 15px 40px;
            font-size: 1.4rem;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .button-style:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
        }

        .score {
            margin-top: 15px;
            font-size: 1.2rem;
            font-weight: bold;
            color: #5A5A5A;
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 4rem;
                margin-top: 1.5rem;
            }

            .container {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                padding: 20px;
            }

            .button-style {
                font-size: 1.2rem;
                padding: 10px 25px;
            }
        }
    </style>
</head>
<body>
    <h1>SLAGALICA</h1>
    <form runat="server">
        <div class="container">
            <div class="button-wrapper">
                <asp:Button ID="btnSlagalica" runat="server" CssClass="button-style" Text="Slagalica"/>
                <asp:Label ID="lblSlagalica" runat="server" CssClass="score" Text="Poeni: 0"></asp:Label>
            </div>
            <div class="button-wrapper">
                <asp:Button ID="btnMojBroj" runat="server" CssClass="button-style" Text="Moj broj"/>
                <asp:Label ID="lblMojBroj" runat="server" CssClass="score" Text="Poeni: 0"></asp:Label>
            </div>
            <div class="button-wrapper">
                <asp:Button ID="btnSpojnice" runat="server" CssClass="button-style" Text="Spojnice"/>
                <asp:Label ID="lblSpojnice" runat="server" CssClass="score" Text="Poeni: 0"></asp:Label>
            </div>
            <div class="button-wrapper">
                <asp:Button ID="btnSkocko" runat="server" CssClass="button-style" Text="Skocko"/>
                <asp:Label ID="lblSkocko" runat="server" CssClass="score" Text="Poeni: 0"></asp:Label>
            </div>
            <div class="button-wrapper">
                <asp:Button ID="btnKoZnaZna"  runat="server" CssClass="button-style" Text="Ko zna zna" OnClick="btnkzz"/>
                <asp:Label ID="lblKoZnaZna" runat="server" CssClass="score" Text="Poeni: 0"></asp:Label>
            </div>
            <div class="button-wrapper">
                <asp:Button ID="btnAsocijacije" runat="server" CssClass="button-style" Text="Asocijacije"/>
                <asp:Label ID="lblAsocijacije" runat="server" CssClass="score" Text="Poeni: 0"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
