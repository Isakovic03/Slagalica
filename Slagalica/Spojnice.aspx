<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Spojnice.aspx.cs" Inherits="Slagalica.Spojnice" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spojnice</title>
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
            text-align: center;
        }

        .game-container {
            background-color: #fff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 900px;
            margin-top: 30px;
        }

        .game-description {
            font-size: 1.5rem;
            margin-bottom: 30px;
            text-align: center;
            color: #333;
            font-weight: bold;
        }

        .button-container {
            display: grid;
            grid-template-columns: 1fr 1fr; /* 2 kolone */
            grid-template-rows: repeat(8, auto); /* 8 redova */
            gap: 15px;
            width: 100%;
            margin-top: 30px;
        }

        .game-button {
            background: linear-gradient(145deg, #8B4513, #A0522D);
            color: white;
            border: none;
            border-radius: 15px;
            padding: 20px;
            font-size: 1.4rem;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .game-button:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <!-- Naslov igre -->
        <h1>SPOJNICE</h1>

        <!-- Kontejner za opis igre i dugmadi -->
        <div class="game-container">
            <!-- Opis igre -->
            <div class="game-description">
                <asp:Label ID="opis" runat="server" Text="Opis igre" />
            </div>

            <!-- Dugmadi u 8x2 rasporedu -->
            <div class="button-container">
                <!-- Dugmadi -->
                <asp:Button ID="btn1" runat="server" Text="1" CssClass="game-button" OnClick="GameButtonClicked1" />
                <asp:Button ID="btn2" runat="server" Text="2" CssClass="game-button" OnClick="GameButtonClicked2" />
                <asp:Button ID="btn3" runat="server" Text="3" CssClass="game-button" OnClick="GameButtonClicked1" />
                <asp:Button ID="btn4" runat="server" Text="4" CssClass="game-button" OnClick="GameButtonClicked2" />
                <asp:Button ID="btn5" runat="server" Text="5" CssClass="game-button" OnClick="GameButtonClicked1" />
                <asp:Button ID="btn6" runat="server" Text="6" CssClass="game-button" OnClick="GameButtonClicked2" />
                <asp:Button ID="btn7" runat="server" Text="7" CssClass="game-button" OnClick="GameButtonClicked1" />
                <asp:Button ID="btn8" runat="server" Text="8" CssClass="game-button" OnClick="GameButtonClicked2" />
                
                <asp:Button ID="btn9" runat="server" Text="9" CssClass="game-button" OnClick="GameButtonClicked1" />
                <asp:Button ID="btn10" runat="server" Text="10" CssClass="game-button" OnClick="GameButtonClicked2" />
                <asp:Button ID="btn11" runat="server" Text="11" CssClass="game-button" OnClick="GameButtonClicked1" />
                <asp:Button ID="btn12" runat="server" Text="12" CssClass="game-button" OnClick="GameButtonClicked2" />
                <asp:Button ID="btn13" runat="server" Text="13" CssClass="game-button" OnClick="GameButtonClicked1" />
                <asp:Button ID="btn14" runat="server" Text="14" CssClass="game-button" OnClick="GameButtonClicked2" />
                <asp:Button ID="btn15" runat="server" Text="15" CssClass="game-button" OnClick="GameButtonClicked1" />
                <asp:Button ID="btn16" runat="server" Text="16" CssClass="game-button" OnClick="GameButtonClicked2" />
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
    </form>
</body>


</html>
