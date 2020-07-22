package lab;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
// DAO - 사원정보관리 데이터베이스 처리 기능
// DAO에서 MyBatis에서 정의한 SQL ID와 실행에 필요한 파라미터를 정의하여 입력, 수정, 삭제 작업을 위한 메소드를 정의하며, 서비스에서 호출되어 실행된다.

@Repository("employeeDAO") // DAO 정의
public class EmployeeDAO extends EgovAbstractMapper { 
	// EgovAbstractMapper : SqlSession 설정과 메소드 호출 편리함 제공
	

	public void insertEmployee(Employee vo) { // 사원 정보 입력
        insert("employee.insertEmployee", vo); // Mapper id와 parameter object 명시하여 mapper INSERT 실행
    }

    public int updateEmployee(Employee vo) { // 사원 정보 수정
        return update("employee.updateEmployee", vo);
    }
    
    public int deleteEmployee(Employee vo) { // 사원 정보 삭제
        return delete("employee.deleteEmployee", vo);
    }

    public List<Employee> selectEmployeeList(Employee vo) { // 사원 리스트 출력
        return selectList("employee.selectEmployeeList", vo);
    }

    public Employee selectEmployee(Employee vo) {  // 사원 검색
        return (Employee) selectOne("employee.selectEmployee", vo);
    }
    
    public List<String> selectGroupByDept() {
    	return selectList("employee.selectGroupbyDept");
    }
    
    public List<Integer> countGroupByDept() {
    	return selectList("employee.countGroupbyDept");
    }
    
    public int deleteMancity() { // 사원 정보 삭제
        return delete("employee.deleteMancity");
    }
}
