package lab;

import java.util.List;
import java.util.Map;

public interface EmployeeService  { 
	// SERVICE - 사원정보관리를 위한 인터페이스
	// 인터페이스에서 정의된 메소드를 구현하며, DAO의 메소드를 호출한다.
	// 인터페이스 사용 이유 : 자바 인터페이스는 클래스들이 구현해야 하는 동작을 지정하는데 사용되는 추상형으로,	클래스들이 지켜야 하는 형식을 정의 
	//				     인터페이스는 클래스에서 외부로 노출되어 활용되는 변수나 메소드 정보를 제공하여 다른 클래스에서 쉽게 참조
	//				     그리고,	현재의 클래스를 다른 클래스로 대체하기 위해 반드시 구현이 필요한 메소드 정보를 제공
	
	public void insertEmployee(Employee employeeVO) throws Exception;

	public void updateEmployee(Employee employeeVO) throws Exception;
	
	public void deleteEmployee(Employee employeeVO) throws Exception;

	public List<Employee> selectEmployeeList(Employee employeeVO) throws Exception;
	
    public List<String> selectGroupByDept() throws Exception;
    
    public List<Integer> countGroupByDept() throws Exception;

}
