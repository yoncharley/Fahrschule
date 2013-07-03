/**
 * 
 */
package bean;

import java.util.List;

/**
 * @author Administrator
 *
 */
public class Function {

	private Integer id;
	private String name;
	private String url;
	/**
	 * 
	 */
	public Function() {
		// TODO Auto-generated constructor stub
	}
	
	public Integer getId() {
		return id;
	}

	public String getName() {
		return name;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public static List<Function> build() {
		// TODO Auto-generated method stub
		java.util.List<Function> list = new java.util.ArrayList<Function>();
		Function func0 = new Function();
		func0.id = 2001;
		func0.name = "功能一";
		func0.url="./MyJsp.jsp";
		list.add(func0);
		Function func1 = new Function();
		func1.id = 2002;
		func1.name = "功能二";
		func1.url="./test1.jsp";
		list.add(func1);
		Function func2 = new Function();
		func2.id = 2003;
		func2.name = "功能三";
		func2.url="./test2.jsp";
		list.add(func2);
		return list;
	}

}
