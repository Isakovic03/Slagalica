<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MojBroj.aspx.cs" Inherits="Slagalica.MojBroj" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOJ BROJ</title>
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
        .game-btn {
    background: linear-gradient(145deg, #8B4513, #A0522D);
    color: white;
    border: none;
    border-radius: 10px;
    width: 80px; /* Kvadratna veličina */
    height: 80px; /* Kvadratna veličina */
    font-size: 1.4rem;
    font-weight: bold;
    cursor: pointer;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s, box-shadow 0.3s;
    text-align: center;
}

.game-btn:hover {
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
}

.wide {
    width: calc(80px * 6 + 10px * 5); /* Širina kao 6 kvadratnih dugmadi + 5px razmak */
    height: 80px; /* Visina ostaje ista */
}

.button-row {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    margin-bottom: 10px;
}

.spacer {
    flex-grow: 1;
}

.game-input {
    width: calc(80px * 6 + 10px * 5);
    height: 80px;
    font-size: 1.4rem;
    text-align: center;
    border: 2px solid #8B4513;
    border-radius: 10px;
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
.game-btn-gray {
    background: linear-gradient(145deg, #A9A9A9, #808080);
    color: white;
    border: none;
    border-radius: 10px;
    width: 80px;
    height: 80px;
    font-size: 1.4rem;
    font-weight: bold;
    cursor: pointer;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s, box-shadow 0.3s;
    text-align: center;
}

.game-btn-gray:hover {
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
            <h1>MOJ BROJ</h1>

            <!-- Kontejner za igru -->
            <div class="game-container" runat="server" id="Kont">
                <!-- Prvi red: 3 dugmeta centrirana + 2 desno -->
                <div class="button-row">
                    <asp:Button ID="btn1" runat="server" Text="" CssClass="game-btn" />
                    <asp:Button ID="btn2" runat="server" Text="" CssClass="game-btn" />
                    <asp:Button ID="btn3" runat="server" Text="" CssClass="game-btn" />
                    <div class="spacer"></div>
                    <asp:Button ID="btnz1" runat="server" Text="+" CssClass="game-btn" onclick="znak"/>
                    <asp:Button ID="btnz2" runat="server" Text="-" CssClass="game-btn" onclick="znak"/>
                </div>

                <!-- Drugi red: 6 dugmadi centrirano + 2 desno -->
                <div class="button-row">
                    <asp:Button ID="btn4" runat="server" Text="" CssClass="game-btn" onclick="broj"/>
                    <asp:Button ID="btn5" runat="server" Text="" CssClass="game-btn" onclick="broj"/>
                    <asp:Button ID="btn6" runat="server" Text="" CssClass="game-btn" onclick="broj"/>
                    <asp:Button ID="btn7" runat="server" Text="" CssClass="game-btn" onclick="broj"/>
                    <asp:Button ID="btn8" runat="server" Text="" CssClass="game-btn" onclick="broj"/>
                    <asp:Button ID="btn9" runat="server" Text="" CssClass="game-btn" onclick="broj"/>
                    <div class="spacer"></div>
                    <asp:Button ID="btnz3" runat="server" Text="*" CssClass="game-btn" onclick="znak"/>
                    <asp:Button ID="btnz4" runat="server" Text="/" CssClass="game-btn" onclick="znak"/>
                </div>

                <!-- Treći red: 1 dugme široko kao prethodnih 6 + 2 desno -->
                <div class="button-row">
                    <asp:Button ID="btn10" runat="server" Text="STOP" CssClass="game-btn wide" onclick="Stop"/>
                    <asp:Button ID="btn11" runat="server" visible="false" Text="POTVRDI UNETU KOMBINACIJU" CssClass="game-btn wide" onclick="Potvrdi"/>
                    <div class="spacer"></div>
                    <asp:Button ID="btnz5" runat="server" Text="(" CssClass="game-btn" onclick="znak"/>
                    <asp:Button ID="btnz6" runat="server" Text=")" CssClass="game-btn" onclick="znak"/>
                </div>

                <!-- Četvrti red: Tekstualni unos širine kao prethodno dugme + 1 dugme pored -->
                <div class="button-row">
                    <asp:TextBox ID="txtInput" runat="server" CssClass="game-input" Enabled="false" Placeholder="Unesite broj"></asp:TextBox>
                    <asp:Button ID="btnIzbrisi" runat="server" Text="X" CssClass="game-btn" Onclick="Izbrisi"/>
                </div>
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
