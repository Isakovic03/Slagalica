<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Asocijacije.aspx.cs" Inherits="Slagalica.Asocijacije" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Asocijacije</title>
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
        grid-template-columns: repeat(4, 1fr); /* 4 kolone */
        grid-template-rows: repeat(4, auto); /* 4 reda */
        gap: 20px;
        margin-top: 30px;
        grid-template-areas:
            "btn1 btn2 btn3 btn4"
            "btn5 btn6 btn7 btn8"
            "btn9 btn10 btn11 btn12"
            "btn13 btn14 btn15 btn16";
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
        text-align: center;
    }

    .game-button:hover {
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
    }

    .text-box-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* 4 kolone */
    gap: 20px;
    margin-top: 20px;
    grid-template-areas:
        "txt1 txt2 txt3 txt4";
    max-width: 100%; /* Osiguraj da kontejner zauzima 100% širine svog roditelja */
}

.game-text-box {
    padding: 10px;
    font-size: 1.2rem;
    border-radius: 10px;
    border: 1px solid #ccc;
    text-align: center;
    font-weight: bold;
    width: 90%; /* Uvećaj širinu da bude uži unutar svake kolone */
    margin: 0 auto; /* Centriraj tekstboks u okviru kolone */
}
/* Stilizovanje za zelene dugmadi */
.green-button {
    background: linear-gradient(145deg, #4CAF50, #388E3C); /* Zelena boja za dugme */
    color: white;
    border: none;
    border-radius: 15px;
    padding: 20px;
    font-size: 1.4rem;
    font-weight: bold;
    cursor: pointer;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s, box-shadow 0.3s;
    text-align: center;
}

.green-button:hover {
    background: linear-gradient(145deg, #388E3C, #4CAF50); /* Tamnija zelena boja na hover */
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
}

/* Stilizovanje za zelene tekst kutije */
.green-text-box {
    padding: 10px;
    font-size: 1.2rem;
    border-radius: 10px;
    border: 1px solid #4CAF50; /* Zelena boja ivice */
    text-align: center;
    font-weight: bold;
    width: 90%; /* Uvećaj širinu da bude uži unutar svake kolone */
    margin: 0 auto; /* Centriraj tekstboks u okviru kolone */
    background-color: #e8f5e9; /* Svetlo zelena pozadina */
}

.green-text-box:focus {
    border-color: #388E3C; /* Tamnija zelena kada je tekst kutija u fokusu */
    background-color: #c8e6c9; /* Zelenkasta pozadina u fokusu */
}
/* Stilizovanje za crvene tekst kutije */
.red-text-box {
    padding: 10px;
    font-size: 1.2rem;
    border-radius: 10px;
    border: 1px solid #F44336; /* Crvena boja ivice */
    text-align: center;
    font-weight: bold;
    width: 90%; /* Uvećaj širinu da bude uži unutar svake kolone */
    margin: 0 auto; /* Centriraj tekstboks u okviru kolone */
    background-color: #FFEBEE; /* Svetlo crvena pozadina */
}

.red-text-box:focus {
    border-color: #D32F2F; /* Tamnija crvena kada je tekst kutija u fokusu */
    background-color: #FFCDD2; /* Svetlija crvena pozadina u fokusu */
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
                <!-- Naslov igre -->
                <h1>ASOCIJACIJE</h1>

                <!-- Kontejner za igru -->
                <div class="game-container" runat="server" id="asocijacije">
                    <!-- Opis igre -->
                    <div class="game-description">
                        <asp:Label ID="opis" runat="server" Text="Opis igre" />
                    </div>

                    <!-- Dugmadi za igru (4 reda i 4 kolone) -->
                    <div class="button-container">
                        <asp:Button ID="btn1" runat="server" Text="a1" CssClass="game-button" OnClick="Klik" CommandArgument="0"/>
                        <asp:Button ID="btn2" runat="server" Text="b1" CssClass="game-button" OnClick="Klik" CommandArgument="4"/>
                        <asp:Button ID="btn3" runat="server" Text="c1" CssClass="game-button" OnClick="Klik" CommandArgument="8"/>
                        <asp:Button ID="btn4" runat="server" Text="d1" CssClass="game-button" OnClick="Klik" CommandArgument="12"/>

                        <asp:Button ID="btn5" runat="server" Text="a2" CssClass="game-button" OnClick="Klik" CommandArgument="1"/>
                        <asp:Button ID="btn6" runat="server" Text="b2" CssClass="game-button" OnClick="Klik" CommandArgument="5"/>
                        <asp:Button ID="btn7" runat="server" Text="c2" CssClass="game-button" OnClick="Klik" CommandArgument="9"/>
                        <asp:Button ID="btn8" runat="server" Text="d2" CssClass="game-button" OnClick="Klik" CommandArgument="13"/>

                        <asp:Button ID="btn9" runat="server" Text="a3" CssClass="game-button" OnClick="Klik" CommandArgument="2"/>
                        <asp:Button ID="btn10" runat="server" Text="b3" CssClass="game-button" OnClick="Klik" CommandArgument="6"/>
                        <asp:Button ID="btn11" runat="server" Text="c3" CssClass="game-button" OnClick="Klik" CommandArgument="10"/>
                        <asp:Button ID="btn12" runat="server" Text="d3" CssClass="game-button" OnClick="Klik" CommandArgument="14"/>

                        <asp:Button ID="btn13" runat="server" Text="a4" CssClass="game-button" OnClick="Klik" CommandArgument="3"/>
                        <asp:Button ID="btn14" runat="server" Text="b4" CssClass="game-button" OnClick="Klik" CommandArgument="7"/>
                        <asp:Button ID="btn15" runat="server" Text="c4" CssClass="game-button" OnClick="Klik" CommandArgument="11"/>
                        <asp:Button ID="btn16" runat="server" Text="d4" CssClass="game-button" OnClick="Klik" CommandArgument="15"/>
                    </div>

                    <!-- Tekst kutije ispod svake kolone -->
                    <div class="text-box-container">
                        <asp:TextBox ID="txt1" runat="server" CssClass="game-text-box" />
                        <asp:TextBox ID="txt2" runat="server" CssClass="game-text-box" />
                        <asp:TextBox ID="txt3" runat="server" CssClass="game-text-box" />
                        <asp:TextBox ID="txt4" runat="server" CssClass="game-text-box" />
                    </div>
                    <asp:TextBox ID="txtKonacno" runat="server" CssClass="game-text-box" Style="display: block; width: 97.8%; text-align: center; margin-top: 20px;" />

<!-- Dugme za potvrdu -->
                    <div style="display: flex; justify-content: center; margin-top: 20px;">
                        <asp:Button ID="btnPotvrdi" runat="server" Text="Potvrdi" CssClass="game-button" OnClick="Potvrdi"/>
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
