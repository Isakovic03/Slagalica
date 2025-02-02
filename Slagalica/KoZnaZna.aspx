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
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .quiz-container {
            width: 90%;
            max-width: 800px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 25px;
            padding: 40px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            position: relative;
            text-align: center;
        }

        .question {
            font-size: 1.8rem;
            color: #5A5A5A;
            margin-bottom: 30px;
        }

        .options {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .option-button {
    background: linear-gradient(145deg, #8B4513, #A0522D);
    color: white;
    border: none;
    border-radius: 15px;
    padding: 15px;
    font-size: 1.4rem;
    font-weight: bold;
    cursor: pointer;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s, box-shadow 0.3s;
    width: 100%; /* Da bi zauzelo istu širinu */
}

.option-button:hover {
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
}

        .skip-button {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 1rem;
    padding: 10px 15px;
    background: linear-gradient(145deg, #B22222, #FF6347); /* Bolji crveni gradient */
    border: none;
    color: white;
    border-radius: 10px;
    cursor: pointer;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: background 0.3s, transform 0.2s;
}
.score-container {
    position: absolute;
    top: 20px;
    right: 20px;
    font-size: 1.4rem;
    font-weight: bold;
    color: #8B4513;
    background: rgba(255, 255, 255, 0.9);
    padding: 10px 15px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.skip-button:hover {
    background: linear-gradient(145deg, #8B0000, #B22222);
    transform: scale(1.05);
}

        @media (max-width: 768px) {
            h1 {
                font-size: 4rem;
            }

            .question {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>KO ZNA ZNA</h1>
        <!-- Ukupan broj poena - pozicioniran sa strane -->
<div class="score-container">
    <asp:Label ID="lblPoeni" runat="server" Text="Poeni: 0"></asp:Label>
</div>
        <div class="quiz-container">
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
    </form>
</body>
</html>
