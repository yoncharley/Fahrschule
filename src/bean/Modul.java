/**
 * 
 */
package bean;

/**
 * @author Administrator
 *
 */
public class Modul {

	private Integer id;
	private String name;
	
	/**
	 * 
	 */
	public Modul() {
		// TODO Auto-generated constructor stub
	}
	
	public Integer getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public static java.util.List<Modul> build() {
		java.util.List<Modul> list = new java.util.ArrayList<Modul>();
		Modul modul0 = new Modul();
		modul0.id = 1001;
		modul0.name = "模块一";
		list.add(modul0);
		
		Modul modul1 = new Modul();
		modul1.id = 1002;
		modul1.name = "模块二";
		list.add(modul1);
		
		Modul modul2 = new Modul();
		modul2.id = 1003;
		modul2.name = "模块三";
		list.add(modul2);
		
		return list;
	}
}
