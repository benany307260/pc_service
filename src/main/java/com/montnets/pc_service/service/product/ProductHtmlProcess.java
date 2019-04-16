package com.montnets.pc_service.service.product;

import java.io.File;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.montnets.pc_service.entity.AmzProduct;

@Service
public class ProductHtmlProcess {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	
	/**
	 * 解析html获取产品
	 * @param htmlFilePath
	 * @return
	 */
	public Map<String,String> getDepsFromHtml(String htmlFilePath) {
		try
		{
		    Document doc = Jsoup.parse( new File(htmlFilePath) , "utf-8" );
		    if(doc == null) {
		    	log.error("解析html获取产品，获取不到页面对象。htmlFilePath="+htmlFilePath);
		    	return null;
		    }
		    
		    AmzProduct product = new AmzProduct();
		    
		    Elements title = doc.select("span#productTitle");
		    if(title != null) {
		    	String title = title
		    }
		    
			Elements elements_li = doc.getElementsByTag("li");
			for (Element element_li : elements_li) {
				if(element_li == null) {
					continue;
				}
				String content = element_li.toString();
				String key1 = "rnid="+parentDepId;
				// 不存在关键字
				if (content.indexOf(key1) < 0) {
					continue;
				}
				//System.out.println(content);
				Element element_a = element_li.select("a").first();
				if(element_a == null) {
					continue;
				}
				String url = element_a.attr("href");
				System.out.println(url);
				Element element_span = element_a.select("span").first();
				if(element_span == null) {
					continue;
				}
				String depName = element_span.text();
				//System.out.println(depName);
				productMap.put(depName, url);
			}
		    
		    return productMap;
		} 
		catch (Exception e) 
		{
		    log.error("解析html获取子类目，异常。path="+htmlFilePath+",parentDepId="+parentDepId, e);
		    return null;
		}
	}
	
	
	public static void main(String[] args) {
		ProductHtmlProcess html = new ProductHtmlProcess();
		String path = "F:\\study\\amz\\git\\pc_service\\page\\amz_home_kitchen.html";
		html.getDepsFromHtml(path, "16225011011");
	}
}
