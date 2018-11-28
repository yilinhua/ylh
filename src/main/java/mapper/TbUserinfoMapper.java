package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.TbUserinfo;

public interface TbUserinfoMapper {
	TbUserinfo selectUserAccount(@Param("userAccount")String userAccount);
	
	List<TbUserinfo> select(TbUserinfo tbUserinfo);
	
	TbUserinfo selectById(@Param("userid")Integer userid);
	
    int insert(TbUserinfo tbUserinfo);
    
    int updateByid(TbUserinfo tbUserinfo);
    
    int deleteByid(@Param("userid")Integer userid);
}