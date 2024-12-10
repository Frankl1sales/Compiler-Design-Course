# Lugosi Compiler

Este é um compilador simples para a linguagem Lugosi, desenvolvido em Java utilizando JavaCC. Ele analisa e interpreta programas escritos na linguagem definida, que inclui suporte a variáveis, expressões aritméticas, comandos de controle de fluxo e entrada/saída.

## Estrutura da Linguagem Lugosi

### Características principais
- **Variáveis:** Definição de variáveis com `let`.
- **Tipos de dados:** `float`, `bool` e `void`.
- **Comandos de entrada e saída:**
  - Entrada com `readIO()`.
  - Saída com `printIO()`.
- **Operações suportadas:**
  - Aritméticas: `+`, `-`, `*`, `/`.
  - Lógicas: `&&`, `||`.
  - Comparações: `<`, `>`, `==`.

### Exemplo de Código Lugosi

```lugosi
void main {
    let float altura;
    let float largura;
    let float area;

    printIO "Digite a altura:";
    altura := readIO();

    printIO "Digite a largura:";
    largura := readIO();

    area := (altura * largura);
    printIO area;
}
```

## Requisitos

- **Java JDK** (versão 8 ou superior)
- **JavaCC** para gerar e compilar o analisador léxico e sintático.

## Como Usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/username/lugosi-compiler.git
   cd lugosi-compiler
   ```

2. Gere o analisador com o JavaCC:
   ```bash
   javacc Lugosi.jj
   ```

3. Compile os arquivos Java gerados:
   ```bash
   javac *.java
   ```

4. Execute o compilador passando um arquivo de entrada:
   ```bash
   java Lugosi input.lugosi
   ```

## Arquivo de Entrada

- Crie um arquivo com extensão `.lugosi`, contendo código na linguagem Lugosi.
- Por exemplo, `input.lugosi`:
  ```lugosi
  void main {
      let float a;
      a := 10.5;
      printIO "O valor de a é:";
      printIO a;
  }
  ```

## Funcionalidades Implementadas

- **Análise Léxica:** Reconhecimento de tokens como palavras reservadas, identificadores, números e operadores.
- **Análise Sintática:** Verificação da estrutura gramatical da linguagem.
- **Interpretação de Entrada e Saída:** Manipulação de `readIO()` e `printIO()`.

## Erros Comuns

- **Erro de caractere não reconhecido (`TokenMgrError`):**
  - Certifique-se de que os identificadores e palavras-chave não contenham caracteres acentuados ou inválidos.
- **Erro de sintaxe (`ParseException`):**
  - Verifique se o código segue a gramática definida para a linguagem Lugosi.

## Contribuições

Contribuições são bem-vindas! Por favor, siga os seguintes passos:

1. Faça um fork do repositório.
2. Crie um branch para sua funcionalidade ou correção de bug:
   ```bash
   git checkout -b feature/nova-funcionalidade
   ```
3. Faça o commit das mudanças:
   ```bash
   git commit -m "Adiciona nova funcionalidade"
   ```
4. Envie para o branch principal:
   ```bash
   git push origin feature/nova-funcionalidade
   ```
5. Abra um pull request.

## Licença

Este projeto é licenciado sob a [MIT License](LICENSE).

---
Desenvolvido com ❤️ por [Franklin](https://github.com/Frankl1sales).

