package lab;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lab.Employee;

@RestController
public class EmployeeServiceController2 { 
	// Controller(lab.EmployeeServiceController) - @ModelAttribute를 활용한 model바인딩과 폼입력과 출력을 설명
	// 사용자가 요청한 URL을 매핑하여 해당되는 서비스 메소드를 실행
	// GET방식 호출 : 입력 또는 수정폼 생성, POST방식 호출 : 실제 입력 및 수정을 위한 서비스 메소드 호출
	
	@Resource(name="employeeService") // @Resource : Bean 정보 활용
	EmployeeServiceImpl employeeservice;
	
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	protected List<Employee> employList() throws Exception{
		Employee vo = new Employee();
		System.out.println(employeeservice.selectEmployeeList(vo).get(0).email);
		return employeeservice.selectEmployeeList(vo);
	}
	
	@RequestMapping(value = "/autoAddEmployee.do", method = RequestMethod.POST)
    public Employee restController(@RequestBody Employee employee) throws Exception {
		Employee vo = new Employee();
		List<Employee> employeelist = employeeservice.selectEmployeeList(vo);

		employee.id = Integer.toString(employeelist.size()+ 1);
		employeeservice.insertEmployee(employee);
        return employee;
    }
}
