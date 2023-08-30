
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;


class A_Server 
{
    public static void main(String[] args) 
    {
        ServerSocket serverSocket = null;
        try 
        {
            serverSocket = new ServerSocket(9999);
            System.out.println("서버가 실행되었습니다.");
            while (true) 
            {         		
                Socket socket = serverSocket.accept();
                Thread thread = new ClientThread(socket);
                thread.start();
        	}
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
