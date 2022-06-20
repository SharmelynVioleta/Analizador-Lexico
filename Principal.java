package Codigo;


import java.io.File;

public class Principal {
    public static void main(String[] args) {
        String ruta = "C:/Users/AMD/Desktop/java/AnalizadorLexico/src/Codigo/Lex.flex";
 
        generarLexer(ruta);
    }
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        jflex.Main.generate(archivo);
    }
}