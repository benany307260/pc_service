package com.montnets.pc_service.service.dataprocessing;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.montnets.pc_service.config.SystemConfig;
import com.montnets.pc_service.entity.AmzDepartment;
import com.montnets.pc_service.repository.AmzDepartmentRespository;
import com.montnets.pc_service.util.GetIncrementId;
import com.montnets.rcos_service.constant.AMZConstant;

import cn.hutool.core.util.StrUtil;

@Service
public class AmzDepService {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AmzHtmlService amzHtmlService;
	
	@Autowired
	private AmzDepartmentRespository amzDepartmentRespository;
	
	@Autowired
    private SystemConfig systemConfig;
	
	/**
	 * 
	 * @param htmlFilePath
	 * @return 返回1为成功
	 */
	public int handleRootDep(String htmlFilePath) {
		
		Map<String,String> depMap = amzHtmlService.getDepsFromHtml(htmlFilePath);
		if(depMap == null || depMap.size() < 1) {
			log.error("处理一级类目，解析获取不到类目数据。htmlFilePath="+htmlFilePath);
			return -1;
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
				
				amzDep.setDataSrcUrl(htmlFilePath);
				
				amzDep.setCreateTime(new Date());
				amzDep.setUpdateTime(new Date());
				
				amzDepList.add(amzDep);
			}
			amzDepartmentRespository.saveAll(amzDepList);
			return 1;
		} catch (Exception e) {
			log.error("处理根类目，异常。htmlFilePath="+htmlFilePath, e);
			return -9999;
		}
	}
	
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
}
