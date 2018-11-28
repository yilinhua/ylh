package service;

import java.util.List;

import pojo.TbUserinfo;

public interface TbUserInfoService {
	TbUserinfo selectUserAccount(String userAccount);

	List<TbUserinfo> select(TbUserinfo tbUserinfo);

	TbUserinfo selectById(Integer userid);

	int insert(TbUserinfo tbUserinfo);

	int updateByid(TbUserinfo tbUserinfo);

	int deleteByid(Integer userid);
}
