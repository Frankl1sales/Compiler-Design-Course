class CodeGen{

	
	// Versão que gera o código para a máquina de pilha (Compilador)
	String geraCodigo(ArvoreSintatica arv) {
	return geraCodigo2(arv) + "PRINT";
	}

	private String geraCodigo2(ArvoreSintatica arv) {
	if (arv instanceof Mult) {
	    return geraCodigo2(((Mult) arv).arg1) + 
		   geraCodigo2(((Mult) arv).arg2) + "MULT\n";
	}
	if (arv instanceof Div) {
	    return geraCodigo2(((Div) arv).arg1) + 
		   geraCodigo2(((Div) arv).arg2) + "DIV\n";
	}
	if (arv instanceof Soma) {
	    return geraCodigo2(((Soma) arv).arg1) + 
		   geraCodigo2(((Soma) arv).arg2) + "SUM\n";
	}
	if (arv instanceof Sub) {
	    return geraCodigo2(((Sub) arv).arg1) + 
		   geraCodigo2(((Sub) arv).arg2) + "SUB\n";
	}
	if (arv instanceof Num) {
	    return "PUSH " + ((Num) arv).num + "\n";
	}
	return "";
	}


	// Interpretador que devolve o resultado da expressão
	int interpreta(ArvoreSintatica arv) {
	if (arv instanceof Mult) {
	    // Interpreta a multiplicação dos dois operandos
	    return interpreta(((Mult) arv).arg1) * interpreta(((Mult) arv).arg2);
	}
	if (arv instanceof Div) {
	    // Interpreta a divisão dos dois operandos
	    return interpreta(((Div) arv).arg1) / interpreta(((Div) arv).arg2);
	}
	if (arv instanceof Soma) {
	    // Interpreta a soma dos dois operandos
	    return interpreta(((Soma) arv).arg1) + interpreta(((Soma) arv).arg2);
	}
	if (arv instanceof Sub) {
	    // Interpreta a subtração dos dois operandos
	    return interpreta(((Sub) arv).arg1) - interpreta(((Sub) arv).arg2);
	}
	if (arv instanceof Num) {
	    // Retorna diretamente o valor do número
	    return ((Num) arv).num;
	}

	throw new IllegalArgumentException("Nó desconhecido na árvore sintática!");
	}

}
