import dao.User;

public class Main {

    public static void main(String[] args) throws Exception {
        User user = new User("Tiarintsoa", "Mbolatsiory", "tiarintsoa@gmail.com", "12345678");
        user.create();
    }
    
}