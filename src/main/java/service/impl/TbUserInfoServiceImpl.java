package service.impl;

import java.util.List;

import mapper.TbUserinfoMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pojo.TbUserinfo;

import service.TbUserInfoService;

@Service
public class TbUserInfoServiceImpl implements TbUserInfoService {
	@Autowired
	private TbUserinfoMapper tbUserinfoMapper;

	@Override
	public TbUserinfo selectUserAccount(String userAccount) {
		return tbUserinfoMapper.selectUserAccount(userAccount);
	}

	@Override
	public List<TbUserinfo> select(TbUserinfo tbUserinfo) {
		return tbUserinfoMapper.select(tbUserinfo);
	}

	@Override
	public TbUserinfo selectById(Integer userid) {
		return tbUserinfoMapper.selectById(userid);
	}

	@Override
	public int insert(TbUserinfo tbUserinfo) {
		return tbUserinfoMapper.insert(tbUserinfo);
	}

	@Override
	public int updateByid(TbUserinfo tbUserinfo) {
		return tbUserinfoMapper.updateByid(tbUserinfo);
	}

	@Override
	public int deleteByid(Integer userid) {
		return tbUserinfoMapper.deleteByid(userid);
	}

}
