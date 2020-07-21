package lab;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lab.Employee;

@Controller
public class EmployeeServiceController { 
	// Controller(lab.EmployeeServiceController) - @ModelAttribute를 활용한 model바인딩과 폼입력과 출력을 설명
	// 사용자가 요청한 URL을 매핑하여 해당되는 서비스 메소드를 실행
	// GET방식 호출 : 입력 또는 수정폼 생성, POST방식 호출 : 실제 입력 및 수정을 위한 서비스 메소드 호출
	
	@Resource(name="employeeService") // @Resource : Bean 정보 활용
	EmployeeServiceImpl employeeservice;
	
	@RequestMapping(value = "/employeeAdd.do", method=RequestMethod.GET)
	protected String employeeAddForm(ModelMap model) throws Exception{
		model.addAttribute("employee",new Employee());
		return "employee/employeeAddForm"; 		// 사원정보 입력을 위한 폼 출력(Form 초기화)
	}
	
	@RequestMapping(value = "/employeeAdd.do", method=RequestMethod.POST)
	protected String employeeAdd(@ModelAttribute("employee") Employee command, 
			  BindingResult errors, ModelMap model) throws Exception {
		if (errors.hasErrors()) {
			return "employee/employeeAddForm";
		}
		employeeservice.insertEmployee(command);
		return "redirect:/employeeList.do";		// 신규 사원정보 입력 후, 리스트 출력
	}

	@RequestMapping(value = "/employeeList.do")
	protected String employList(ModelMap model) throws Exception{
		Employee vo = new Employee();
		List<Employee> employeelist = employeeservice.selectEmployeeList(vo);
		
		List<String> deptlist = employeeservice.selectGroupByDept();
		List<Integer> deptcountlist = employeeservice.countGroupByDept();
		Map<String, Double> map = new HashMap<>();
		
		for (int i=0;i<deptlist.size();i++) {
			map.put(deptlist.get(i), Math.round(((double)deptcountlist.get(i)/(double)employeelist.size())*10000)/100.0);
		}
		
		model.addAttribute("employeelist",employeelist);
		model.addAttribute("deptgraph", map);
		
		return "employee/employeeList"; 		// 사원정보 리스트 조회 후 리스트 출력
	}

	@RequestMapping(value = "/employeeView.do")
	protected String employeeAdd(@RequestParam String id, ModelMap model) throws Exception {
		Employee vo = new Employee();
		vo.setId(id);
		Employee command = employeeservice.selectEmployee(vo);
		model.addAttribute("employeeinfo",command);
		return "employee/employeeView"; 		// 선택된 사원정보 조회 후 정보 출력
	}

	@RequestMapping(value = "/employeeModify.do", method=RequestMethod.GET)
	protected String employeeModifyForm(@RequestParam String id,ModelMap model) throws Exception{
		Employee vo = new Employee();
		vo.setId(id);
		Employee command = employeeservice.selectEmployee(vo);
		model.addAttribute("employee",command);
		return "employee/employeeModifyForm"; 		// 수정을 위한 수청 폼 출력
	}
	
	@RequestMapping(value = "/employeeModify.do", method=RequestMethod.POST)
	protected String employeeModify(@ModelAttribute("employee") Employee command, 
			  BindingResult errors, ModelMap model) throws Exception {
		if (errors.hasErrors()) {
			return "employee/employeeModifyForm";
		}
		employeeservice.updateEmployee(command);
		return "redirect:/employeeView.do?id="+command.getId(); 		//수정된 사원정보 반영 후 조회화면 출력
	}
	
	@RequestMapping(value = "/employeeRemove.do")
	protected String employeeRemove(@RequestParam String id) throws Exception {
		Employee vo = new Employee();
		vo.setId(id);
		employeeservice.deleteEmployee(vo);
		return "redirect:/employeeList.do"; 		// 선택된 사원정보 삭제하고 목록 출력
	}

}
