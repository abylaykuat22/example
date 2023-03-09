package db;

import models.Item;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DBUtil {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/g111_db",
                    "postgres",
                    "postgre"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Item> getItems() {
        List<Item> items = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "select * from items i order by i.price desc ");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Item item = new Item();
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setPrice(resultSet.getDouble("price"));
                item.setAmount(resultSet.getInt("amount"));
                items.add(item);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }

    public static void addItem(Item item) {
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "insert into items(name, price, amount) " +
                    "values (?,?,?)");
            statement.setString(1, item.getName());
            statement.setDouble(2, item.getPrice());
            statement.setInt(3, item.getAmount());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Item getById(Long id) {
        Item item = new Item();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "select * from items i where i.id=?");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setPrice(resultSet.getDouble("price"));
                item.setAmount(resultSet.getInt("amount"));
            }
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return item;
    }

    public static void editItem(Item item) {
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "update items " +
                    "set name=?, price=?, amount=? " +
                    "where id=?");
            statement.setString(1, item.getName());
            statement.setDouble(2, item.getPrice());
            statement.setInt(3, item.getAmount());
            statement.setLong(4, item.getId());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteById(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "delete from items i where i.id=?");
            statement.setLong(1, id);
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
