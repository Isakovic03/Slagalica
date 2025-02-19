<%@ Page Language="VB" AutoEventWireup="true" CodeBehind="Skocko.aspx.cs" Inherits="Slagalica.Skocko" %>

<!DOCTYPE html>
<html lang="sr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SKOCKO</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&display=swap" rel="stylesheet">
    <style>
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

        .quiz-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 600px;
            text-align: center;
            margin-top: 20px;
            position: relative;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(8, 1fr);
            gap: 10px;
            margin-top: 8px;
        }

        .square, .circle {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: bold;
            box-shadow: inset 3px 3px 6px rgba(0, 0, 0, 0.2), 3px 3px 6px rgba(0, 0, 0, 0.3);
        }

        .square {
            width: 70px;
            height: 70px;
            background-color: #8B4513;
            border-radius: 15px;
            color: white;
        }

        .circle {
            margin-top: 10px;
            width: 50px;
            height: 50px;
            background-color: #e0e0e0;
            border-radius: 50%;
        }

        .button-container {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }

        .button-container .square {
            font-size: 32px;
            color: white;
        }

        .button-container .square:nth-child(4) { color: black; } 
        .button-container .square:nth-child(5) { color: black; } 
        .button-container .square:nth-child(2) { color: red; } 
        .button-container .square:nth-child(3) { color: red; } 
        .button-container .square:nth-child(6) { color: gold; } 

        .delete-btn {
            background-color: red;
        }

        .confirm-btn {
            background-color: green;
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
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <h1>SKOCKO</h1>

                <div class="quiz-container" runat="server" id="kviz">
                    <asp:Label ID="opis" runat="server" Text="Opis teksta" />
                    <div class="grid">
                        <!-- Prvi red -->
                        <div class="square" id="Div1" runat="server"></div>
                        <div class="square" id="Div2" runat="server"></div>
                        <div class="square" id="Div3" runat="server"></div>
                        <div class="square" id="Div4" runat="server"></div>
                        <div class="circle" id="Div5" runat="server"></div>
                        <div class="circle" id="Div6" runat="server"></div>
                        <div class="circle" id="Div7" runat="server"></div>
                        <div class="circle" id="Div8" runat="server"></div>

                        <!-- Drugi red -->
                        <div class="square" id="Div9" runat="server"></div>
                        <div class="square" id="Div10" runat="server"></div>
                        <div class="square" id="Div11" runat="server"></div>
                        <div class="square" id="Div12" runat="server"></div>
                        <div class="circle" id="Div13" runat="server"></div>
                        <div class="circle" id="Div14" runat="server"></div>
                        <div class="circle" id="Div15" runat="server"></div>
                        <div class="circle" id="Div16" runat="server"></div>

                        <!-- Treći red -->
                        <div class="square" id="Div17" runat="server"></div>
                        <div class="square" id="Div18" runat="server"></div>
                        <div class="square" id="Div19" runat="server"></div>
                        <div class="square" id="Div20" runat="server"></div>
                        <div class="circle" id="Div21" runat="server"></div>
                        <div class="circle" id="Div22" runat="server"></div>
                        <div class="circle" id="Div23" runat="server"></div>
                        <div class="circle" id="Div24" runat="server"></div>

                        <!-- Četvrti red -->
                        <div class="square" id="Div25" runat="server"></div>
                        <div class="square" id="Div26" runat="server"></div>
                        <div class="square" id="Div27" runat="server"></div>
                        <div class="square" id="Div28" runat="server"></div>
                        <div class="circle" id="Div29" runat="server"></div>
                        <div class="circle" id="Div30" runat="server"></div>
                        <div class="circle" id="Div31" runat="server"></div>
                        <div class="circle" id="Div32" runat="server"></div>

                        <!-- Peti red -->
                        <div class="square" id="Div33" runat="server"></div>
                        <div class="square" id="Div34" runat="server"></div>
                        <div class="square" id="Div35" runat="server"></div>
                        <div class="square" id="Div36" runat="server"></div>
                        <div class="circle" id="Div37" runat="server"></div>
                        <div class="circle" id="Div38" runat="server"></div>
                        <div class="circle" id="Div39" runat="server"></div>
                        <div class="circle" id="Div40" runat="server"></div>

                        <!-- Sesti red -->
                        <div class="square" id="Div41" runat="server"></div>
                        <div class="square" id="Div42" runat="server"></div>
                        <div class="square" id="Div43" runat="server"></div>
                        <div class="square" id="Div44" runat="server"></div>
                        <div class="circle" id="Div45" runat="server"></div>
                        <div class="circle" id="Div46" runat="server"></div>
                        <div class="circle" id="Div47" runat="server"></div>
                        <div class="circle" id="Div48" runat="server"></div>
                    </div>
                    <!-- Dugmad za odabir simbola -->
                    <div class="button-container">
                        <asp:Button ID="btnSkocko" runat="server" Text="🙂" CssClass="square" OnClick="Klik" CommandArgument="1"/>
                        <asp:Button ID="btnHerc" runat="server" Text="♥" CssClass="square"  OnClick="Klik" CommandArgument="2"/>
                        <asp:Button ID="btnKaro" runat="server" Text="♦" CssClass="square"  OnClick="Klik" CommandArgument="3"/>
                        <asp:Button ID="btnTref" runat="server" Text="♣" CssClass="square" OnClick="Klik" CommandArgument="4"/>
                        <asp:Button ID="btnPik" runat="server" Text="♠" CssClass="square" OnClick="Klik" CommandArgument="5"/>
                        <asp:Button ID="btnZvezda" runat="server" Text="★" CssClass="square" OnClick="Klik" CommandArgument="6"/>
                        <asp:Button ID="btnConfirm" runat="server" Text="✔" CssClass="square confirm-btn" OnClick="Potvrdi" />
                        <asp:Button ID="btnDelete" runat="server" Text="X" CssClass="square delete-btn" OnClick="Izbrisi" />
                    </div>
                </div>
                <div class="next-game-container" runat="server" visible="false" id="nextgame">
                    <asp:Label ID="lblUkupniPoeni" CssClass="lbl-ukupni-poeni" runat="server" Text="Ukupno poena: "></asp:Label>
                    <a href="Slagalica.aspx" class="next-game-button">Izaberite sledeću igru</a>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSkocko" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnHerc" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnKaro" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnTref" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnPik" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnZvezda" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnConfirm" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>

</html>
