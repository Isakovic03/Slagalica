<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KoZnaZna.aspx.cs" Inherits="Slagalica.KoZnaZna" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ko Zna Zna</title>
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

.score-container {
    background: rgba(255, 255, 255, 0.8);
    padding: 10px;
    border-radius: 15px;
    font-size: 1.2rem;
    font-weight: bold;
    position: absolute;
    top: 20px;
    right: 20px;
}

.quiz-container {
    background: rgba(255, 255, 255, 0.95);
    padding: 30px;
    border-radius: 20px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
    width: 100%;
    max-width: 600px;
    text-align: center;
    margin-top: 80px;
    position: relative; /* Omogućava pozicioniranje unutar ovog diva */
}

.question {
    font-size: 1.8rem;
    margin-top: 20px;
    margin-bottom: 20px;
}

.options {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 10px;
    margin-top: 20px;
}

.option-button, .skip-button {
    background: linear-gradient(145deg, #8B4513, #A0522D);
    color: white;
    border: none;
    border-radius: 15px;
    padding: 15px 30px;
    font-size: 1.4rem;
    font-weight: bold;
    cursor: pointer;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s, box-shadow 0.3s;
}

.option-button:hover, .skip-button:hover {
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
}

.skip-button {
    font-size: 1.2rem;
    padding: 10px 20px;
    position: absolute; /* Apsolutno pozicioniranje unutar diva */
    top: 5px; /* Stavlja dugme na sam vrh diva */
    right: 5px;/* Mali padding sa desne strane */
    z-index: 1; /* Osigurava da bude iznad drugih elemenata */
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
        <asp:ScriptManager runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="updatePanel" runat="server">
            <ContentTemplate>
                <h1>KO ZNA ZNA</h1>

                <!-- Ukupan broj poena -->
                <div class="score-container" runat="server" id="kzz">
                    <asp:Label ID="lblPoeni" runat="server" Text="Poeni: 0"></asp:Label>
                </div>

                <div class="quiz-container" runat="server" id="kzz2">
                    <asp:Button ID="btnSkip" runat="server" Text="Ne znam" CssClass="skip-button" OnClick="SkipQuestion" />

                    <!-- Pitanje -->
                    <div class="question">
                        <asp:Label ID="pitanje" runat="server" Text="Ovo je primer label-a"></asp:Label>
                    </div>

                    <!-- Opcije sa ASP.NET dugmadi -->
                    <div class="options">
                        <asp:Button ID="btnOption1" runat="server" Text="Pariz" OnClick="OptionClicked" CssClass="option-button" />
                        <asp:Button ID="btnOption2" runat="server" Text="London" OnClick="OptionClicked" CssClass="option-button" />
                        <asp:Button ID="btnOption3" runat="server" Text="Berlin" OnClick="OptionClicked" CssClass="option-button" />
                        <asp:Button ID="btnOption4" runat="server" Text="Madrid" OnClick="OptionClicked" CssClass="option-button" />
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
