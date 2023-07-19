now = new Date
var mes = now.getMonth();
switch (mes) {// Array sempre inicia com 0
	case 0: mes = "janeiro";
		break;
	case 1: mes = "Fevereiro";
		break;
	case 2: mes = "Março";
		break;
	case 3: mes = "Abril";
		break;
	case 4: mes = "Maio";
		break;
	case 5: mes = "Junho";
		break;
	case 6: mes = "Julho";
		break;
	case 7: mes = "Agosto";
		break;
	case 8: mes = "Setembro";
		break;
	case 9: mes = "Outubro";
		break;
	case 10: mes = "Novembro";
		break;
	case 11: mes = "Dezembro";
		break;

}
// faz a saída com os parâmetros da data diretamente na linha que o scripr é executado
document.write("Hoje é " + now.getDate() + " de " + mes + " de " + now.getFullYear())