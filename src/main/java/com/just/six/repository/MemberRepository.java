package com.just.six.repository;

import com.just.six.dto.MemberDTO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {

    private final SqlSessionTemplate sql;

    public MemberRepository(SqlSessionTemplate sql) {
        this.sql = sql;
    }

    public int save(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        return sql.insert("Member.save", memberDTO);
//        **Mapper.xml 과 일치해야함 namespace.id
    }
    
    public int idChk(MemberDTO memberDTO) {
    	return sql.selectOne("Member.idChk", memberDTO);
    }
    
    public MemberDTO login(MemberDTO memberDTO) {
    	return sql.selectOne("Member.login", memberDTO);
    }
    
    public int find(MemberDTO memberDTO) {
    	return sql.update("Member.find", memberDTO);
    }
    

	public int delete(MemberDTO memberDTO) {
		return sql.delete("Member.delete",memberDTO);
	}

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }
}
