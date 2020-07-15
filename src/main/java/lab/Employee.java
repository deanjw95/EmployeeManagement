package lab;

public class Employee { 
	
	// VO(Value Object, MODEL)(lab.Employee.java) - 사원정보관리 클래스
	// DB table 정보에 맞게 객체 생성
	// MyBatis에서 파라미터 정의에 필요한 VO 클래스를 정의
	
	String id;
	String name;
	String dept;
	int age;
	String phone;
	String email;
	String addr;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
}