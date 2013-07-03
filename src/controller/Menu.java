package controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import bean.Function;
/**
 * 
 */
import bean.Modul;

/**
 * @author Administrator
 *
 */
public class Menu {
	private String ulid;
	private Integer modulId;

	/**
	 * 
	 */
	public Menu() {
		// TODO Auto-generated constructor stub
	}
	
	public String getUlid() {
		return ulid;
	}

	public void setUlid(String ulid) {
		this.ulid = ulid;
	}

	public Integer getModulId() {
		return modulId;
	}

	public void setModulId(Integer modulId) {
		this.modulId = modulId;
	}

	public void listModulMenu() {
		String responseText="";
		try {
			ServletActionContext.getResponse().setContentType("text/html; charset=utf-8");
			ServletActionContext.getResponse().setHeader("Cache-Control","no-cache");
			ServletActionContext.getResponse().setCharacterEncoding("utf-8"); 
			PrintWriter out= ServletActionContext.getResponse().getWriter();
			/*		String correctStr=new String(loginname.getBytes("ISO8859_1"),"GB2312");
			if(correctStr.equals("admin"))
			{
				
			}*/
			java.util.List<Modul> moduls = Modul.build();
			for (Modul modul : moduls) {
				
				if (!responseText.equals(""))
				{
					responseText += "," + modul.getId().toString() + "|" +modul.getName();
				}
				else
				{
					responseText = modul.getId().toString() +"|"+modul.getName();
				}
			}
			out.print(responseText);
            out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void listFunctionMenu() {
		String responseText=ulid;
		try {
			ServletActionContext.getResponse().setContentType("text/html; charset=utf-8");
			ServletActionContext.getResponse().setHeader("Cache-Control","no-cache");
			ServletActionContext.getResponse().setCharacterEncoding("utf-8"); 
			PrintWriter out= ServletActionContext.getResponse().getWriter();
			/*		String correctStr=new String(loginname.getBytes("ISO8859_1"),"GB2312");
			if(correctStr.equals("admin"))
			{
				
			}*/
			java.util.List<Function> functions = Function.build();
			for (Function func : functions) {
				responseText += "," + func.getUrl() + "|" +func.getName()+"|"+modulId+"|"+func.getId();
			}
			out.print(responseText);
            out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

}
