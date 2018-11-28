package controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import pojo.TbDepartment;
import pojo.TbUserinfo;

import service.TbDepartmentService;
import service.TbUserInfoService;

@Controller
@RequestMapping("/userInfo")
public class TbUserInfoController {
	@Autowired
	private TbUserInfoService userInfoService;
	@Autowired
	private TbDepartmentService tbDepartmentService;

	@RequestMapping("/selectDept.do")
	public String selectDept(Model model) {
		List<TbDepartment> listD = tbDepartmentService.selectAll();
		model.addAttribute("listD", listD);
		return "zhuce";
	}

	@RequestMapping("/zhuce.do")
	public String zhuce(@RequestParam(value = "file") MultipartFile file,
			@RequestParam(value = "userAccount") String userAccount, @RequestParam(value = "password") String password,
			@RequestParam(value = "email") String email, @RequestParam(value = "deptId") Integer deptId, Model model,
			HttpServletRequest request) {
		String oldName = file.getOriginalFilename();
		String prefix = oldName.substring(oldName.lastIndexOf(".") + 1);
		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyyMMddHHmmss");
		String newName = dateformat1.format(new Date()) + "." + prefix;
		String path = request.getSession().getServletContext().getRealPath("/image");
		try {
			File dir = new File(path, newName);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			file.transferTo(dir);
		} catch (Exception e) {
			e.printStackTrace();
		}
		TbUserinfo tbUserinfo = new TbUserinfo(userAccount, password, email, deptId, newName);
		int num = userInfoService.insert(tbUserinfo);
		if (num > 0) {
			return "login";
		} else {
			return "redirect:selectDept.do";
		}
	}

	@RequestMapping("/findUserAccount.do")
	@ResponseBody
	public Object findUserAccount(@RequestParam("userAccount") String userAccount) {
		TbUserinfo userInfo = userInfoService.selectUserAccount(userAccount);
		if (userInfo != null) {
			return userInfo;
		} else {
			return -1;
		}
	}

	@RequestMapping("/login.do")
	public String login(String userAccount, String password) {
		TbUserinfo userInfo = userInfoService.selectUserAccount(userAccount);
		if (userInfo != null && password.equals(userInfo.getPassword())) {
			return "redirect:select.do";
		}
		return "login";
	}

	@RequestMapping("/select.do")
	public String select(@RequestParam(value = "num", defaultValue = "1") Integer pageNum, TbUserinfo tbUserinfo,
			Model model) {
		PageHelper.startPage(pageNum, 2);
		List<TbUserinfo> listU = userInfoService.select(tbUserinfo);
		PageInfo<TbUserinfo> page = new PageInfo<TbUserinfo>(listU, 3);
		List<TbDepartment> listD = tbDepartmentService.selectAll();
		model.addAttribute("listD", listD);
		model.addAttribute("page", page);
		model.addAttribute("userinfo", tbUserinfo);
		return "index";
	}

	@RequestMapping("/updateSelect.do")
	public String updateSelect(@RequestParam("userId") Integer userId, Model model) {
		TbUserinfo tbUserInfo = userInfoService.selectById(userId);
		List<TbDepartment> listD = tbDepartmentService.selectAll();
		model.addAttribute("listD", listD);
		model.addAttribute("userinfo", tbUserInfo);
		return "updateUserInfo";
	}

	@RequestMapping("/update.do")
	public String update(TbUserinfo tbUserinfo) {
		int num = userInfoService.updateByid(tbUserinfo);
		if (num > 0) {
			return "redirect:select.do";
		} else {
			return "redirect:updateSelect.do?userId=" + tbUserinfo.getUserid();
		}
	}

	@RequestMapping("/delete.do")
	@ResponseBody
	public Integer delete(@RequestParam("userId") Integer userId) {
		int num = userInfoService.deleteByid(userId);
		return num;
	}

}
