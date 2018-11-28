package pojo;

import java.sql.Date;

public class TbUserinfo {
	private Integer userid;

	private String userAccount;

	private String password;

	private String email;

	private Integer deptId;

	private Date createDate;

	private Integer delFlag;

	private String image;

	private TbDepartment tbDepartment;

	public TbUserinfo() {
	}

	public TbUserinfo(String userAccount, String password, String email,
			Integer deptId,String image) {
		this.userAccount = userAccount;
		this.password = password;
		this.email = email;
		this.deptId = deptId;
		this.image = image;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public TbDepartment getTbDepartment() {
		return tbDepartment;
	}

	public void setTbDepartment(TbDepartment tbDepartment) {
		this.tbDepartment = tbDepartment;
	}
}