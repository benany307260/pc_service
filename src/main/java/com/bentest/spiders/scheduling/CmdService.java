package com.bentest.spiders.scheduling;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.bentest.spiders.constant.CmdType;
import com.bentest.spiders.dao.CmdMapper;
import com.bentest.spiders.entity.AmzCmdtask;
import com.bentest.spiders.listpage.PageService;
import com.bentest.spiders.listpage.ProductListService;
import com.bentest.spiders.service.department.AmzDepService;
import com.bentest.spiders.service.product.AmzProductService;

@Service
public class CmdService {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AmzDepService amzDepService;
	
	@Autowired
	private AmzProductService productService;
	
	@Autowired
	private ProductListService productListService;
	
	@Autowired
	private PageService pageService;
	
	@Autowired
	private CmdMapper cmdMapper;
	
	
	@Async("processTaskExecutor")
	public void dealCmdTask(AmzCmdtask cmdTask){
		try {
			// 设置为处理中
			cmdTask.setCmdStatus(1);
			cmdTask.setUpdateTime(new Date());
			// 未处理的指令更新为处理中
			Integer updateRes = cmdMapper.updateCmdStatus(cmdTask.getId(), cmdTask.getCmdStatus(), 0);
			if(updateRes == null || updateRes < 1) {
				log.error("处理指令任务，指令更新为处理中，更新失败。updateRes="+updateRes+",cmdId="+cmdTask.getId());
				return;
			}
						
			int res = deal(cmdTask);
			if(res > 0) {
				// 处理成功
				cmdTask.setCmdStatus(2);
			}else {
				// 处理失败
				cmdTask.setCmdStatus(3);
			}
			cmdTask.setUpdateTime(new Date());
			
			// 更新指令处理结果
			updateRes = cmdMapper.updateCmdStatus(cmdTask.getId(), cmdTask.getCmdStatus(), 1);
			if(updateRes == null || updateRes < 1) {
				log.error("处理指令任务，指令任务更新处理结果，更新失败。updateRes="+updateRes+",cmdId="+cmdTask.getId()+",res="+res);
			}
			
			//return true;
		} catch (Exception e) {
			log.error("处理指令任务，异常。", e);
			//return false;
		}
	}
	
	private int deal(AmzCmdtask cmdTask){
		try {
			if(cmdTask == null){
				log.info("指令处理，指令对象为null。");
				return -1;
			}
			
			// 
			if(cmdTask.getCmdType() == CmdType.CMD101) {
				String cmdText = cmdTask.getCmdText();
				int res = amzDepService.dealRootDep(cmdText);
				return res;
			}
			if(cmdTask.getCmdType() == CmdType.CMD103) {
				String cmdText = cmdTask.getCmdText();
				int res = amzDepService.dealSonDep(cmdText);
				return res;
			}
			if(cmdTask.getCmdType() == CmdType.CMD105) {
				String cmdText = cmdTask.getCmdText();
				int res = productService.dealProduct(cmdText);
				return res;
			}
			if(cmdTask.getCmdType() == CmdType.CMD107) {
				String cmdText = cmdTask.getCmdText();
				int res = productListService.dealProductList(cmdText);
				return res;
			}
			if(cmdTask.getCmdType() == CmdType.CMD108) {
				String cmdText = cmdTask.getCmdText();
				int res = pageService.dealPage(cmdText);
				return res;
			}
			
			return -1;
			
			// 结果存库
		} catch (Exception e) {
			log.error("处理指令，异常。", e);
			return -9999;
		}
	}
}
