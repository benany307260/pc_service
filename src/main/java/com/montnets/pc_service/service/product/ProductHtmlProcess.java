package com.montnets.pc_service.service.product;

import java.io.File;
import java.io.IOException;
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

import com.alibaba.fastjson.JSON;
import com.montnets.pc_service.entity.AmzProduct;
import com.montnets.pc_service.util.URLUtil;

import cn.hutool.core.util.StrUtil;

@Service
public class ProductHtmlProcess {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	
	/**
	 * 解析html获取产品
	 * @param htmlFilePath
	 * @return
	 */
	public AmzProduct getProductFromHtml(String htmlFilePath) {
		try
		{
		    Document doc = Jsoup.parse( new File(htmlFilePath) , "utf-8" );
		    if(doc == null) {
		    	log.error("解析html获取产品，获取不到页面对象。htmlFilePath="+htmlFilePath);
		    	return null;
		    }
		    
		    AmzProduct product = new AmzProduct();
		    // 产品名称
		    String title = selectForText(doc, "span#productTitle");
		    product.setProdName(title);
		    // 品牌
		    String prodBrand = selectForText(doc, "a#bylineInfo");
		    product.setProdBrand(prodBrand);
		    String brandUrl = selectForAttr(doc, "a#bylineInfo", "href");
		    product.setProdBrandUrl(brandUrl);
		    // 评论数
		    int reviewsNum = getReviewNum(doc);
		    product.setReviewsNum(reviewsNum);
		    // 问答数
		    int askNum = getAskNum(doc);
		    product.setAskNum(askNum);
		    // amz精选
		    int amzChoice = getAmzChoice(doc);
		    product.setProdAmzchoice(amzChoice);
		    // amz精选关键字
		    String acKey = selectForText(doc, "span.ac-keyword-link");
		    product.setAmzchoiceKey(acKey);
		    // amz精选关键字url
		    String acKeyUrl = getAmzChoiceKeyUrl(doc);
		    product.setAmzchoiceKeyUrl(acKeyUrl);
		    // 价格
		    double price = getPrice(doc);
		    product.setProdPrice(price);
		    // 产品所在类目ID
		    List<Map<String,String>> depList = getFromDepList(doc);
		    String fromDepId = getFromDepId(depList);
		    product.setFromDepId(fromDepId);
		    // 产品所在类目列表json
		    String fromDepJson = getFromDepListJson(depList);
		    product.setFromDepJson(fromDepJson);
		    
			
		    
		    return product;
		} 
		catch (Exception e) 
		{
		    log.error("解析html获取产品，异常。path="+htmlFilePath, e);
		    return null;
		}
	}
	
	
	private String selectForText(Document doc, String query) {
		try {
			Elements elements = doc.select(query);
			if(elements == null) {
				return null;
			}
			
			String text = elements.text();
			if(StrUtil.isBlank(text)) {
				return null;
			}
			
			// 去除前后空格
			text = text.trim();
			return text;
		} catch (Exception e) {
			log.error("查询标签的text，异常。query="+query, e);
			return null;
		}
	}
	
	private String selectForAttr(Document doc, String query, String attr) {
		try {
			Elements elements = doc.select(query);
			if(elements == null) {
				return null;
			}
			String attrValue = elements.attr(attr);
			return attrValue;
		} catch (Exception e) {
			log.error("查询标签的属性值，异常。query="+query+",attr"+attr, e);
			return null;
		}
	}
	
	private int getReviewNum(Document doc) {
		try {
			// 1,445 customer reviews
	    	String text = selectForText(doc, "span#acrCustomerReviewText");
	    	if(StrUtil.isBlank(text)) {
	    		return 0;
	    	}
	    	
	    	text = text.trim();
	    	text = text.substring(0, text.indexOf(" "));
	    	// 把数字里的逗号去掉
	    	text = text.replace(",", "");
	    	
	    	int reviewsNum = Integer.parseInt(text);
	    	return reviewsNum;
		} catch (Exception e) {
			log.error("获取评论数，异常。", e);
			return 0;
		}
	}
	
	private int getAskNum(Document doc) {
		try {
			// 67 answered questions
	    	String text = selectForText(doc, "a#askATFLink");
	    	if(StrUtil.isBlank(text)) {
	    		return 0;
	    	}
	    	
	    	text = text.trim();
	    	text = text.substring(0, text.indexOf(" "));
	    	// 把数字里的逗号去掉
	    	text = text.replace(",", "");
	    	
	    	int num = Integer.parseInt(text);
	    	return num;
		} catch (Exception e) {
			log.error("获取问答数，异常。", e);
			return 0;
		}
	}
	
	private int getAmzChoice(Document doc) {
		try {
	    	String text = selectForText(doc, "div#acBadge_feature_div");
	    	if(StrUtil.isBlank(text)) {
	    		return 0;
	    	}
	    	
	    	text = text.trim();
	    	text = text.toLowerCase();
	    	if(text.indexOf("choice") > -1) {
	    		return 1;
	    	}
	    	else {
	    		return 0;
	    	}
		} catch (Exception e) {
			log.error("获取amz精选，异常。", e);
			return 0;
		}
	}
	
	private double getPrice(Document doc) {
		try {
			double price = getPriceInOurprice(doc);
			if(price > 0) {
				return price;
			}
			
			price = getPriceInBuybox(doc);
			if(price > 0) {
				return price;
			}
			
			price = getPriceInSnsprice_Based(doc);
			if(price > 0) {
				return price;
			}
			
			price = getPriceInUnqualified(doc);
			if(price > 0) {
				return price;
			}
			
			return 0;
			
		} catch (Exception e) {
			log.error("获取价格，异常。", e);
			return 0;
		}
	}
	
	private double getPriceInOurprice(Document doc) {
		try {
	    	String text = selectForText(doc, "span#priceblock_ourprice");
	    	if(StrUtil.isBlank(text)) {
	    		return 0;
	    	}
	    	
	    	text = text.trim();
	    	text = text.substring(0, 1);
	    	
	    	Double price = Double.parseDouble(text);
	    	return price;
		} catch (Exception e) {
			log.error("获取priceblock_ourprice里的价格，异常。", e);
			return 0;
		}
	}
	
	private double getPriceInBuybox(Document doc) {
		try {
	    	String text = selectForText(doc, "span#price_inside_buybox");
	    	if(StrUtil.isBlank(text)) {
	    		return 0;
	    	}
	    	
	    	text = text.trim();
	    	text = text.substring(0, 1);
	    	
	    	Double price = Double.parseDouble(text);
	    	return price;
		} catch (Exception e) {
			log.error("获取price_inside_buybox里的价格，异常。", e);
			return 0;
		}
	}
	
	private double getPriceInSnsprice_Based(Document doc) {
		try {
			Elements basedEls = doc.select("span#priceblock_snsprice_Based");
			if(basedEls == null) {
				return 0;
			}
			Elements priceSpanEls = basedEls.select("span");
			if(priceSpanEls == null) {
				return 0;
			}
			Element priceEl = priceSpanEls.first();
			if(priceEl == null) {
				return 0;
			}
			
			String text = priceEl.text();
	    	text = text.trim();
	    	text = text.substring(0, 1);
	    	
	    	Double price = Double.parseDouble(text);
	    	return price;
		} catch (Exception e) {
			log.error("获取priceblock_snsprice_Based里的价格，异常。", e);
			return 0;
		}
	}
	
	private double getPriceInUnqualified(Document doc) {
		try {
			Elements unqualifiedEls = doc.select("div#unqualified");
			if(unqualifiedEls == null) {
				return 0;
			}
			Elements divEls = unqualifiedEls.select("div");
			if(divEls == null) {
				return 0;
			}
			Element divEl = divEls.first();
			if(divEl == null) {
				return 0;
			}
			Elements spanEls = divEl.select("span");
			if(spanEls == null) {
				return 0;
			}
			
			String text = spanEls.text();
	    	text = text.trim();
	    	text = text.substring(0, 1);
	    	
	    	Double price = Double.parseDouble(text);
	    	return price;
		} catch (Exception e) {
			log.error("获取unqualified里的价格，异常。", e);
			return 0;
		}
	}
	
	private String getAmzChoiceKeyUrl(Document doc) {
		try {
			Elements elements = doc.select("span.ac-keyword-link");
			if(elements == null) {
				return null;
			}
			
			Elements aEls = elements.select("a");
			if(aEls == null) {
				return null;
			}
			
			String url = aEls.attr("href");
			return url;
		} catch (Exception e) {
			log.error("获取amz精选关键字url，异常。", e);
			return null;
		}
	}
	
	private String getFromDepListJson(List<Map<String,String>> depList) {
		if(depList == null || depList.size() < 1) {
			log.error("获取产品所在类目列表json，传入depList为空。");
			return null;
		}
		String json = JSON.toJSONString(depList);
		return json;
	}
	
	private String getFromDepId(List<Map<String,String>> depList) {
		try {
			if(depList == null || depList.size() < 1) {
				log.error("获取产品所在类目ID，传入depList为空。");
				return null;
			}
			
			Map<String,String> depMap = depList.get(depList.size() - 1);
			if(depMap == null || depMap.size() < 1) {
				log.error("获取产品所在类目ID，获取最后一个类目map为空。");
				return null;
			}
			
			String depUrl = depMap.get("depUrl");
			
			//url示例：/s/ref=dp_bc_aui_C_3?ie=UTF8&node=723452011&rh=n%3A16225010011%2Cn%3A723418011%2C
			Map<String, String> mapRequestParam = URLUtil.URLRequest(depUrl);
			String node = mapRequestParam.get("node");
			if(StrUtil.isBlank(node)) {
				log.error("获取产品所在类目ID，node为空。depUrl="+depUrl);
				return null;
			}
			
			return node;
		} catch (Exception e) {
			log.error("获取产品所在类目ID，异常", e);
			return null;
		}
	}
	
	private List<Map<String,String>> getFromDepList(Document doc) {
		try {
			Elements divEls = doc.select("div#wayfinding-breadcrumbs_feature_div");
			if(divEls == null) {
				return null;
			}
			Elements ulEls = divEls.select("ul");
			if(ulEls == null) {
				return null;
			}
			
			List<Map<String,String>> depList = new ArrayList<>();
			
			for(Element liEl : ulEls) {
				Elements aEls = liEl.select("a");
				if(aEls == null || aEls.size() < 1) {
					continue;
				}
				Element el = aEls.first();
				if(el == null) {
					continue;
				}
				
				Map<String,String> depMap = new HashMap<String, String>();
				
				String depName = el.text();
				if(StrUtil.isBlank(depName)) {
					continue;
				}
				
				String depUrl = el.attr("href");
				if(StrUtil.isBlank(depUrl)) {
					continue;
				}
				
				depMap.put("depName", depName.trim());
				depMap.put("depUrl", depUrl.trim());
				depList.add(depMap);
			}
			return depList;
			
		} catch (Exception e) {
			log.error("获取产品所在类目列表，异常。", e);
			return null;
		}
	}
	
	private String getASIN(Document doc) {
		try {
			Elements divEls = doc.select("div#detail-bullets");
			if(divEls == null) {
				return null;
			}
			Elements liEls = divEls.select("li");
			if(liEls == null) {
				return null;
			}
			
			for(Element liEl : liEls) {
				if(liEl == null) {
					continue;
				}
				String liContent = liEl.text();
				if(StrUtil.isBlank(liContent)) {
					continue;
				}
				if(liContent.toLowerCase().indexOf("asin") < 0) {
					continue;
				}
				String asin = liEl.ownText();
				if(StrUtil.isBlank(asin)) {
					return null;
				}
				return asin.trim();
			}
			return null;
			
		} catch (Exception e) {
			log.error("获取产品ASIN，异常。", e);
			return null;
		}
	}
	
	public static void main(String[] args) {
		try {
			ProductHtmlProcess html = new ProductHtmlProcess();
			String path = "F:/study/amz/git/pc_service/page/product1.html";
			Document doc = Jsoup.parse( new File(path) , "utf-8" );
			String asin = html.getASIN(doc);
			System.out.println(asin);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
