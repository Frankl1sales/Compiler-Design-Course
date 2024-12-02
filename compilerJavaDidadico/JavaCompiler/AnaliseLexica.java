import java.io.*;

enum TokenType { NUM, SOMA, SUB, MULT, DIV,APar, FPar, EOF }

class Token {
    String lexema; // Alterado de char para String
    TokenType token;

    Token(String l, TokenType t) { 
        lexema = l; 
        token = t; 
    }

    @Override
    public String toString() {
        return "Token{" + "lexema='" + lexema + '\'' + ", token=" + token + '}';
    }
}

class AnaliseLexica {

    BufferedReader arquivo;

    AnaliseLexica(String a) throws Exception {
        this.arquivo = new BufferedReader(new FileReader(a));
    }

    Token getNextToken() throws Exception {
        int eof = -1;
        char currchar;
        int currchar1;

        // Ignorar espaços em branco e quebras de linha
        do {
            currchar1 = arquivo.read();
            currchar = (char) currchar1;
        } while (currchar == '\n' || currchar == ' ' || currchar == '\t' || currchar == '\r');

        if (currchar1 != eof && currchar1 != 10) {

            // Reconhecer números com mais de um dígito
            if (Character.isDigit(currchar)) {
                StringBuilder numero = new StringBuilder();
                numero.append(currchar);

                // Continuar lendo enquanto for dígito
                while (true) {
                    arquivo.mark(1); // Marcar a posição no arquivo para possível retrocesso
                    currchar1 = arquivo.read();
                    currchar = (char) currchar1;

                    if (Character.isDigit(currchar)) {
                        numero.append(currchar);
                    } else {
                        arquivo.reset(); // Voltar ao último caractere não lido
                        break;
                    }
                }
                return new Token(numero.toString(), TokenType.NUM); // Retorna o número completo como token
            }

            // Reconhecer outros tokens
            switch (currchar) {
                case '(':
                    return new Token(Character.toString(currchar), TokenType.APar);
                case ')':
                    return new Token(Character.toString(currchar), TokenType.FPar);
                case '+':
                    return new Token(Character.toString(currchar), TokenType.SOMA);
                case '-':
                    return new Token(Character.toString(currchar), TokenType.SUB);
                case '*':
                    return new Token(Character.toString(currchar), TokenType.MULT);
		case '/':
                    return new Token(Character.toString(currchar), TokenType.DIV);
                default:
                    throw new Exception("Caractere inválido: " + ((int) currchar));
            }
        }

        arquivo.close();
        return new Token("", TokenType.EOF);
    }
}

