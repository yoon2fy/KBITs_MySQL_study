package org.scoula.travel.app;

// imports
import lombok.AllArgsConstructor;
import lombok.Data;

//Anotation
@Data
@AllArgsConstructor
public class MenuItem {
    String title;
    Runnable command;
}
