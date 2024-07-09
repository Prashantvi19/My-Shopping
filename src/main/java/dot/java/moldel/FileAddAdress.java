package dot.java.moldel;

import java.io.FileOutputStream;
import java.io.InputStream;

public class FileAddAdress {
	
	
	public static boolean proUploadFile (InputStream inSt, String path){
		 boolean test = false;
		 
		 try {
			 byte[] bytes = new byte[inSt.available()];
			 inSt.read(bytes);
			 FileOutputStream fileUp  = new FileOutputStream(path);
			 fileUp.write(bytes);
			 fileUp.flush();
			 fileUp.close();
			 
			 test = true;
			 
		 }catch(Exception e) {
			 e.printStackTrace();
			 }
		
		
		return test;
		
	}

	
}
