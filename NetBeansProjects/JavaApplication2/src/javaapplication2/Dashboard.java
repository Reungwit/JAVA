/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javaapplication2;
import javax.swing.*;
import java.awt.*;

public class Dashboard extends JFrame {

    public Dashboard() {
        setTitle("Dashboard");
        setSize(800, 500);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout());

        // **🔹 Top Navbar**
        JPanel navbar = new JPanel(new FlowLayout(FlowLayout.LEFT));
        navbar.setBackground(Color.LIGHT_GRAY);
        navbar.add(new JLabel("Navbar"));
        navbar.add(new JButton("Menu 1"));
        navbar.add(new JButton("Menu 2"));
        add(navbar, BorderLayout.NORTH);

        // **🔹 Main Content Panel**
        JPanel mainPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        
        // **Manage Members Card**
        JPanel managePanel = createCardPanel("Manage Members", "Go To");
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridwidth = 2; // Spanning across two columns
        mainPanel.add(managePanel, gbc);
        
        // **Statistics Cards**
        gbc.gridwidth = 1; // Reset width
        gbc.gridy = 1;

        JPanel membersCard = createStatCard("Number of Members", "0");
        gbc.gridx = 0;
        mainPanel.add(membersCard, gbc);

        JPanel customersCard = createStatCard("Customers in Store", "0");
        gbc.gridx = 1;
        mainPanel.add(customersCard, gbc);

        add(mainPanel, BorderLayout.CENTER);
        
        setVisible(true);
    }

    // **🔹 Method to Create a Card Panel with Button**
    private JPanel createCardPanel(String title, String buttonText) {
        JPanel panel = new JPanel();
        panel.setLayout(new BorderLayout());
        panel.setPreferredSize(new Dimension(250, 120));
        panel.setBackground(Color.LIGHT_GRAY);
        panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        JLabel titleLabel = new JLabel(title, SwingConstants.CENTER);
        titleLabel.setFont(new Font("Arial", Font.BOLD, 16));

        JButton button = new JButton(buttonText);
        button.setBackground(Color.BLACK);
        button.setForeground(Color.WHITE);

        panel.add(titleLabel, BorderLayout.CENTER);
        panel.add(button, BorderLayout.SOUTH);

        return panel;
    }

    // **🔹 Method to Create a Statistics Card**
    private JPanel createStatCard(String title, String value) {
        JPanel panel = new JPanel();
        panel.setLayout(new BorderLayout());
        panel.setPreferredSize(new Dimension(200, 100));
        panel.setBackground(Color.LIGHT_GRAY);
        panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        JLabel titleLabel = new JLabel(title, SwingConstants.CENTER);
        titleLabel.setFont(new Font("Arial", Font.BOLD, 14));

        JLabel valueLabel = new JLabel(value, SwingConstants.CENTER);
        valueLabel.setFont(new Font("Arial", Font.BOLD, 24));

        panel.add(titleLabel, BorderLayout.NORTH);
        panel.add(valueLabel, BorderLayout.CENTER);

        return panel;
    }

    // **🔹 Main Method**
    public static void main(String[] args) {
        SwingUtilities.invokeLater(Dashboard::new);
    }
}

/**
 *
 * @author Boss_Reungwit
 */
