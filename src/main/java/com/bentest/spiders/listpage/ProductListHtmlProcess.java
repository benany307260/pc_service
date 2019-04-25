package com.bentest.spiders.listpage;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bentest.spiders.constant.AMZConstant;
import com.bentest.spiders.entity.AmzProduct;

import cn.hutool.core.util.StrUtil;

@Service
public class ProductListHtmlProcess {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	

	public List<AmzProduct> getListPage(int type, String htmlFilePath){
		
		Map<Integer,Integer> typeMap = new HashMap<>();
		typeMap.put(1, 1);
		typeMap.put(2, 2);
		
		List<AmzProduct> prodList = null;
		
		if(type == AMZConstant.VALUE_PAGE_TYPE_FIRST) {
			prodList = getListPageByType(type, htmlFilePath);
			// 这个类型已经试过，移除掉
			typeMap.remove(type);
		}
		else if(type == AMZConstant.VALUE_PAGE_TYPE_AFTER) {
			prodList = getListSecondAfter(htmlFilePath);
			// 这个类型已经试过，移除掉
			typeMap.remove(type);
		}
		else {
			log.error("解析html获取产品列表，未定义的类型。");
			return null;
		}
		
		if(prodList != null && prodList.size() > 0) {
			return prodList;
		}
		
		for(Integer key : typeMap.keySet()) {
			
		}
		
	}
	
	public List<AmzProduct> getListPageByType(int type, String htmlFilePath){
		
		if(type == AMZConstant.VALUE_PAGE_TYPE_FIRST) {
			return getListFirstPage(htmlFilePath);
		}
		else if(type == AMZConstant.VALUE_PAGE_TYPE_AFTER) {
			return getListSecondAfter(htmlFilePath);
		}
		else {
			log.error("解析html获取产品列表，未定义的类型。");
			return null;
		}
	}
	
	private List<AmzProduct> getListFirstPage(String htmlFilePath) {
		try
		{
			Document doc = Jsoup.parse( new File(htmlFilePath) , "utf-8" );
		    if(doc == null) {
		    	log.error("解析html获取产品列表，获取不到页面对象。htmlFilePath="+htmlFilePath);
		    	return null;
		    }
		    
		    Elements liEls = doc.select("div#mainResults li");
		    if(liEls == null || liEls.size() < 1) {
		    	return null;
		    }
		    
		    List<AmzProduct> prodList = new ArrayList<>();
		    
		    for(Element liEl : liEls) {
		    	if(liEl == null) {
		    		continue;
		    	}
		    	String asin = liEl.attr("data-asin");
		    	if(StrUtil.isBlank(asin)) {
		    		continue;
		    	}
		    	
		    	Elements aEls = liEl.select("a");
		    	if(aEls == null || aEls.size() < 1) {
		    		continue;
		    	}
		    	for(Element aEl : aEls) {
		    		String href = aEl.attr("href");
		    		if(StrUtil.isBlank(href)) {
		    			continue;
		    		}
		    		if(href.indexOf(asin) < 0) {
		    			continue;
		    		}
		    		AmzProduct product = new AmzProduct();
		    		product.setProdAsin(asin);
		    		product.setProdUrl(href);
		    		prodList.add(product);
		    		break;
		    	}
		    }
		    return prodList;
		} 
		catch (Exception e) 
		{
		    log.error("解析html获取产品列表，异常。path="+htmlFilePath, e);
		    return null;
		}
	}
	
	private List<AmzProduct> getListSecondAfter(String htmlFilePath) {
		try
		{
			Document doc = Jsoup.parse( new File(htmlFilePath) , "utf-8" );
		    if(doc == null) {
		    	log.error("解析html获取产品列表，获取不到页面对象。htmlFilePath="+htmlFilePath);
		    	return null;
		    }
		    
		    Elements aEls = doc.select("span[data-component-type=s-product-image] a");
		    if(aEls == null || aEls.size() < 1) {
		    	return null;
		    }
		    
		    List<AmzProduct> prodList = new ArrayList<>();
		    
		    for(Element aEl : aEls) {
		    	if(aEl == null) {
		    		continue;
		    	}
	    		String href = aEl.attr("href");
	    		if(StrUtil.isBlank(href)) {
	    			continue;
	    		}
	    		if("#".equals(href)) {
	    			continue;
	    		}
	    		AmzProduct product = new AmzProduct();
	    		product.setProdUrl(href);
	    		prodList.add(product);
		    }
		    return prodList;
		} 
		catch (Exception e) 
		{
		    log.error("解析html获取产品列表2，异常。path="+htmlFilePath, e);
		    return null;
		}
	}
	
	
	public static void main(String[] args) {
		try {
			ProductListHtmlProcess html = new ProductListHtmlProcess();
			//String mkdir = "C:/Users/lenovo/git/pc_service/page/%s";
			//String htmlFilePath = "C:\\Users\\lenovo\\git\\pc_service\\page\\list-page\\Automotive\\Automotive-2-123456789.html";
			String htmlFilePath = "C:\\Users\\lenovo\\git\\pc_service\\page\\list-page\\Automotive\\Tools & Equipment-1-123456789.html";
			
			List<AmzProduct> prodList = html.getListPage(2, htmlFilePath);
			
			for(AmzProduct prod : prodList) {
				System.out.println(prod.getProdUrl());
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
