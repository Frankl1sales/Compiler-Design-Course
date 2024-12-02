import java.io.*;

class Compilador {

    public static void main(String[] args) {
        ArvoreSintatica arv = null;

        try {
            // Realiza a análise léxica e sintática
            AnaliseLexica al = new AnaliseLexica(args[0]);
            Parser as = new Parser(al);
            arv = as.parseProg();  // Gera a árvore sintática

            // Cria uma instância do CodeGen
            CodeGen backend = new CodeGen();

            // 1. Interpreta a árvore sintática e exibe o resultado
            int resultado = backend.interpreta(arv);
            System.out.println("Resultado da execução da expressão: " + resultado);

            // 2. Gera o código correspondente para a máquina de pilha e exibe o código gerado
            String codigoGerado = backend.geraCodigo(arv);
            System.out.println("Código gerado para a máquina de pilha:\n" + codigoGerado);
            
            // 3. Salva o código gerado em um arquivo
            try (BufferedWriter writer = new BufferedWriter(new FileWriter("arquivoDeEntrada.txt"))) {
                writer.write(codigoGerado);
                System.out.println("Código gerado salvo em 'codigoGerado.txt'.");
            } catch (IOException e) {
                System.out.println("Erro ao salvar o código gerado em arquivo: " + e.getMessage());
            }
            
        } catch (Exception e) {
            System.out.println("Erro de compilação:\n" + e);
        }
    }
}

