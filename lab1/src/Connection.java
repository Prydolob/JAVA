import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.Socket;
import java.util.Arrays;
import java.util.Comparator;

public class Connection extends Thread {
    protected Socket socket;
    protected BufferedReader fromClient;
    protected PrintStream toClient;

    public Connection(Socket socket) {
        this.socket = socket;
        try {
            fromClient = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            toClient = new PrintStream(socket.getOutputStream());

        } catch (IOException e) {
            try {
                socket.close();
            } catch (IOException ex) {
                System.err.println("Unable to set up streams: " + ex);
                return;
            }
            e.printStackTrace();
        }
        this.start();
    }

    public void run() {
        String clientMessage;
        try {
            while (true) {
                toClient.println("Type your sentence(5 and more words)......");
                clientMessage = fromClient.readLine();
                if (clientMessage.split(" ").length >= 5) {
                    if (clientMessage == null || clientMessage.equals("end")) {
                        return;
                    } else {
                        toClient.println(processMessage(clientMessage));
                    }
                } else {
                    toClient.println("Your sentence must contain at least 5 words!");
                }
            }
        } catch (IOException e) {
        } finally {
            try {
                socket.close();
            } catch (IOException e) {
            }
        }
    }

    public String processMessage(String message) {
        String[] arr = message.split(" ");
        Arrays.sort(arr, Comparator.comparingInt(String::length));
        return ("The longest word: " + arr[arr.length-1] + "\nThe shortest word: " + arr[0]);
    }
}
