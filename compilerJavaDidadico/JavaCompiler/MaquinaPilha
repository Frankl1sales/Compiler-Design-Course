import java.io.*;
import java.util.Stack;

public class MaquinaPilha {

    public static void main(String[] args) {
        // Verifica se foi passado o nome do arquivo de entrada
        if (args.length != 1) {
            System.out.println("Uso correto: java MaquinaPilha arquivoDeEntrada");
            return;
        }

        String arquivoEntrada = args[0];
        Stack<Integer> pilha = new Stack<>();

        try {
            // Lê as instruções do arquivo
            BufferedReader reader = new BufferedReader(new FileReader(arquivoEntrada));
            String linha;

            while ((linha = reader.readLine()) != null) {
                // Interpreta as instruções linha a linha
                if (linha.startsWith("PUSH")) {
                    // Obtém o valor e empilha
                    int valor = Integer.parseInt(linha.split(" ")[1]);
                    pilha.push(valor);
                } else if (linha.equals("SUM")) {
                    // Realiza a soma
                    int b = pilha.pop();
                    int a = pilha.pop();
                    pilha.push(a + b);
                } else if (linha.equals("SUB")) {
                    // Realiza a subtração
                    int b = pilha.pop();
                    int a = pilha.pop();
                    pilha.push(a - b);
                } else if (linha.equals("MULT")) {
                    // Realiza a multiplicação
                    int b = pilha.pop();
                    int a = pilha.pop();
                    pilha.push(a * b);
                } else if (linha.equals("DIV")) {
                    // Realiza a divisão
                    int b = pilha.pop();
                    int a = pilha.pop();
                    pilha.push(a / b);
                } else if (linha.equals("PRINT")) {
                    // Imprime o resultado
                    if (!pilha.isEmpty()) {
                        System.out.println("Resultado final: " + pilha.peek());
                    } else {
                        System.out.println("Erro: A pilha está vazia.");
                    }
                } else {
                    System.out.println("Instrução desconhecida: " + linha);
                }
            }

            reader.close();
        } catch (IOException e) {
            System.out.println("Erro ao ler o arquivo de entrada: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Erro durante a execução: " + e.getMessage());
        }
    }
}
