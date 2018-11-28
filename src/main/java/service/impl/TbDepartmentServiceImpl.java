package service.impl;

import java.util.List;

import mapper.TbDepartmentMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pojo.TbDepartment;
import service.TbDepartmentService;
@Service
public class TbDepartmentServiceImpl implements TbDepartmentService {
	@Autowired
	private TbDepartmentMapper tbDepartmentMapper;
	@Override
	public List<TbDepartment> selectAll() {
		return tbDepartmentMapper.selectAll();
	}

}
