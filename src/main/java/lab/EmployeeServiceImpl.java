package lab;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
	// SERVICE - 사원정보관리 구현, 비즈니스 로직 구현

	@Resource(name = "employeeDAO") // 설정된 bean 정보를 활용하여 DI 설정
	public EmployeeDAO employeeDAO; // DI는 클래스 인스턴스를 생성할 클래스를 직접 소스코드에 지정하지 않고 인터페이스를 활용하여 Type만 지정한다

	public void insertEmployee(Employee employeeVO) throws Exception {
		employeeDAO.insertEmployee(employeeVO);
	}

	public void updateEmployee(Employee employeeVO) throws Exception {
		employeeDAO.updateEmployee(employeeVO);
	}

	public void deleteEmployee(Employee employeeVO) throws Exception {
		employeeDAO.deleteEmployee(employeeVO);
	}

	public List<Employee> selectEmployeeList(Employee employeeVO) throws Exception {
		return employeeDAO.selectEmployeeList(employeeVO);
	}

	public Employee selectEmployee(Employee employeeVO) throws Exception {
		return employeeDAO.selectEmployee(employeeVO);
	}
	
    public List<String> selectGroupByDept() throws Exception {
    	return employeeDAO.selectGroupByDept();
    }

    public List<Integer> countGroupByDept() throws Exception {
    	return employeeDAO.countGroupByDept();
    }

}
