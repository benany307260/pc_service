
/*类目信息表 amz_departments */
CREATE TABLE IF NOT EXISTS amz_departments (
ID BIGINT NOT NULL DEFAULT 0,/*标识ID*/
DEP_ID VARCHAR(256) DEFAULT '',/*Amazon类目id*/
SHOW_NAME_CN VARCHAR(512) DEFAULT '',/*前端显示名称-中文*/
SHOW_NAME_EN VARCHAR(512) DEFAULT '',/*前端显示名称-英文*/
URL VARCHAR(1024) DEFAULT '',/*类目url，相对路径*/
URL_DOMAIN VARCHAR(256) DEFAULT '',/*类目url对应的域名*/
DEP_LEVEL INT,/*类目层级，1为根目录*/
PARENT_ID BIGINT,/*父类目标识ID*/
PARENT_DEP_ID VARCHAR(256) DEFAULT '',/*父类目的Amazon类目id*/
DEP_STATUS INT DEFAULT 0,/*类目状态。0-正常；1-被删除*/
DATA_SRC_URL VARCHAR(1024) DEFAULT '',/*机构数据来源页url*/
DATA_TAR_URL VARCHAR(1024) DEFAULT '',/*机构数据目标页url*/
CREATE_TIME DATETIME DEFAULT NOW(),
UPDATE_TIME DATETIME DEFAULT NOW(),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*产品信息表 amz_products */
CREATE TABLE IF NOT EXISTS amz_products (
ID BIGINT NOT NULL DEFAULT 0,/*标识ID*/
DEP_ID VARCHAR(256) DEFAULT '',/*Amazon类目id*/
PROD_ASIN VARCHAR(256) DEFAULT '',/*ASIN*/
PROD_UPC VARCHAR(256) DEFAULT '',/*UPC*/
PROD_NAME VARCHAR(1024) DEFAULT '',/*产品名称*/
PROD_IMG_URL  VARCHAR(1024) DEFAULT '',/*产品主图*/
PROD_BRAND VARCHAR(512) DEFAULT '',/*产品品牌*/
PROD_BRAND_URL VARCHAR(1024) DEFAULT '',/*产品品牌URL*/
PROD_PRICE decimal(12,2),/*产品价格*/
BSR INT DEFAULT 0,
REVIEWS_NUM INT DEFAULT 0,/*评论数*/
REVIEW_AVG decimal(5,1),/*评论平均分*/
QANDA_NUM INT DEFAULT 0,/*问答数*/
SELLERS_NUM INT DEFAULT 0,/*卖家数量*/
SELLER_TYPE INT DEFAULT 0,/*卖家类型。0-普通第三方卖家；1-亚马逊自营*/
SELLER_NAME VARCHAR(1024) DEFAULT '',/*卖家名称*/
SELLER_URL VARCHAR(1024) DEFAULT '',/*卖家URL*/
CREATE_TIME DATETIME DEFAULT NOW(),
UPDATE_TIME DATETIME DEFAULT NOW(),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*产品BSR表 amz_product_bsr */
CREATE TABLE IF NOT EXISTS amz_product_bsr (
ID BIGINT NOT NULL DEFAULT 0,/*标识ID*/
PROD_ASIN VARCHAR(256) DEFAULT '',/*ASIN*/
DEP_NAME_EN VARCHAR(512) DEFAULT '',/*类目前端显示名称-英文*/
DEP_ID VARCHAR(256) DEFAULT '',/*Amazon类目id*/
BSR INT DEFAULT 0,
BSR_URL VARCHAR(1024) DEFAULT '',/*BSR排名URL*/
CREATE_TIME DATETIME DEFAULT NOW(),
UPDATE_TIME DATETIME DEFAULT NOW(),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*指令表 amz_cmdtask */
CREATE TABLE IF NOT EXISTS amz_cmdtask (
ID INT NOT NULL auto_increment,/*标识ID，自增*/
CMD_TYPE INT DEFAULT 0,/*指令类型。101：待解析html类目*/
CMD_TEXT VARCHAR(4096),/*指令内容*/
CMD_STATUS INT DEFAULT 0,/*指令状态。0-未处理；1-处理中；2-处理成功；3-处理失败*/
CREATE_TIME DATETIME DEFAULT NOW(),
UPDATE_TIME DATETIME DEFAULT NOW(),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


