package com.cafebabe.core;

import exceptions.ClassNotFoundException;

import java.io.IOException;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

/**
 * This class contains code relative to the Menu display
 * Menu allow user to select entry point of the program
 *
 * Created by laffineur on 4/11/16.
 */


public class Menu {
    private static final String indent = "         ";
    JarInfo jarInfo;
    List<String[]> methodList = new ArrayList<>();

    public Menu(JarInfo jarInfo) {
        this.jarInfo = jarInfo;

    }

    private String headerDisplay(){
        String s = "";
        for (int i=0; i<2;i++){
            s = s + indent+"///////////////////////////////////////////////////\n";
            if (i==0) s = s +
                    indent+"///////////////////////CAFEBABE////////////////////\n";
        }
        return s;
    }

    private List<String[]> putMainFirst(List<String[]> miList){
        int i = 0;
        List<String[]> miListBis = new ArrayList<>();
        for(String[] mi : miList) miListBis.add(mi);


        for(String[] mi : miList){
            if (mi[2].equals("main") && mi[3].equals("[Ljava/lang/String;")){
                miListBis.remove(mi);
                miListBis.add(0,mi);
            };

            i++;
        }
        return miListBis;
    }

    private String methodSelection(){
        String s = "\n" + indent+"°°°°°° Select entry point °°°°°° \n\n";
        List<String[]> methodsInfo = jarInfo.getAllMethInfos();
        methodList = putMainFirst(methodsInfo);
        int i = 0;
        for (String[] m : methodList){
            s = s + indent+"["+i+"] " + m[0] + " : " + m[1]+ " " +m[2]+ "(" +m[3]+ ")" + "\n";
            i++;
        }
        return s;
    }


    public String[] menuDisplay(int entryNum){
        String[] methodInfo = new String[3];
        String display = "";
        int methodNum = -1;
        display = display + headerDisplay() + methodSelection();
        if (entryNum < 0){
            System.out.println(display);
            Scanner in = new Scanner( System.in );
            try {
                methodNum = in.nextInt();
            } catch (InputMismatchException im){
                System.out.println("Please enter a valid method number");
                System.exit(1);
            }
        } else {
            methodNum = entryNum;
        }
        try {
            methodInfo = methodList.get(methodNum);
        } catch (IndexOutOfBoundsException ie){
            System.out.println("Please enter a valid method number");
            System.exit(1);
        }

        System.out.print(indent+"Method ["+methodNum+"] selected : ");
        System.out.println(methodInfo[2] +"("+methodInfo[3]+")" +" of "+methodInfo[0] + " class\n\n");
        return methodInfo;
    }

    public static String displayHelp(){
        String s = "";
        s = s + "Usage : file.jar outputFolder [-se] [-optimise]\n";
        s = s + "file.jar     -> Path to the jar file to compile\n";
        s = s + "outputFolder -> Folder path of the produced output\n";
        s = s + "-se          -> Allow to select entry point (main method by default)\n";
        s = s + "-optimise    -> Enable optimisations\n";
        return s;
    }
}
