package db;

import models.Item;

import java.util.ArrayList;
import java.util.List;

public class DBManager {
    private static List<Item> items = new ArrayList<>();

    private static Long id = 5L;

    static {
        items.add(new Item(1L, "IPhone X", 500000, 20));
        items.add(new Item(2L, "IPhone 11", 600000, 10));
        items.add(new Item(3L, "Samsung S21", 400000, 30));
        items.add(new Item(4L, "XIAOMI Redmi", 300000, 40));
    }

    public static List<Item> getItems() {
        return items;
    }

    public static void addItem(Item item) {
        item.setId(id);
        items.add(item);
        id++;
    }

    public static Item getItemById(Long id) {
        for (Item item : items) {
            if (item.getId().equals(id)){
                return item;
            }
        }
        return null;
    }

    public static List<Item> getApplePhones() {
        return items.stream().filter(item -> item.getName().equals("IPhone")).toList();
//        List<Item> iphones = new ArrayList<>();
//        for (Item item : items) {
//            if (item.getName().equals("IPhone")) {
//                iphones.add(item);
//            }
//        }
//        return iphones;
    }
}
