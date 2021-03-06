
/*类目信息表 amz_departments */
CREATE TABLE IF NOT EXISTS amz_departments (
ID BIGINT NOT NULL DEFAULT 0,/*标识ID*/
DEP_ID VARCHAR(256) DEFAULT '',/*Amazon类目id*/
DEP_NAME_CN VARCHAR(512) DEFAULT '',/*前端显示名称-中文*/
DEP_NAME VARCHAR(512) DEFAULT '',/*前端显示名称-英文*/
URL VARCHAR(1024) DEFAULT '',/*类目url，相对路径*/
URL_DOMAIN VARCHAR(256) DEFAULT '',/*类目url对应的域名*/
DEP_LEVEL INT,/*类目层级，1为根目录*/
PARENT_ID BIGINT,/*父类目标识ID*/
PARENT_DEP_ID VARCHAR(256) DEFAULT '',/*父类目的Amazon类目id*/
DEP_ID_ALL VARCHAR(1024) DEFAULT '',/*类目amz id，包括父类目id，格式如：parentid/id */
DEP_STATUS INT DEFAULT 0,/*类目状态。0-正常；1-被删除*/
HTML_FILE_PATH VARCHAR(512) DEFAULT '',/*该类目已下载的html页面路径*/
FROM_HTML_FILE_PATH VARCHAR(512) DEFAULT '',/*该类目数据的来源html*/
SOFT_NUM INT DEFAULT 1,/*排序号*/
CREATE_TIME DATETIME DEFAULT NOW(),
UPDATE_TIME DATETIME DEFAULT NOW(),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*产品信息表 amz_products */
CREATE TABLE IF NOT EXISTS amz_products (
ID BIGINT NOT NULL DEFAULT 0,/*标识ID*/
PROD_ASIN VARCHAR(256) DEFAULT '',/*ASIN*/
PROD_UPC VARCHAR(256) DEFAULT '',/*UPC*/
PROD_TITLE VARCHAR(1024) DEFAULT '',/*产品标题*/
PROD_PRICE decimal(12,2),/*产品价格*/
PROD_IMG_URL  VARCHAR(51) DEFAULT '',/*产品主图*/
BSR INT DEFAULT 0,/*BSR大类排名*/
BSR_DEPID VARCHAR(256) DEFAULT '',/*BSR类目ID*/
BSR_DEP_NAME VARCHAR(512) DEFAULT '',/*BSR类目名称*/
BSR_JSON VARCHAR(4096) DEFAULT '',/*BSR排名列表*/
REVIEWS_NUM INT DEFAULT 0,/*评论数*/
REVIEW_AVG decimal(5,1),/*评论平均分*/
ASK_NUM INT DEFAULT 0,/*问答数*/
SELLERS_NUM INT DEFAULT 0,/*卖家数量*/
SELLER_TYPE INT DEFAULT 0,/*卖家类型。0-普通第三方卖家；1-亚马逊自营*/
SELLER_NAME VARCHAR(1024) DEFAULT '',/*卖家名称*/
SELLER_URL VARCHAR(1024) DEFAULT '',/*卖家URL*/
FULFILL_NAME VARCHAR(512) DEFAULT '',/*配送名称*/
FULFILL_URL VARCHAR(512) DEFAULT '',/*配送URL*/
FBA_TYPE INT DEFAULT 0,/*是否FBA。0-否；1-是*/
PROD_AMZCHOICE INT DEFAULT 0,/*amz精选。0-普通；1-精选*/
AMZCHOICE_KEY VARCHAR(512) DEFAULT '',/*amz精选关键字*/
AMZCHOICE_KEY_URL VARCHAR(512) DEFAULT '',/*amz精选关键字URL*/
FROM_DEP_ID VARCHAR(256) DEFAULT '',/*产品所在类目ID*/
FROM_DEP_NAME VARCHAR(512) DEFAULT '',/*产品所在类目名称*/
FROM_DEP_JSON VARCHAR(4096) DEFAULT '',/*产品所在类目列表*/
SHOP_NAME VARCHAR(512) DEFAULT '',/*店铺名称*/
SHOP_URL VARCHAR(512) DEFAULT '',/*店铺URL*/
PROD_BRAND VARCHAR(512) DEFAULT '',/*产品品牌*/
PROD_BRAND_URL VARCHAR(512) DEFAULT '',/*产品品牌URL*/
HTML_FILE_PATH VARCHAR(512) DEFAULT '',/*已下载产品html页面路径*/
PROD_URL VARCHAR(512) DEFAULT '',/*产品访问url*/
CREATE_TIME DATETIME DEFAULT NOW(),
UPDATE_TIME DATETIME DEFAULT NOW(),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*产品BSR表 amz_products_bsr */
CREATE TABLE IF NOT EXISTS amz_product_bsr (
ID BIGINT NOT NULL DEFAULT 0,/*标识ID*/
PROD_ID BIGINT NOT NULL DEFAULT 0,/*产品标识ID*/
PROD_ASIN VARCHAR(256) DEFAULT '',/*ASIN*/
BSR INT DEFAULT 0,/*BSR大类排名*/
BSR_DEPID VARCHAR(256) DEFAULT '',/*BSR类目ID*/
BSR_DEP_NAME VARCHAR(512) DEFAULT '',/*BSR类目名称*/
BSR_URL VARCHAR(1024) DEFAULT '',/*BSR排名URL*/
SORT_NUM INT DEFAULT 0,/*排序*/
CREATE_TIME DATETIME DEFAULT NOW(),
UPDATE_TIME DATETIME DEFAULT NOW(),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*指令表 amz_cmdtask */
CREATE TABLE IF NOT EXISTS amz_cmdtask (
ID INT NOT NULL auto_increment,/*标识ID，自增*/
CMD_TYPE INT DEFAULT 0,/*指令类型。101：待解析html类目*/
CMD_TEXT VARCHAR(4096),/*指令内容*/
CMD_STATUS INT DEFAULT 0,/*指令状态。0-未处理；1-处理中；2-处理成功；3-处理失败；4-暂不处理*/
DEAL_COUNT INT DEFAULT 0,/*处理次数*/
CREATE_TIME DATETIME DEFAULT NOW(),
UPDATE_TIME DATETIME DEFAULT NOW(),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*UA表 amz_ua */
CREATE TABLE IF NOT EXISTS amz_ua (
ID INT NOT NULL,/*标识ID*/
UA VARCHAR(512) ,
BROWSER_TYPE VARCHAR(32) ,/*浏览器类型*/
BROWSER_VERSION VARCHAR(128) ,/*浏览器版本*/
BROWSER_NAME VARCHAR(32),/*浏览器简称*/
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*代理运营商表 amz_proxy_isp */
CREATE TABLE IF NOT EXISTS amz_proxy_isp (
ID INT NOT NULL,/*标识ID*/
PROXY_TYPE INT ,/*代理类型。1-芝麻HTTP代理*/
GET_URL VARCHAR(1024) ,
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*代理表 amz_proxy */
CREATE TABLE IF NOT EXISTS amz_proxy (
ID BIGINT NOT NULL,/*标识ID*/
IP VARCHAR(64) NOT NULL,
PORT INT ,
ISP_ID INT,/*代理运营商id，引用amz_proxy_isp的ID*/
EXPIRE_TIME BIGINT,/*失效时间（毫秒数）*/
EXPIRE_TIME_STR VARCHAR(64),/*失效时间*/
USE_COUNT INT,/*使用次数*/
FAIL_COUNT INT,/*失败次数*/
STATUS INT,/*状态。0-可用；1-失效*/
CREATE_TIME DATETIME DEFAULT NOW(),
UPDATE_TIME DATETIME DEFAULT NOW(),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




