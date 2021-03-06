package lib;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;

public class FileLib {

 
	private FileReader fileReader;
	private BufferedReader bufferedReader;
	private FileInputStream fis;
	private FileOutputStream fos;
	
	private String str;

	public String getFileContent(File file){
		try {
			
		
		  System.out.println("경로확인용"+file.getPath());
			
			fileReader = new FileReader(file);
			bufferedReader = new BufferedReader(fileReader); 
		
			str= new String();
			String s;
			while((s=bufferedReader.readLine())!=null){
				str += s+System.getProperty("line.separator");				
			}
			
		}catch (FileNotFoundException e) {
			System.out.println("파일불러오기실패");
			e.printStackTrace();
		}catch(IOException e){
			System.out.println("str에 쓰기 실패");
			e.printStackTrace();
		}finally {
			try {
				bufferedReader.close();
				fileReader.close();
			} catch (IOException e) {			
				e.printStackTrace();
			}			
		}	
		return str;
	}
	
	
	public String getFileContentLine(File file){
		try {
			
		/* 테스트 경로 확인용
		 * System.out.println(file.getCanonicalPath());*/
			
			fileReader = new FileReader(file);
			bufferedReader = new BufferedReader(fileReader); 
		
			str= new String();
			String s;
			while((s=bufferedReader.readLine())!=null){
				str += s+System.getProperty("line.separator");
				
			}
			
		}catch (FileNotFoundException e) {
			System.out.println("파일불러오기실패");
			e.printStackTrace();
		}catch(IOException e){
			System.out.println("str에 쓰기 실패");
			e.printStackTrace();
		}finally {
			try {
				bufferedReader.close();
				fileReader.close();
			} catch (IOException e) {			
				e.printStackTrace();
			}			
		}	
		return str;
	}
	
	
	
	public void copyFile(String inputName,String destination){
		
		try {
			fis=new FileInputStream(inputName);
			fos=new FileOutputStream(destination);
			
			int data;
			byte[] readby=new byte[200];
			while((data=fis.read(readby))!=-1){
				fos.write(readby,0,data);
			}
			fos.flush();
			fos.close();
			fis.close();
			
		} catch (FileNotFoundException e) {			
			e.printStackTrace();
		}catch(Exception e){
			
		}
		
		
	}//copyFile
	
	
	
}
