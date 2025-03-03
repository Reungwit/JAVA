import com.toedter.calendar.JDateChooser;
import javax.swing.*;
import java.awt.*;
import java.util.Locale;

public class test extends JFrame {
    private JDateChooser dateChooser;

    public test() {
        setTitle("Date Picker Test");
        setSize(400, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new FlowLayout());

        // ✅ **สร้าง JDateChooser**
        dateChooser = new JDateChooser();
        dateChooser.setDateFormatString("yyyy-MM-dd");
        dateChooser.setLocale(new Locale("en", "US")); // ตั้งค่าภาษาให้เป็น English
        dateChooser.setDate(new java.util.Date()); // ตั้งค่าเริ่มต้นเป็นวันปัจจุบัน

        add(dateChooser);
        setVisible(true);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(test::new);
        try {
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
} catch (Exception e) {
    e.printStackTrace();
}

    }
}
