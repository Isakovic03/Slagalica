<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NajduzaRec.aspx.cs" Inherits="Slagalica.NajduzaRec" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Najduža Reč</title>
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
            max-width: 1100px;
            margin-top: 30px;
            display: flex;
            justify-content: center;
            flex-wrap: wrap; /* Omogućava wrapanje dugmadi */
            gap: 10px; /* Razmak između dugmadi */
        }

        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap');

.game-btn {
    font-family: 'Poppins', sans-serif; /* Bolji font za latinična slova */
    font-size: 1.9rem; /* Veći font za bolju čitljivost */
    background: linear-gradient(145deg, #8B4513, #A0522D);
    color: white;
    border: none;
    border-radius: 10px;
    width: 80px; /* Malo veće dugme */
    height: 80px;
    font-weight: bold;
    cursor: pointer;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s, box-shadow 0.3s;
    text-align: center;
}

.game-btn-wide {
    width: 140px; /* Povećana širina za "Stop" i "Potvrdi" */
    height: 80px; /* Da bude ujednačeno */
    font-size: 1.5rem;
}

.game-btn:hover {
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
}

        .game-input {
            width: 90%; /* Uzima celu širinu */
            height: 35px;
            font-size: 1.4rem;
            padding: 10px;
            border-radius: 10px;
            border: 2px solid #8B4513;
            margin-top: 20px;
            text-align: center;
        }

        .game-btn-gray {
    background: linear-gradient(145deg, #A9A9A9, #808080);
    color: white;
    border: none;
    border-radius: 10px;
    width: 80px;
    height: 80px;
    font-size: 1.9rem;
    font-weight: bold;
    cursor: pointer;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s, box-shadow 0.3s;
    text-align: center;
}

.game-btn-gray:hover {
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
}
.next-game-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 30px;
    background: rgba(255, 255, 255, 0.9);
    padding: 40px;
    border-radius: 25px;
    width: 80%;
    max-width: 700px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
}

.lbl-ukupni-poeni {
    font-size: 2rem;
    font-weight: bold;
    color: #8B4513;
    margin-bottom: 20px;
    text-align: center;
}

.next-game-button {
    background: linear-gradient(145deg, #8B4513, #A0522D);
    color: white;
    text-decoration: none;
    border-radius: 15px;
    padding: 20px 50px;
    font-size: 1.5rem;
    font-weight: bold;
    cursor: pointer;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s, box-shadow 0.3s;
    text-align: center;
}

.next-game-button:hover {
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Dodajemo ScriptManager -->
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        
        <h1>Najduza Rec</h1>
        
        <!-- UpdatePanel za celu formu -->
        <asp:UpdatePanel ID="updatePanel" runat="server">
            <ContentTemplate>
                <div class="game-container" runat="server" id="gamecont">
                    <asp:Button ID="btn1" runat="server" Text="" CssClass="game-btn" onclick="Slovo" Enabled="false"/>
                    <asp:Button ID="btn2" runat="server" Text="" CssClass="game-btn" onclick="Slovo" Enabled="false"/>
                    <asp:Button ID="btn3" runat="server" Text="" CssClass="game-btn" onclick="Slovo" Enabled="false"/>
                    <asp:Button ID="btn4" runat="server" Text="" CssClass="game-btn" onclick="Slovo" Enabled="false"/>
                    <asp:Button ID="btn5" runat="server" Text="" CssClass="game-btn" onclick="Slovo" Enabled="false"/>
                    <asp:Button ID="btn6" runat="server" Text="" CssClass="game-btn" onclick="Slovo" Enabled="false"/>
                    <asp:Button ID="btn7" runat="server" Text="" CssClass="game-btn" onclick="Slovo" Enabled="false"/>
                    <asp:Button ID="btn8" runat="server" Text="" CssClass="game-btn" onclick="Slovo" Enabled="false"/>
                    <asp:Button ID="btn9" runat="server" Text="" CssClass="game-btn" onclick="Slovo" Enabled="false"/>
                    <asp:Button ID="btn10" runat="server" Text="" CssClass="game-btn" onclick="Slovo" Enabled="false"/>
                    <asp:Button ID="btn11" runat="server" Text="" CssClass="game-btn" onclick="Slovo" Enabled="false"/>
                    <asp:Button ID="btn12" runat="server" Text="" CssClass="game-btn" onclick="Slovo" Enabled="false"/>
                    <!-- TextBox ispod dugmadi -->
                    <asp:TextBox ID="txtInput" runat="server" CssClass="game-input" Enabled = "false" placeholder="Unesi tekst"></asp:TextBox>

                    <!-- Dva nova dugmeta sa širim dizajnom -->
                    <asp:Button ID="btnStop" runat="server" Text="Stop" CssClass="game-btn game-btn-wide" Visible="true" onclick="Stop"/>
                    <asp:Button ID="btnPotvrdi" runat="server" Text="Potvrdi" CssClass="game-btn game-btn-wide" Visible="false" onclick="Potvrdi"/>
                    <asp:Button ID="btnIzbrisi" runat="server" Text="X" CssClass="game-btn" enabled="false" onclick="Izbrisi"/>
                </div>
                <div class="next-game-container" runat="server" visible="false" id="nextgame">
                   <asp:Label ID="lblUkupniPoeni" CssClass="lbl-ukupni-poeni" runat="server" Text="Ukupno poena: "></asp:Label>
                   <a href="Slagalica.aspx" class="next-game-button">Izaberite sledeću igru</a>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
