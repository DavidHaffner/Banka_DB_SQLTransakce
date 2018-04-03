/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banka.sqltransakce;

import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dhaffner
 */
public class Aplikace {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String choice; // zde se bude ukládat klientovo zadání (z konzole)
        boolean quit = false; // pomocná prom. pro plnění podmínek v cyklech
        String response; // zde bude výsledek selectu z DB
        
        DBController dBController = new DBController();
            
        try {
            while (!quit) {
                // ověření přístupu do DB -> z tabulky 'pristupy'
                System.out.print("Aplikace Banka...\nzadejte své jméno/heslo: ");
                Scanner sc = new Scanner (System.in);
                choice = sc.nextLine();
                // choice = choice.trim();
                System.out.println();
                
                String[] parsed = choice.split("/");
                response = dBController.doSelectFromPristupy(parsed[0]);

                if (response.equals(parsed[1])) {
                    System.out.println("Ověření OK...");
                    quit = true;
                } else {
                    System.out.println("Nepovolený vstup...");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(Aplikace.class.getName()).log(Level.SEVERE, "Chyba při přihlašování.", ex);
        }

        try {
            quit = false;
            while (!quit) {
                System.out.println("Zadejte svůj příkaz ve formátu:");
                System.out.println("IBAN_odchozí/IBAN_příchozí/částka");
                System.out.println();
                
                System.out.print("Vložte svůj příkaz: ");
                Scanner sc = new Scanner (System.in);
                choice = sc.nextLine();
                System.out.println();
                
                String[] parsed = choice.split("/");

                String[] filmData = {"", "", "", "", ""};
                int radku;

                switch (parsed[0]) {
                    case "1":
                        radku = dBController.doInsertToFilm(parsed[1], parsed[2], parsed[3], parsed[4]);
                        response = "Vloženo řádků: " + Integer.toString(radku);
                        break;
                    case "2":
                        filmData[Integer.parseInt(parsed[1]) - 1] = parsed[2];
                        response = dBController.doSelectFromFilm(filmData[1], filmData[2], filmData[3], filmData[4]);
                        break;
                    case "3":
                        filmData[Integer.parseInt(parsed[2]) - 1] = parsed[3];
                        radku = dBController.doUpdateToFilm(parsed[1], filmData[1], filmData[2], filmData[3], filmData[4]);
                        response = "Upraveno řádků: " + Integer.toString(radku);
                        break;
                    default:
                        response = "Chybné zadání - opakujte.";
                }
                System.out.println(response);

                System.out.print("Pokračovat? (K pro konec): ");
                choice = sc.nextLine();
                System.out.println();

                if ('K' == choice.charAt(0)) {
                    quit = true;
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(Aplikace.class.getName()).log(Level.SEVERE, "Chyba při chodu aplikace.", ex);
        }
    }
    
}
