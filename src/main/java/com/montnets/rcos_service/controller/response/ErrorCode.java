package com.montnets.rcos_service.controller.response;
/** 
 * 类名：管理系统错误码<br> 
 * 类说明：<br> 
 *  
 */  
public enum ErrorCode {  

	/****************通用错误码******************/
	
    @Error(msg="鉴权不通过，请检查账号，密码，时间戳，固定串，以及MD5算法是否按照文档要求进行设置")  
    e1_100001,  
    
	/****************通用错误码******************/
    

    
    /******************认证错误码************************/
    @Error(msg="业务处理失败")  
    e1_100101,
    @Error(msg="认证系统异常")  
    e1_100199,
    
    /******************认证错误码************************/
    
    
    
    /******************行业错误码************************/
    @Error(msg="获取行业数据系统异常")  
    e1_100299,
    
    /******************行业错误码************************/
    
    
    
    /******************用途错误码************************/
    @Error(msg="获取用途数据系统异常")  
    e1_100399,
    
    /******************用途错误码************************/
    
    
    /******************档位错误码************************/
    @Error(msg="获取档位数据系统异常")  
    e1_100499,
    
    /******************档位错误码************************/
    
    /******************素材错误码************************/
    @Error(msg="获取素材数据系统异常")  
    e1_100599,
    
    /******************素材错误码************************/
    
      
    @Error(msg="系统异常")  
    e1_109999;  
    
    
    
    /** 
     * 返回错误码 
     */  
    public String getCode(){  
        return this.name();  
    }  
      
    /** 
     * 返回错误信息 
     */  
    public String getMessage(){  
        Error error = null;  
        try {  
            error = this.getClass().getField(this.getCode()).getAnnotation(Error.class);  
        } catch (Exception e) {  
            return null;  
        }  
        return error.msg();  
    }  
  
}