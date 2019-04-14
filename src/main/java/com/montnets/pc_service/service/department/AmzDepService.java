package com.montnets.pc_service.service.department;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.montnets.pc_service.config.SystemConfig;
import com.montnets.pc_service.constant.AMZConstant;
import com.montnets.pc_service.constant.CmdType;
import com.montnets.pc_service.entity.AmzCmdtask;
import com.montnets.pc_service.entity.AmzDepartment;
import com.montnets.pc_service.repository.AmzCmdtaskRespository;
import com.montnets.pc_service.repository.AmzDepartmentRespository;
import com.montnets.pc_service.util.GetIncrementId;

import cn.hutool.core.util.HexUtil;
import cn.hutool.core.util.StrUtil;

@Service
public class AmzDepService {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private DepRootHtmlProcess depRootHtmlProcess;
	
	@Autowired
	private DepSonHtmlProcess depSonHtmlProcess;
	
	@Autowired
	private AmzDepartmentRespository amzDepartmentRespository;
	
	@Autowired
	AmzCmdtaskRespository cmdtaskRespository;
	
	@Autowired
    private SystemConfig systemConfig;
	
	public int dealRootDep(String cmdText) {
		
		try {
			if(StrUtil.isBlank(cmdText)) {
				log.error("处理根类目，指令内容为空。");
				return -1;
			}
			
			AmzDepartment parentDep = JSON.parseObject(cmdText, AmzDepartment.class);
			if(parentDep == null) {
				log.error("处理根类目，父类目对象为null。cmdText="+cmdText);
				return -2;
			}
			
			List<AmzDepartment> rootDepList = handleRootDep(parentDep);
			if(rootDepList == null || rootDepList.size() < 1) {
				return -1;
			}
			
			List<AmzCmdtask> cmdList = new ArrayList<>();
			// 写指令通知下载程序下载子类目页面
			for(AmzDepartment dep : rootDepList) {
				AmzCmdtask cmd = new AmzCmdtask();
				cmd.setCmdStatus(0);
				cmd.setCmdType(CmdType.CMD102);
				
				/*Map<String,String> paramMap = new HashMap<>();
				paramMap.put("parentId", dep.getId().toString());
				paramMap.put("parentDepId", dep.getDepId());
				String urlHex = HexUtil.encodeHexStr(dep.getUrl());
				paramMap.put("url", urlHex);
				paramMap.put("depLevel", String.valueOf(dep.getDepLevel() + 1));
				String cmdText = JSON.toJSONString(paramMap);*/
				
				String cmdTextJson = JSON.toJSONString(dep);
				
				cmd.setCmdText(cmdTextJson);
				
				cmdList.add(cmd);
			}
			
			cmdtaskRespository.saveAll(cmdList);
			return 1;
		} catch (Exception e) {
			log.error("处理根类目，异常。cmdText="+cmdText, e);
			return -9999;
		}
	}
	
	public int dealSonDep(String cmdText) {
		
		try {
			/*if(StrUtil.isBlank(cmdText)) {
				log.error("处理子类目，指令内容为空。");
				return -1;
			}
			List<AmzDepartment> rootDepList = handleRootDep(htmlFilePath);
			if(rootDepList == null || rootDepList.size() < 1) {
				return -1;
			}
			
			List<AmzCmdtask> cmdList = new ArrayList<>();
			// 写指令通知下载程序下载子类目页面
			for(AmzDepartment dep : rootDepList) {
				AmzCmdtask cmd = new AmzCmdtask();
				cmd.setCmdStatus(0);
				cmd.setCmdType(CmdType.CMD102);
				
				Map<String,String> paramMap = new HashMap<>();
				paramMap.put("parentId", dep.getId().toString());
				paramMap.put("parentDepId", dep.getDepId());
				String urlHex = HexUtil.encodeHexStr(dep.getUrl());
				paramMap.put("url", urlHex);
				paramMap.put("depLevel", String.valueOf(dep.getDepLevel() + 1));
				
				String cmdText = JSON.toJSONString(paramMap);
				cmd.setCmdText(cmdText);
				
				cmdList.add(cmd);
			}
			
			cmdtaskRespository.saveAll(cmdList);*/
			return 1;
		} catch (Exception e) {
			//log.error("处理根类目，异常。htmlFilePath="+htmlFilePath, e);
			return -9999;
		}
	}
	
	/**
	 * 
	 * @param htmlFilePath
	 * @return 返回1为成功
	 */
	public List<AmzDepartment> handleRootDep(AmzDepartment parentDep) {
		
		Map<String,String> depMap = depRootHtmlProcess.getDepsFromHtml(parentDep.getDataTarUrl());
		if(depMap == null || depMap.size() < 1) {
			log.error("处理一级类目，解析获取不到类目数据。htmlFilePath="+parentDep.getDataTarUrl());
			return null;
		}
		
		try {
			List<AmzDepartment> amzDepList = new ArrayList<>();
			for(String key : depMap.keySet()) {
				
				AmzDepartment amzDep = new AmzDepartment();
				long id = GetIncrementId.getInstance().getCount(systemConfig.getServerNode(), systemConfig.getAreaNode());
				amzDep.setId(id);
				
				String depUrl = depMap.get(key);
				String depId = getAmzDepId(depUrl);
				amzDep.setDepId(depId);

				amzDep.setShowNameCn(key);
				amzDep.setShowNameEn(key);

				amzDep.setUrl(depUrl);
				amzDep.setUrlDomain(AMZConstant.AMZ_US_DOMAIN);
				
				// 设置为根目录
				amzDep.setDepLevel(1);
				
				amzDep.setParentId(0L);
				amzDep.setParentDepId("0");
				
				// 类目状态。0-正常；1-被删除
				amzDep.setDepStatus(0);
				
				amzDep.setDataSrcUrl(parentDep.getDataTarUrl());
				
				amzDep.setCreateTime(new Date());
				amzDep.setUpdateTime(new Date());
				
				amzDepList.add(amzDep);
			}
			amzDepartmentRespository.saveAll(amzDepList);
			return amzDepList;
		} catch (Exception e) {
			log.error("处理根类目，异常。htmlFilePath="+parentDep.getDataTarUrl(), e);
			return null;
		}
	}
	
	/**
	 * 
	 * @param htmlFilePath
	 * @return 返回1为成功
	 */
	/*public List<AmzDepartment> handleSonDep(AmzDepartment parentDep) {
		
		Map<String,String> depMap = depSonHtmlProcess.getDepsFromHtml(parentDep.getDataSrcUrl(), parentDep.getDepId());
		if(depMap == null || depMap.size() < 1) {
			log.error("处理子类目，解析获取不到类目数据。htmlFilePath="+parentDep.getDataSrcUrl()+",parentDepId="+parentDep.getDepId());
			return null;
		}
		
		try {
			List<AmzDepartment> amzDepList = new ArrayList<>();
			for(String key : depMap.keySet()) {
				
				AmzDepartment amzDep = new AmzDepartment();
				long id = GetIncrementId.getInstance().getCount(systemConfig.getServerNode(), systemConfig.getAreaNode());
				amzDep.setId(id);
				
				String depUrl = depMap.get(key);
				amzDep.setDepId();

				amzDep.setShowNameCn(key);
				amzDep.setShowNameEn(key);

				amzDep.setUrl(depUrl);
				amzDep.setUrlDomain(AMZConstant.AMZ_US_DOMAIN);
				
				// 设置为根目录
				amzDep.setDepLevel();
				
				amzDep.setParentId();
				amzDep.setParentDepId(parentDepId);
				
				// 类目状态。0-正常；1-被删除
				amzDep.setDepStatus(0);
				
				amzDep.setDataSrcUrl(htmlFilePath);
				
				amzDep.setCreateTime(new Date());
				amzDep.setUpdateTime(new Date());
				
				amzDepList.add(amzDep);
			}
			amzDepartmentRespository.saveAll(amzDepList);
			return amzDepList;
		} catch (Exception e) {
			log.error("处理根类目，异常。htmlFilePath="+htmlFilePath, e);
			return null;
		}
	}*/
	
	private String getAmzDepId(String depUrl) {
		try {
			if(StrUtil.isBlank(depUrl)) {
				log.error("通过dep url获取depId，depUrl为空。");
				return null;
			}
			String[] paramArray = depUrl.split("&");
			for(String param : paramArray) {
				String[] value = param.split("=");
				if(value.length < 2) {
					continue;
				}
				if("node".equals(value[0])) {
					return value[1];
				}
			}
			return null;
		} catch (Exception e) {
			log.error("通过dep url获取depId，异常。depUrl="+depUrl, e);
			return null;
		}
	}
	
	public static void main(String[] args) {
		AmzDepartment amzDep = new AmzDepartment();
		//long id = GetIncrementId.getInstance().getCount(systemConfig.getServerNode(), systemConfig.getAreaNode());
		amzDep.setId(0L);
		
		//amzDep.setDepId(depId);

		//amzDep.setShowNameCn(key);
		//amzDep.setShowNameEn(key);

		amzDep.setUrl("https://www.amazon.com/");
		//amzDep.setUrlDomain(AMZConstant.AMZ_US_DOMAIN);
		
		// 设置为根目录
		amzDep.setDepLevel(0);
		
		amzDep.setParentId(0L);
		amzDep.setParentDepId("0");
		
		// 类目状态。0-正常；1-被删除
		amzDep.setDepStatus(0);
		
		//amzDep.setDataSrcUrl(parentDep.getDataTarUrl());
		amzDep.setDataTarUrl("F:\\study\\amz\\git\\pc_service\\page\\index.html");
		
		//amzDep.setCreateTime(new Date());
		//amzDep.setUpdateTime(new Date());
		
		String json = JSON.toJSONString(amzDep);
		System.out.println(json);
	}
}
