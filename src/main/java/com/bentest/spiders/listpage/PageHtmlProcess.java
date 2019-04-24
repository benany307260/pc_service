package com.bentest.spiders.listpage;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bentest.spiders.constant.AMZConstant;

import cn.hutool.core.util.StrUtil;

@Service
public class PageHtmlProcess {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	

	public Map<String,String> getNextPage(int type, String htmlFilePath){
		if(type == AMZConstant.VALUE_PAGE_TYPE_FIRST) {
			return getFirstNextPage(htmlFilePath);
		}
		else if(type == AMZConstant.VALUE_PAGE_TYPE_AFTER) {
			return getNextSecondAfter(htmlFilePath);
		}
		else {
			log.error("解析html获取产品列表，未定义的类型。");
			return null;
		}
	}
	
	private Map<String,String> getFirstNextPage(String htmlFilePath) {
		try
		{
			Document doc = Jsoup.parse( new File(htmlFilePath) , "utf-8" );
		    if(doc == null) {
		    	log.error("解析html获取列表首页下一页，获取不到页面对象。htmlFilePath="+htmlFilePath);
		    	return null;
		    }
		    
		    Elements aEls = doc.select("a#pagnNextLink");
		    if(aEls == null || aEls.size() < 1) {
		    	return null;
		    }
		    
		    String href = aEls.attr("href");
		    if(StrUtil.isBlank(href)) {
		    	return null;
		    }
		    
		    Map<String,String> dataMap = new HashMap<>();
		    dataMap.put(AMZConstant.CMD_KEY_NEXT_PAGE_URL, href);
		    
		    return dataMap;
		} 
		catch (Exception e) 
		{
		    log.error("解析html获取列表首页下一页，异常。path="+htmlFilePath, e);
		    return null;
		}
	}
	
	private Map<String,String> getNextSecondAfter(String htmlFilePath) {
		try
		{
			Document doc = Jsoup.parse( new File(htmlFilePath) , "utf-8" );
		    if(doc == null) {
		    	log.error("解析html获取列表第二页后的下一页，获取不到页面对象。htmlFilePath="+htmlFilePath);
		    	return null;
		    }
		    
		    Elements aEls = doc.select("span[data-component-type=s-pagination] a");
		    if(aEls == null || aEls.size() < 1) {
		    	return null;
		    }
		    
		    for(Element aEl : aEls) {
		    	if(aEl == null) {
		    		continue;
		    	}
		    	String text = aEl.text();
		    	if(StrUtil.isBlank(text)) {
		    		continue;
		    	}
		    	text = text.toLowerCase();
		    	if(text.indexOf("next") < 0) {
		    		continue;
		    	}
		    	
	    		String href = aEl.attr("href");
	    		if(StrUtil.isBlank(href)) {
	    			continue;
	    		}
	    		Map<String,String> dataMap = new HashMap<>();
			    dataMap.put(AMZConstant.CMD_KEY_NEXT_PAGE_URL, href);
			    return dataMap;
		    }
		    
		    return null;
		} 
		catch (Exception e) 
		{
		    log.error("解析html获取列表第二页后的下一页，异常。path="+htmlFilePath, e);
		    return null;
		}
	}
	
	
	public static void main(String[] args) {
		try {
			PageHtmlProcess html = new PageHtmlProcess();
			//String mkdir = "C:/Users/lenovo/git/pc_service/page/%s";
			String mkdir = "F:\\study\\amz\\git\\pc_service\\page\\list-page\\%s";
			
			/*for(int i = 1; i <= 1; i++) {
				//i=11;
				String pageName = "pet-supplies-"+i+".html";
				String path = String.format(mkdir, pageName);
				List<AmzProduct> prodList = html.getListPageFromHtml(path);
				
				for(AmzProduct prod : prodList) {
					System.out.println(prod.getProdAsin()+"---"+prod.getProdUrl());
				}
				
			}*/
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
