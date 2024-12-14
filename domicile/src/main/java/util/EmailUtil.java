package util;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailUtil {
    public static void sendEmail(String recipientEmail, String subject, String messageContent) {
        final String senderEmail = "elhanouniyassine7@gmail.com";
        final String senderPassword = "Yassineyassine2003";

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override 
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            message.setSubject(subject);
            message.setText(messageContent);

            Transport.send(message);
            System.out.println("Email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
