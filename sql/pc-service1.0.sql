
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
CREATE_TIME DATETIME DEFAULT NOW(),
UPDATE_TIME DATETIME DEFAULT NOW(),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*UA表 amz_ua */
CREATE TABLE IF NOT EXISTS amz_ua (
ID INT NOT NULL,/*标识ID*/
UA VARCHAR(1024) ,
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*代理表 amz_proxy */
CREATE TABLE IF NOT EXISTS amz_proxy (
ID INT NOT NULL,/*标识ID*/
PROXY_TYPE INT ,/*代理类型。1-芝麻HTTP代理*/
GET_URL VARCHAR(1024) ,
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*UA数据*/
INSERT INTO amz_ua (ID, UA) VALUES (1, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; es) AppleWebKit/418 (KHTML, like Gecko) Safari/417.9.3');
INSERT INTO amz_ua (ID, UA) VALUES (2, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; es) AppleWebKit/417.9 (KHTML, like Gecko) Safari/417.8');
INSERT INTO amz_ua (ID, UA) VALUES (3, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/418 (KHTML, like Gecko) Safari/417.9.2');
INSERT INTO amz_ua (ID, UA) VALUES (4, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/417.9 (KHTML, like Gecko) Safari/417.9.2');
INSERT INTO amz_ua (ID, UA) VALUES (5, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/417.9 (KHTML, like Gecko) Safari/417.8');
INSERT INTO amz_ua (ID, UA) VALUES (6, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/418 (KHTML, like Gecko) Safari/417.9.3');
INSERT INTO amz_ua (ID, UA) VALUES (7, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/418 (KHTML, like Gecko) Safari/417.9.2');
INSERT INTO amz_ua (ID, UA) VALUES (8, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; nl-nl) AppleWebKit/416.12 (KHTML, like Gecko) Safari/416.13');
INSERT INTO amz_ua (ID, UA) VALUES (9, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; nl-nl) AppleWebKit/416.11 (KHTML, like Gecko) Safari/416.12');
INSERT INTO amz_ua (ID, UA) VALUES (10, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; nl-nl) AppleWebKit/416.11 (KHTML, like Gecko) Safari/312');
INSERT INTO amz_ua (ID, UA) VALUES (11, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; nb-no) AppleWebKit/416.12 (KHTML, like Gecko) Safari/416.13');
INSERT INTO amz_ua (ID, UA) VALUES (12, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/416.12 (KHTML, like Gecko) Safari/416.13');
INSERT INTO amz_ua (ID, UA) VALUES (13, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; it-it) AppleWebKit/416.12 (KHTML, like Gecko) Safari/416.13');
INSERT INTO amz_ua (ID, UA) VALUES (14, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/416.12 (KHTML, like Gecko) Safari/416.13');
INSERT INTO amz_ua (ID, UA) VALUES (15, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/416.11 (KHTML, like Gecko) Safari/416.12');
INSERT INTO amz_ua (ID, UA) VALUES (16, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/416.12 (KHTML, like Gecko) Safari/416.13_Adobe');
INSERT INTO amz_ua (ID, UA) VALUES (17, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/416.12 (KHTML, like Gecko) Safari/416.13');
INSERT INTO amz_ua (ID, UA) VALUES (18, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/416.12 (KHTML, like Gecko) Safari/412.5');
INSERT INTO amz_ua (ID, UA) VALUES (19, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/416.11 (KHTML, like Gecko) Safari/416.12');
INSERT INTO amz_ua (ID, UA) VALUES (20, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/416.12 (KHTML, like Gecko) Safari/416.13');
INSERT INTO amz_ua (ID, UA) VALUES (21, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/416.11 (KHTML, like Gecko) Safari/416.12');
INSERT INTO amz_ua (ID, UA) VALUES (22, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-ca) AppleWebKit/416.11 (KHTML, like Gecko) Safari/416.12');
INSERT INTO amz_ua (ID, UA) VALUES (23, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/416.12 (KHTML, like Gecko) Safari/416.13');
INSERT INTO amz_ua (ID, UA) VALUES (24, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/416.11 (KHTML, like Gecko) Safari/416.12');
INSERT INTO amz_ua (ID, UA) VALUES (25, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/416.11 (KHTML, like Gecko)');
INSERT INTO amz_ua (ID, UA) VALUES (26, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/416.12 (KHTML, like Gecko) Safari/416.13_Adobe');
INSERT INTO amz_ua (ID, UA) VALUES (27, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/416.12 (KHTML, like Gecko) Safari/416.13');
INSERT INTO amz_ua (ID, UA) VALUES (28, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/412.7 (KHTML, like Gecko) Safari/412.5');
INSERT INTO amz_ua (ID, UA) VALUES (29, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; it-it) AppleWebKit/412.7 (KHTML, like Gecko) Safari/412.5');
INSERT INTO amz_ua (ID, UA) VALUES (30, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/412.7 (KHTML, like Gecko) Safari/412.5');
INSERT INTO amz_ua (ID, UA) VALUES (31, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/412.7 (KHTML, like Gecko) Safari/412.5');
INSERT INTO amz_ua (ID, UA) VALUES (32, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/412.7 (KHTML, like Gecko) Safari/412.5');
INSERT INTO amz_ua (ID, UA) VALUES (33, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412.7 (KHTML, like Gecko) Safari/412.6');
INSERT INTO amz_ua (ID, UA) VALUES (34, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412.7 (KHTML, like Gecko) Safari/412.5');
INSERT INTO amz_ua (ID, UA) VALUES (35, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/412.7 (KHTML, like Gecko) Safari/412.5_Adobe');
INSERT INTO amz_ua (ID, UA) VALUES (36, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/412.7 (KHTML, like Gecko) Safari/412.5');
INSERT INTO amz_ua (ID, UA) VALUES (37, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS; pl-pl) AppleWebKit/412 (KHTML, like Gecko) Safari/412');
INSERT INTO amz_ua (ID, UA) VALUES (38, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS; en-en) AppleWebKit/412 (KHTML, like Gecko) Safari/412');
INSERT INTO amz_ua (ID, UA) VALUES (39, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; it-it) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2');
INSERT INTO amz_ua (ID, UA) VALUES (40, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/412 (KHTML, like Gecko) Safari/412');
INSERT INTO amz_ua (ID, UA) VALUES (41, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2');
INSERT INTO amz_ua (ID, UA) VALUES (42, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/412 (KHTML, like Gecko) Safari/412');
INSERT INTO amz_ua (ID, UA) VALUES (43, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; es-ES) AppleWebKit/412 (KHTML, like Gecko) Safari/412');
INSERT INTO amz_ua (ID, UA) VALUES (44, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en_US) AppleWebKit/412 (KHTML, like Gecko) Safari/412');
INSERT INTO amz_ua (ID, UA) VALUES (45, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2');
INSERT INTO amz_ua (ID, UA) VALUES (46, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/412 (KHTML, like Gecko) Safari/412 Privoxy/3.0');
INSERT INTO amz_ua (ID, UA) VALUES (47, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/412 (KHTML, like Gecko) Safari/412');
INSERT INTO amz_ua (ID, UA) VALUES (48, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412.6.2 (KHTML, like Gecko) Safari/412.2.2');
INSERT INTO amz_ua (ID, UA) VALUES (49, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412.6.2 (KHTML, like Gecko)');
INSERT INTO amz_ua (ID, UA) VALUES (50, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2');
INSERT INTO amz_ua (ID, UA) VALUES (51, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412 (KHTML, like Gecko) Safari/412');
INSERT INTO amz_ua (ID, UA) VALUES (52, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/412.6.2 (KHTML, like Gecko) Safari/412.2.2');
INSERT INTO amz_ua (ID, UA) VALUES (53, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2_Adobe');
INSERT INTO amz_ua (ID, UA) VALUES (54, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2');
INSERT INTO amz_ua (ID, UA) VALUES (55, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/412.6 (KHTML, like Gecko)');
INSERT INTO amz_ua (ID, UA) VALUES (56, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/412 (KHTML, like Gecko) Safari/412');
INSERT INTO amz_ua (ID, UA) VALUES (57, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; sv-se) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.5');
INSERT INTO amz_ua (ID, UA) VALUES (58, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; it-it) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.6');
INSERT INTO amz_ua (ID, UA) VALUES (59, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.6');
INSERT INTO amz_ua (ID, UA) VALUES (60, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.5');
INSERT INTO amz_ua (ID, UA) VALUES (61, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.5');
INSERT INTO amz_ua (ID, UA) VALUES (62, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.8.1 (KHTML, like Gecko) Safari/312.6');
INSERT INTO amz_ua (ID, UA) VALUES (63, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.6');
INSERT INTO amz_ua (ID, UA) VALUES (64, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.5');
INSERT INTO amz_ua (ID, UA) VALUES (65, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.6');
INSERT INTO amz_ua (ID, UA) VALUES (66, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.5');
INSERT INTO amz_ua (ID, UA) VALUES (67, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.3.3');
INSERT INTO amz_ua (ID, UA) VALUES (68, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/312.8.1 (KHTML, like Gecko) Safari/312.6');
INSERT INTO amz_ua (ID, UA) VALUES (69, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.5_Adobe');
INSERT INTO amz_ua (ID, UA) VALUES (70, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.5');
INSERT INTO amz_ua (ID, UA) VALUES (71, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; sv-se) AppleWebKit/312.5.2 (KHTML, like Gecko) Safari/312.3.3');
INSERT INTO amz_ua (ID, UA) VALUES (72, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; sv-se) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1');
INSERT INTO amz_ua (ID, UA) VALUES (73, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1');
INSERT INTO amz_ua (ID, UA) VALUES (74, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; it-it) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1');
INSERT INTO amz_ua (ID, UA) VALUES (75, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/312.5.2 (KHTML, like Gecko) Safari/312.3.3');
INSERT INTO amz_ua (ID, UA) VALUES (76, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1');
INSERT INTO amz_ua (ID, UA) VALUES (77, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/312.5 (KHTML, like Gecko) Safari/312.3');
INSERT INTO amz_ua (ID, UA) VALUES (78, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/312.5.2 (KHTML, like Gecko) Safari/312.3.3');
INSERT INTO amz_ua (ID, UA) VALUES (79, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1');
INSERT INTO amz_ua (ID, UA) VALUES (80, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/312.5 (KHTML, like Gecko) Safari/312.3');
INSERT INTO amz_ua (ID, UA) VALUES (81, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; es-es) AppleWebKit/312.5.2 (KHTML, like Gecko) Safari/312.3.3');
INSERT INTO amz_ua (ID, UA) VALUES (82, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; es) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1');
INSERT INTO amz_ua (ID, UA) VALUES (83, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1');
INSERT INTO amz_ua (ID, UA) VALUES (84, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.5 (KHTML, like Gecko) Safari/312.3');
INSERT INTO amz_ua (ID, UA) VALUES (85, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.5.2 (KHTML, like Gecko) Safari/312.3.3');
INSERT INTO amz_ua (ID, UA) VALUES (86, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.5.2 (KHTML, like Gecko) Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (87, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1');
INSERT INTO amz_ua (ID, UA) VALUES (88, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/125.9');
INSERT INTO amz_ua (ID, UA) VALUES (89, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.5 (KHTML, like Gecko) Safari/312.3');
INSERT INTO amz_ua (ID, UA) VALUES (90, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/312.5.2 (KHTML, like Gecko) Safari/312.3.3');
INSERT INTO amz_ua (ID, UA) VALUES (91, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; it-it) AppleWebKit/312.1 (KHTML, like Gecko) Safari/312');
INSERT INTO amz_ua (ID, UA) VALUES (92, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/312.1.1 (KHTML, like Gecko) Safari/312');
INSERT INTO amz_ua (ID, UA) VALUES (93, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/312.1 (KHTML, like Gecko) Safari/312');
INSERT INTO amz_ua (ID, UA) VALUES (94, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/312.1 (KHTML, like Gecko) Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (95, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-ch) AppleWebKit/312.1.1 (KHTML, like Gecko) Safari/312');
INSERT INTO amz_ua (ID, UA) VALUES (96, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-ca) AppleWebKit/312.1 (KHTML, like Gecko) Safari/312');
INSERT INTO amz_ua (ID, UA) VALUES (97, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.1 (KHTML, like Gecko) Safari/312');
INSERT INTO amz_ua (ID, UA) VALUES (98, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.1 (KHTML, like Gecko)');
INSERT INTO amz_ua (ID, UA) VALUES (99, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.1.1 (KHTML, like Gecko) Safari/312');
INSERT INTO amz_ua (ID, UA) VALUES (100, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.1 (KHTML, like Gecko) Safari/312');
INSERT INTO amz_ua (ID, UA) VALUES (101, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/312.1.1 (KHTML, like Gecko) Safari/312');
INSERT INTO amz_ua (ID, UA) VALUES (102, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/312.1 (KHTML, like Gecko) Safari/312.3.1');
INSERT INTO amz_ua (ID, UA) VALUES (103, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/312.1 (KHTML, like Gecko) Safari/312');
INSERT INTO amz_ua (ID, UA) VALUES (104, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-ch) AppleWebKit/312.1 (KHTML, like Gecko) Safari/312');
INSERT INTO amz_ua (ID, UA) VALUES (105, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/125.5.6 (KHTML, like Gecko) Safari/125.12');
INSERT INTO amz_ua (ID, UA) VALUES (106, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.12');
INSERT INTO amz_ua (ID, UA) VALUES (107, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.11');
INSERT INTO amz_ua (ID, UA) VALUES (108, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-ch) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.12');
INSERT INTO amz_ua (ID, UA) VALUES (109, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-ch) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.11');
INSERT INTO amz_ua (ID, UA) VALUES (110, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/125.5.7 (KHTML, like Gecko) Safari/125.12');
INSERT INTO amz_ua (ID, UA) VALUES (111, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/125.5.6 (KHTML, like Gecko) Safari/125.12');
INSERT INTO amz_ua (ID, UA) VALUES (112, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.12');
INSERT INTO amz_ua (ID, UA) VALUES (113, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.11');
INSERT INTO amz_ua (ID, UA) VALUES (114, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.7 (KHTML, like Gecko) Safari/125.12');
INSERT INTO amz_ua (ID, UA) VALUES (115, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.6 (KHTML, like Gecko) Safari/125.12');
INSERT INTO amz_ua (ID, UA) VALUES (116, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.5.5');
INSERT INTO amz_ua (ID, UA) VALUES (117, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.12');
INSERT INTO amz_ua (ID, UA) VALUES (118, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.11');
INSERT INTO amz_ua (ID, UA) VALUES (119, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (120, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/125.5.7 (KHTML, like Gecko) Safari/125.12');
INSERT INTO amz_ua (ID, UA) VALUES (121, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/125.5.6 (KHTML, like Gecko) Safari/125.12_Adobe');
INSERT INTO amz_ua (ID, UA) VALUES (122, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/125.5.6 (KHTML, like Gecko) Safari/125.12');
INSERT INTO amz_ua (ID, UA) VALUES (123, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.12_Adobe');
INSERT INTO amz_ua (ID, UA) VALUES (124, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/125.5.5 (KHTML, like Gecko) Safari/125.12');
INSERT INTO amz_ua (ID, UA) VALUES (125, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/125.4 (KHTML, like Gecko) Safari/125.9');
INSERT INTO amz_ua (ID, UA) VALUES (126, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/125.5 (KHTML, like Gecko) Safari/125.9');
INSERT INTO amz_ua (ID, UA) VALUES (127, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/125.4 (KHTML, like Gecko) Safari/125.9');
INSERT INTO amz_ua (ID, UA) VALUES (128, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en_CA) AppleWebKit/125.4 (KHTML, like Gecko) Safari/125.9');
INSERT INTO amz_ua (ID, UA) VALUES (129, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/125.4 (KHTML, like Gecko) Safari/125.9');
INSERT INTO amz_ua (ID, UA) VALUES (130, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-au) AppleWebKit/125.4 (KHTML, like Gecko) Safari/125.9');
INSERT INTO amz_ua (ID, UA) VALUES (131, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5 (KHTML, like Gecko) Safari/125.9');
INSERT INTO amz_ua (ID, UA) VALUES (132, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.4 (KHTML, like Gecko) Safari/125.9');
INSERT INTO amz_ua (ID, UA) VALUES (133, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.4 (KHTML, like Gecko) Safari/100');
INSERT INTO amz_ua (ID, UA) VALUES (134, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/125.4 (KHTML, like Gecko) Safari/125.9');
INSERT INTO amz_ua (ID, UA) VALUES (135, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; es-es) AppleWebKit/125.2 (KHTML, like Gecko) Safari/125.8');
INSERT INTO amz_ua (ID, UA) VALUES (136, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/125.2 (KHTML, like Gecko) Safari/125.7');
INSERT INTO amz_ua (ID, UA) VALUES (137, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-gb) AppleWebKit/125.2 (KHTML, like Gecko) Safari/125.8');
INSERT INTO amz_ua (ID, UA) VALUES (138, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.2 (KHTML, like Gecko) Safari/85.8');
INSERT INTO amz_ua (ID, UA) VALUES (139, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.2 (KHTML, like Gecko) Safari/125.8');
INSERT INTO amz_ua (ID, UA) VALUES (140, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.2 (KHTML, like Gecko) Safari/125.7');
INSERT INTO amz_ua (ID, UA) VALUES (141, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.2 (KHTML, like Gecko) Safari/125.8');
INSERT INTO amz_ua (ID, UA) VALUES (142, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/125.2 (KHTML, like Gecko) Safari/125.8');
INSERT INTO amz_ua (ID, UA) VALUES (143, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/125.2 (KHTML, like Gecko) Safari/125.7');
INSERT INTO amz_ua (ID, UA) VALUES (144, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; it-it) AppleWebKit/124 (KHTML, like Gecko) Safari/125.1');
INSERT INTO amz_ua (ID, UA) VALUES (145, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/124 (KHTML, like Gecko) Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (146, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/124 (KHTML, like Gecko) Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (147, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/124 (KHTML, like Gecko)');
INSERT INTO amz_ua (ID, UA) VALUES (148, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/124 (KHTML, like Gecko) Safari/125.1');
INSERT INTO amz_ua (ID, UA) VALUES (149, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/124 (KHTML, like Gecko) Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (150, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/85.8.5 (KHTML, like Gecko) Safari/85.8.1');
INSERT INTO amz_ua (ID, UA) VALUES (151, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/85.8.5 (KHTML, like Gecko) Safari/85.8.1');
INSERT INTO amz_ua (ID, UA) VALUES (152, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/85.8.5 (KHTML, like Gecko) Safari/85.8.1');
INSERT INTO amz_ua (ID, UA) VALUES (153, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/85.8.2 (KHTML, like Gecko) Safari/85.8');
INSERT INTO amz_ua (ID, UA) VALUES (154, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-gb) AppleWebKit/85.8.5 (KHTML, like Gecko) Safari/85.8.1');
INSERT INTO amz_ua (ID, UA) VALUES (155, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/85.8.5 (KHTML, like Gecko) Safari/85.8.1');
INSERT INTO amz_ua (ID, UA) VALUES (156, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/85.8.2 (KHTML, like Gecko) Safari/85.8.1');
INSERT INTO amz_ua (ID, UA) VALUES (157, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/85.8.5 (KHTML, like Gecko) Safari/85.8.1');
INSERT INTO amz_ua (ID, UA) VALUES (158, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/85.8.5 (KHTML, like Gecko) Safari/85');
INSERT INTO amz_ua (ID, UA) VALUES (159, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/85.8.2 (KHTML, like Gecko) Safari/85.8');
INSERT INTO amz_ua (ID, UA) VALUES (160, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; sv-se) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.5');
INSERT INTO amz_ua (ID, UA) VALUES (161, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.5');
INSERT INTO amz_ua (ID, UA) VALUES (162, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.5');
INSERT INTO amz_ua (ID, UA) VALUES (163, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.5');
INSERT INTO amz_ua (ID, UA) VALUES (164, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.6');
INSERT INTO amz_ua (ID, UA) VALUES (165, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.5');
INSERT INTO amz_ua (ID, UA) VALUES (166, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.7');
INSERT INTO amz_ua (ID, UA) VALUES (167, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.5');
INSERT INTO amz_ua (ID, UA) VALUES (168, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092816 Mobile Safari 1.1.3');
INSERT INTO amz_ua (ID, UA) VALUES (169, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN) AppleWebKit/533+ (KHTML, like Gecko)');
INSERT INTO amz_ua (ID, UA) VALUES (170, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/528.8 (KHTML, like Gecko)');
INSERT INTO amz_ua (ID, UA) VALUES (171, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/534.34 (KHTML, like Gecko) Dooble/1.40 Safari/534.34');
INSERT INTO amz_ua (ID, UA) VALUES (172, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fi-fi) AppleWebKit/420+ (KHTML, like Gecko) Safari/419.3');
INSERT INTO amz_ua (ID, UA) VALUES (173, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.8.1 (KHTML, like Gecko) Safari/312.6');
INSERT INTO amz_ua (ID, UA) VALUES (174, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/419.2 (KHTML, like Gecko) Safari/419.3');
INSERT INTO amz_ua (ID, UA) VALUES (175, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/418.9.1 (KHTML, like Gecko) Safari/419.3');
INSERT INTO amz_ua (ID, UA) VALUES (176, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-ch) AppleWebKit/85 (KHTML, like Gecko) Safari/85');
INSERT INTO amz_ua (ID, UA) VALUES (177, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-CH) AppleWebKit/419.2 (KHTML, like Gecko) Safari/419.3');
INSERT INTO amz_ua (ID, UA) VALUES (178, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; da-dk) AppleWebKit/522+ (KHTML, like Gecko) Safari/419.3');
INSERT INTO amz_ua (ID, UA) VALUES (179, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_6; en-us) AppleWebKit/528.16 (KHTML, like Gecko)');
INSERT INTO amz_ua (ID, UA) VALUES (180, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; it-IT) AppleWebKit/521.25 (KHTML, like Gecko) Safari/521.24');
INSERT INTO amz_ua (ID, UA) VALUES (181, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-us) AppleWebKit/419.2.1 (KHTML, like Gecko) Safari/419.3');
INSERT INTO amz_ua (ID, UA) VALUES (182, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/522.11.1 (KHTML, like Gecko) Safari/419.3');
INSERT INTO amz_ua (ID, UA) VALUES (183, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/521.32.1 (KHTML, like Gecko) Safari/521.32.1');
INSERT INTO amz_ua (ID, UA) VALUES (184, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit (KHTML, like Gecko)');
INSERT INTO amz_ua (ID, UA) VALUES (185, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; es-es) AppleWebKit/531.22.7 (KHTML, like Gecko)');
INSERT INTO amz_ua (ID, UA) VALUES (186, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/528.16 (KHTML, like Gecko)');
INSERT INTO amz_ua (ID, UA) VALUES (187, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_5; it-it) AppleWebKit/525.18 (KHTML, like Gecko)');
INSERT INTO amz_ua (ID, UA) VALUES (188, 'Mozilla/5.0 (Windows NT 5.2; RW; rv:7.0a1) Gecko/20091211 SeaMonkey/9.23a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (189, 'Mozilla/5.0 (Windows NT 5.2; RW; rv:7.0a1) Gecko/20091211 SeaMonkey/9.23a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (190, 'Mozilla/5.0 (Windows; U; Windows NT 6.2; WOW64; rv:1.8.0.7) Gecko/20110321 MultiZilla/4.33.2.6a SeaMonkey/8.6.55');
INSERT INTO amz_ua (ID, UA) VALUES (191, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; rv:1.8.0.7) Gecko/20110321 MultiZilla/4.33.2.6a SeaMonkey/8.6.55');
INSERT INTO amz_ua (ID, UA) VALUES (192, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; RW; rv:1.8.0.7) Gecko/20110321 MultiZilla/4.33.2.6a SeaMonkey/8.6.55');
INSERT INTO amz_ua (ID, UA) VALUES (193, 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:1.8.0.7) Gecko/20110321 MultiZilla/4.33.2.6a SeaMonkey/8.6.55');
INSERT INTO amz_ua (ID, UA) VALUES (194, 'Mozilla/5.0 (X11; U; Linux i686; ru; rv:33.2.3.12) Gecko/20120201 SeaMonkey/8.2.8');
INSERT INTO amz_ua (ID, UA) VALUES (195, 'Mozilla/5.0 (X11; Linux x86_64; rv:12.0) Gecko/20120501 Firefox/12.0 SeaMonkey/2.9.1 Lightning/1.4');
INSERT INTO amz_ua (ID, UA) VALUES (196, 'Mozilla/5.0 (X11; Linux i686; rv:12.0) Gecko/20120502 SeaMonkey/2.9.1');
INSERT INTO amz_ua (ID, UA) VALUES (197, 'Mozilla/5.0 (Windows NT 6.1 WOW64 rv:12.0) Gecko/20120429 Firefox/12.0 SeaMonkey/2.9.1');
INSERT INTO amz_ua (ID, UA) VALUES (198, 'Mozilla/5.0 (X11; Linux x86_64; rv:12.0) Gecko/20120427 Firefox/12.0 SeaMonkey/2.9');
INSERT INTO amz_ua (ID, UA) VALUES (199, 'Mozilla/5.0 (Windows NT 5.0; rv:1.9.2.8) Gecko/20120427 Firefox/12.0 SeaMonkey/2.9');
INSERT INTO amz_ua (ID, UA) VALUES (200, 'Mozilla/5.0 (Windows NT 6.2; rv:11.0) Gecko/20120312 Firefox/11.0 SeaMonkey/2.8');
INSERT INTO amz_ua (ID, UA) VALUES (201, 'Mozilla/5.0 (X11; Linux x86_64; rv:10.0.2) Gecko/20120216 Firefox/10.0.2 SeaMonkey/2.7.2');
INSERT INTO amz_ua (ID, UA) VALUES (202, 'Mozilla/5.0 (Windows NT 5.0; rv:10.0.2) Gecko/20120216 SeaMonkey/2.7.2');
INSERT INTO amz_ua (ID, UA) VALUES (203, 'Mozilla/5.0 (OS/2; Warp 4.5; rv:10.0.12) Gecko/20130108 Firefox/10.0.12 SeaMonkey/2.7.2');
INSERT INTO amz_ua (ID, UA) VALUES (204, 'Mozilla/5.0 (X11; Linux i686; rv:10.0.1) Gecko/20100101 Firefox/10.0.1 SeaMonkey/2.7.1');
INSERT INTO amz_ua (ID, UA) VALUES (205, 'Mozilla/5.0 (X11 Linux i686 rv:10.0.1) Gecko/20100101 Firefox/10.0.1 SeaMonkey/2.7.1');
INSERT INTO amz_ua (ID, UA) VALUES (206, 'Mozilla/5.0 (Windows NT 6.1; rv:10.0.1) Gecko/20100101 Firefox/10.0.1 SeaMonkey/2.7.1');
INSERT INTO amz_ua (ID, UA) VALUES (207, 'Mozilla/5.0 (Windows NT 5.2; rv:10.0.1) Gecko/20100101 Firefox/10.0.1 SeaMonkey/2.7.1');
INSERT INTO amz_ua (ID, UA) VALUES (208, 'Mozilla/5.0 (X11; Linux i686; rv:9.0.1) Gecko/20120127 SeaMonkey/2.6.1');
INSERT INTO amz_ua (ID, UA) VALUES (209, 'Mozilla/5.0 (Windows NT 5.1 rv:9.0.1) Gecko/20111221 Firefox/9.0.1 SeaMonkey/2.6.1');
INSERT INTO amz_ua (ID, UA) VALUES (210, 'Mozilla/5.0 (Windows NT 5.1; rv:9.0) Gecko/20111217 SeaMonkey/2.6');
INSERT INTO amz_ua (ID, UA) VALUES (211, 'Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0 SeaMonkey/2.49.4');
INSERT INTO amz_ua (ID, UA) VALUES (212, 'Mozilla/5.0 (Windows NT 10.0; rv:52.0) Gecko/20100101 Firefox/52.0 SeaMonkey/2.49.4 Lightning/5.4');
INSERT INTO amz_ua (ID, UA) VALUES (213, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110622 SeaMonkey/2.4a1');
INSERT INTO amz_ua (ID, UA) VALUES (214, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110621 SeaMonkey/2.4a1');
INSERT INTO amz_ua (ID, UA) VALUES (215, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110619 SeaMonkey/2.4a1');
INSERT INTO amz_ua (ID, UA) VALUES (216, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110618 SeaMonkey/2.4a1');
INSERT INTO amz_ua (ID, UA) VALUES (217, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110616 SeaMonkey/2.4a1');
INSERT INTO amz_ua (ID, UA) VALUES (218, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110614 SeaMonkey/2.4a1');
INSERT INTO amz_ua (ID, UA) VALUES (219, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110613 SeaMonkey/2.4a1');
INSERT INTO amz_ua (ID, UA) VALUES (220, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110610 SeaMonkey/2.4a1');
INSERT INTO amz_ua (ID, UA) VALUES (221, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110607 SeaMonkey/2.4a1');
INSERT INTO amz_ua (ID, UA) VALUES (222, 'Mozilla/5.0 (Windows NT 5.1; rv:7.0a1) Gecko/20110619 Firefox/7.0a1 SeaMonkey/2.4a1');
INSERT INTO amz_ua (ID, UA) VALUES (223, 'Mozilla/5.0 (Windows NT 5.1; rv:7.0a1) Gecko/20110612 Firefox/7.0a1 SeaMonkey/2.4a1');
INSERT INTO amz_ua (ID, UA) VALUES (224, 'Mozilla/5.0 (X11; Linux i686; rv:41.0) Gecko/20100101 Firefox/41.0 SeaMonkey/2.38');
INSERT INTO amz_ua (ID, UA) VALUES (225, 'Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0 SeaMonkey/2.35');
INSERT INTO amz_ua (ID, UA) VALUES (226, 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0 SeaMonkey/2.35');
INSERT INTO amz_ua (ID, UA) VALUES (227, 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0 SeaMonkey/2.35');
INSERT INTO amz_ua (ID, UA) VALUES (228, 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0 SeaMonkey/2.35');
INSERT INTO amz_ua (ID, UA) VALUES (229, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:36.0) Gecko/20100101 Firefox/36.0 SeaMonkey/2.33.1');
INSERT INTO amz_ua (ID, UA) VALUES (230, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:35.0) Gecko/20100101 Firefox/35.0 SeaMonkey/2.32a2');
INSERT INTO amz_ua (ID, UA) VALUES (231, 'Mozilla/5.0 (X11 Linux x86_64 rv:34.0) Gecko/20100101 Firefox/34.0 SeaMonkey/2.31');
INSERT INTO amz_ua (ID, UA) VALUES (232, 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0 SeaMonkey/2.31');
INSERT INTO amz_ua (ID, UA) VALUES (233, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:33.0) Gecko/20100101 Firefox/33.0 SeaMonkey/2.30');
INSERT INTO amz_ua (ID, UA) VALUES (234, 'Mozilla/5.0 (Windows NT 6.1 rv:6.0.2) Gecko/20110902 Firefox/6.0.2 SeaMonkey/2.3.3');
INSERT INTO amz_ua (ID, UA) VALUES (235, 'Mozilla/5.0 (Windows NT 5.1 rv:6.0.1) Gecko/20110830 Firefox/6.0.1 SeaMonkey/2.3.1');
INSERT INTO amz_ua (ID, UA) VALUES (236, 'Mozilla/5.0 (Windows NT 5.1 rv:6.0) Gecko/20110820 Firefox/6.0 SeaMonkey/2.3.1');
INSERT INTO amz_ua (ID, UA) VALUES (237, 'Mozilla/5.0 (X11; FreeBSD amd64; rv:6.0) Gecko/20110818 Firefox/6.0 SeaMonkey/2.3');
INSERT INTO amz_ua (ID, UA) VALUES (238, 'Mozilla/5.0 (Windows NT 5.1; rv:33.0) Gecko/20100101 Firefox/33.0 SeaMonkey/2.3');
INSERT INTO amz_ua (ID, UA) VALUES (239, 'Mozilla/5.0 (X11; Linux i686; rv:31.0) Gecko/20100101 Firefox/31.0 SeaMonkey/2.28a1');
INSERT INTO amz_ua (ID, UA) VALUES (240, 'Mozilla/5.0 (Windows NT 6.2 WOW64 rv:29.0) Gecko/20100101 Firefox/29.0 SeaMonkey/2.26.1');
INSERT INTO amz_ua (ID, UA) VALUES (241, 'Mozilla/5.0 (X11; Linux i686; rv:28.0) Gecko/20100101 Firefox/28.0 SeaMonkey/2.25');
INSERT INTO amz_ua (ID, UA) VALUES (242, 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0 SeaMonkey/2.25');
INSERT INTO amz_ua (ID, UA) VALUES (243, 'Mozilla/5.0 (Windows NT 5.1; rv:28.0) Gecko/20100101 Firefox/28.0 SeaMonkey/2.25 Lightning/3.0b1');
INSERT INTO amz_ua (ID, UA) VALUES (244, 'Mozilla/5.0 (X11; FreeBSD amd64; rv:27.0) Gecko/20100101 Firefox/27.0 SeaMonkey/2.24');
INSERT INTO amz_ua (ID, UA) VALUES (245, 'Mozilla/5.0 (Windows NT 5.1; rv:26.0) Gecko/20100101 Firefox/26.0 SeaMonkey/2.23a1');
INSERT INTO amz_ua (ID, UA) VALUES (246, 'Mozilla/5.0 (Windows NT 6.1 WOW64 rv:25.0) Gecko/20100101 Firefox/25.0 SeaMonkey/2.22.1');
INSERT INTO amz_ua (ID, UA) VALUES (247, 'Mozilla/5.0 (X11; OpenBSD amd64; rv:24.0) Gecko/20100101 Firefox/24.0 SeaMonkey/2.21');
INSERT INTO amz_ua (ID, UA) VALUES (248, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:24.0) Gecko/20100101 Firefox/24.0 SeaMonkey/2.21 Lightning/2.6b3');
INSERT INTO amz_ua (ID, UA) VALUES (249, 'Mozilla/5.0 (X11; Linux x86_64; rv:7.0a1) Gecko/20110602 Firefox/7.0a1 SeaMonkey/2.2a1pre Lightning/1.1a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (250, 'Mozilla/5.0 (X11; Linux i686; rv:7.0a1) Gecko/20110604 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (251, 'Mozilla/5.0 (X11; Linux i686; rv:7.0a1) Gecko/20110603 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (252, 'Mozilla/5.0 (X11; Linux i686; rv:7.0a1) Gecko/20110530 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (253, 'Mozilla/5.0 (X11; Linux i686; rv:7.0a1) Gecko/20110526 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (254, 'Mozilla/5.0 (X11; Linux i686; rv:2.2a1pre) Gecko/20110407 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (255, 'Mozilla/5.0 (X11; Linux i686; rv:2.2a1pre) Gecko/20110327 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (256, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110605 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (257, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110603 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (258, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110602 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (259, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110601 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (260, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110530 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (261, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110529 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (262, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110527 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (263, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110526 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (264, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110525 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (265, 'Mozilla/5.0 (Windows NT 5.2; rv:7.0a1) Gecko/20110524 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (266, 'Mozilla/5.0 (Windows NT 5.2; rv:6.0a1) Gecko/20110512 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (267, 'Mozilla/5.0 (Windows NT 5.2; rv:2.2a1pre) Gecko/20110327 SeaMonkey/2.2a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (268, 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0 SeaMonkey/2.20');
INSERT INTO amz_ua (ID, UA) VALUES (269, 'Mozilla/5.0 (Windows NT 5.0; rv:5.0) Gecko/20110706 Firefox/5.0 SeaMonkey/2.2');
INSERT INTO amz_ua (ID, UA) VALUES (270, 'Mozilla/5.0 (Windows NT 6.1; rv:21.0) Gecko/20100101 Firefox/21.0 SeaMonkey/2.18a1');
INSERT INTO amz_ua (ID, UA) VALUES (271, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:20.0) Gecko/20100101 Firefox/20.0 SeaMonkey/2.17');
INSERT INTO amz_ua (ID, UA) VALUES (272, 'Mozilla/5.0 (Windows NT 5.2; rv:20.0) Gecko/20100101 Firefox/20.0 SeaMonkey/2.17');
INSERT INTO amz_ua (ID, UA) VALUES (273, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:19.0) Gecko/20100101 Firefox/19.0 SeaMonkey/2.16.2');
INSERT INTO amz_ua (ID, UA) VALUES (274, 'Mozilla/5.0 (Windows NT 6.0; rv:19.0) Gecko/20100101 Firefox/19.0 SeaMonkey/2.16.1');
INSERT INTO amz_ua (ID, UA) VALUES (275, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0 SeaMonkey/2.16');
INSERT INTO amz_ua (ID, UA) VALUES (276, 'Mozilla/5.0 (Windows NT 5.1 rv:16.0) Gecko/20121026 Firefox/16.0 SeaMonkey/2.13.2');
INSERT INTO amz_ua (ID, UA) VALUES (277, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:16.0) Gecko/20121011 Firefox/16.0 SeaMonkey/2.13.1 Lightning/1.8');
INSERT INTO amz_ua (ID, UA) VALUES (278, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:16.0) Gecko/20121011 Firefox/16.0 SeaMonkey/2.13.1');
INSERT INTO amz_ua (ID, UA) VALUES (279, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:16.0) Gecko/20121011 Firefox/16.0 SeaMonkey/2.13.1');
INSERT INTO amz_ua (ID, UA) VALUES (280, 'Mozilla/5.0 (X11; Linux i686; rv:16.0) Gecko/20120906 SeaMonkey/2.13');
INSERT INTO amz_ua (ID, UA) VALUES (281, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:16.0) Gecko/20120830 Firefox/16.0 SeaMonkey/2.13 Lightning/1.8b1');
INSERT INTO amz_ua (ID, UA) VALUES (282, 'Mozilla/5.0 (Windows NT 5.1; rv:16.0) Gecko/20121007 SeaMonkey/2.13');
INSERT INTO amz_ua (ID, UA) VALUES (283, 'Mozilla/5.0 (Windows NT 5.1; rv:16.0) Gecko/20121007 Firefox/16.0 SeaMonkey/2.13');
INSERT INTO amz_ua (ID, UA) VALUES (284, 'Mozilla/5.0 (Macintosh; PPC Mac OS X 10.5; rv:16.0) Gecko/20121009 Firefox/16.0 SeaMonkey/2.13');
INSERT INTO amz_ua (ID, UA) VALUES (285, 'Mozilla/5.0 (X11; Linux x86_64; rv:15.0) Gecko/20120909 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (286, 'Mozilla/5.0 (X11; Linux x86_64; rv:15.0) Gecko/20120909 Firefox/15.0.1 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (287, 'Mozilla/5.0 (X11; Linux i686; rv:15.0) Gecko/20120910 Firefox/15.0.1 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (288, 'Mozilla/5.0 (X11; Linux i686; rv:15.0) Gecko/20120909 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (289, 'Mozilla/5.0 (X11; Linux i686; rv:15.0) Gecko/20120909 Firefox/15.0.1 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (290, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:15.0) Gecko/20120909 Firefox/15.0.1 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (291, 'Mozilla/5.0 (Windows NT 6.1; rv:15.0) Gecko/20120909 Firefox/15.0.1 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (292, 'Mozilla/5.0 (Windows NT 6.0; rv:15.0) Gecko/20120909 Firefox/15.0.1 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (293, 'Mozilla/5.0 (Windows NT 5.2; rv:15.0) Gecko/20120909 Firefox/15.0.1 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (294, 'Mozilla/5.0 (Windows NT 5.1; rv:15.0) Gecko/20120909 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (295, 'Mozilla/5.0 (Windows NT 5.1; rv:15.0) Gecko/20120909 Firefox/15.0.1 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (296, 'Mozilla/5.0 (Macintosh; PPC Mac OS X 10.5; rv:15.0) Gecko/20120910 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (297, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:15.0) Gecko/20120909 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (298, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:15.0) Gecko/20120909 Firefox/15.0.1 SeaMonkey/2.12.1');
INSERT INTO amz_ua (ID, UA) VALUES (299, 'Mozilla/5.0 (X11; Linux x86_64; rv:15.0) Gecko/20120826 Firefox/15.0 SeaMonkey/2.12 Lightning/1.7');
INSERT INTO amz_ua (ID, UA) VALUES (300, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:15.0) Gecko/20120826 Firefox/15.0 SeaMonkey/2.12');
INSERT INTO amz_ua (ID, UA) VALUES (301, 'Mozilla/5.0 (X11; Linux x86_64; rv:14.0) Gecko/20120817 SeaMonkey/2.11');
INSERT INTO amz_ua (ID, UA) VALUES (302, 'Mozilla/5.0 (X11; Linux x86_64; rv:14.0) Gecko/20120817 Firefox/14.0.1 SeaMonkey/2.11');
INSERT INTO amz_ua (ID, UA) VALUES (303, 'Mozilla/5.0 (Windows NT 6.1; rv:14.0) Gecko/20120715 Firefox/14.0.1 SeaMonkey/2.11 Lightning/1.6');
INSERT INTO amz_ua (ID, UA) VALUES (304, 'Mozilla/5.0 (X11; Linux i686; rv:2.2a1pre) Gecko/20110324 SeaMonkey/2.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (305, 'Mozilla/5.0 (X11; Linux i686; rv:2.0b13pre) Gecko/20110321 SeaMonkey/2.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (306, 'Mozilla/5.0 (X11; Linux i686; rv:2.0b13pre) Gecko/20110316 SeaMonkey/2.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (307, 'Mozilla/5.0 (X11; Linux i686; rv:2.0b12pre) Gecko/20110204 SeaMonkey/2.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (308, 'Mozilla/5.0 (Windows NT 5.2; rv:2.0b13pre) Gecko/20110317 SeaMonkey/2.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (309, 'Mozilla/5.0 (X11; Linux i686; rv:2.0b9pre) Gecko/20110101 SeaMonkey/2.1b2pre');
INSERT INTO amz_ua (ID, UA) VALUES (310, 'Mozilla/5.0 (X11; Linux i686; rv:2.0b9pre) Gecko/20101231 SeaMonkey/2.1b2pre');
INSERT INTO amz_ua (ID, UA) VALUES (311, 'Mozilla/5.0 (X11; Linux i686; rv:2.0b9pre) Gecko/20101230 SeaMonkey/2.1b2pre');
INSERT INTO amz_ua (ID, UA) VALUES (312, 'Mozilla/5.0 (Windows NT 5.2; rv:2.0b9pre) Gecko/20110110 SeaMonkey/2.1b2pre');
INSERT INTO amz_ua (ID, UA) VALUES (313, 'Mozilla/5.0 (Windows NT 5.2; rv:2.0b9pre) Gecko/20101231 SeaMonkey/2.1b2pre');
INSERT INTO amz_ua (ID, UA) VALUES (314, 'Mozilla/5.0 (Windows NT 5.2; rv:2.0b8pre) Gecko/20101028 SeaMonkey/2.1b2pre');
INSERT INTO amz_ua (ID, UA) VALUES (315, 'Mozilla/5.0 (Windows NT 5.2; rv:2.0b8pre) Gecko/20101014 SeaMonkey/2.1b2pre');
INSERT INTO amz_ua (ID, UA) VALUES (316, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0b11) Gecko/20110209 Firefox/ SeaMonkey/2.1b2');
INSERT INTO amz_ua (ID, UA) VALUES (317, 'Mozilla/5.0 (Windows NT 5.2; rv:2.0b7pre) Gecko/20100915 Firefox/4.0b7pre SeaMonkey/2.1b1pre');
INSERT INTO amz_ua (ID, UA) VALUES (318, 'Mozilla/5.0 (Windows NT 5.2; rv:2.0b5pre) Gecko/20100830 SeaMonkey/2.1b1pre');
INSERT INTO amz_ua (ID, UA) VALUES (319, 'Mozilla/5.0 (X11; Linux i686; rv:2.0b7pre) Gecko/20101008 Firefox/4.0b7pre SeaMonkey/2.1b1');
INSERT INTO amz_ua (ID, UA) VALUES (320, 'Mozilla/5.0 (Windows; Windows NT 6.1; rv:2.0b2pre) Gecko/20100720 SeaMonkey/2.1a3pre');
INSERT INTO amz_ua (ID, UA) VALUES (321, 'Mozilla/5.0 (Windows; Windows NT 5.2; rv:2.0b3pre) Gecko/20100803 SeaMonkey/2.1a3pre');
INSERT INTO amz_ua (ID, UA) VALUES (322, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.3a4pre) Gecko/20100404 SeaMonkey/2.1a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (323, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-CA; rv:1.9.3a3pre) Gecko/20100312 SeaMonkey/2.1a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (324, 'Mozilla/5.0 (Windows NT 5.1; rv:13.0) Gecko/20120615 Firefox/13.0.1 SeaMonkey/2.10.1 Lightning/1.5.1');
INSERT INTO amz_ua (ID, UA) VALUES (325, 'Mozilla/5.0 (Windows NT 5.1; rv:13.0) Gecko/20120615 Firefox/13.0.1 SeaMonkey/2.10.1');
INSERT INTO amz_ua (ID, UA) VALUES (326, 'Mozilla/5.0 (X11; Linux x86_64; rv:13.0) Gecko/20120604 Firefox/13.0 SeaMonkey/2.10');
INSERT INTO amz_ua (ID, UA) VALUES (327, 'Mozilla/5.0 (X11; Linux i686; rv:13.0) Gecko/20120604 Firefox/13.0 SeaMonkey/2.10 Lightning/1.5.1');
INSERT INTO amz_ua (ID, UA) VALUES (328, 'Mozilla/5.0 (X11; Linux x86_64; rv:2.0.1) Gecko/20110609 Firefox/4.0.1 SeaMonkey/2.1');
INSERT INTO amz_ua (ID, UA) VALUES (329, 'Mozilla/5.0 (X11; Linux i686; rv:2.0.1) Gecko/20110608 Firefox/4.0.1 SeaMonkey/2.1 Lightning/1.0b4pre');
INSERT INTO amz_ua (ID, UA) VALUES (330, 'Mozilla/5.0 (X11; Linux i686; rv:2.0.1) Gecko/20110608 Firefox/4.0.1 SeaMonkey/2.1');
INSERT INTO amz_ua (ID, UA) VALUES (331, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:2.0.1) Gecko/20110608 SeaMonkey/2.1');
INSERT INTO amz_ua (ID, UA) VALUES (332, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:2.0.1) Gecko/20110608 Firefox/4.0.1 SeaMonkey/2.1');
INSERT INTO amz_ua (ID, UA) VALUES (333, 'Mozilla/5.0 (Windows NT 5.1; rv:2.0.1) Gecko/20110608 Firefox/4.0.1 SeaMonkey/2.1 Lightning/1.0b4pre');
INSERT INTO amz_ua (ID, UA) VALUES (334, 'Mozilla/5.0 (Windows NT 5.1; rv:2.0.1) Gecko/20110608 Firefox/4.0.1 SeaMonkey/2.1');
INSERT INTO amz_ua (ID, UA) VALUES (335, 'Mozilla/5.0 (Windows NT 5.1; rv:2.0.1) Gecko/20110511 Firefox/4.0.1 SeaMonkey/2.1');
INSERT INTO amz_ua (ID, UA) VALUES (336, 'Mozilla/5.0 (Windows NT 5.1; rv:1.9.2.8) Gecko/20110608 Firefox/3.6.8 Seamonkey/2.1');
INSERT INTO amz_ua (ID, UA) VALUES (337, 'Mozilla/5.0 (Windows NT 5.1 rv:2.0.1) Gecko/20110608 Firefox/4.0.1 SeaMonkey/2.1');
INSERT INTO amz_ua (ID, UA) VALUES (338, 'Mozilla/5.0 (Windows NT 5.0; rv:2.0.1) Gecko/20110608 Firefox/4.0.1 SeaMonkey/2.1');
INSERT INTO amz_ua (ID, UA) VALUES (339, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0.1) Gecko/20110608 SeaMonkey/2.1');
INSERT INTO amz_ua (ID, UA) VALUES (340, 'Mozilla/5.0 (Windows NT 6.1; rv:1.9.1.x) Gecko/20110606 SeaMonkey/2.x Firefox/5.0');
INSERT INTO amz_ua (ID, UA) VALUES (341, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.2pre) Gecko/20090723 SeaMonkey/2.0b2pre');
INSERT INTO amz_ua (ID, UA) VALUES (342, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1b3pre) Gecko/20090302 SeaMonkey/2.0b1pre');
INSERT INTO amz_ua (ID, UA) VALUES (343, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1b4pre) Gecko/20090405 SeaMonkey/2.0b1pre');
INSERT INTO amz_ua (ID, UA) VALUES (344, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; rv:1.9.1b4pre) Gecko/20090419 SeaMonkey/2.0b1pre');
INSERT INTO amz_ua (ID, UA) VALUES (345, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; ru; rv:1.9.1b4pre) Gecko/20090419 SeaMonkey/2.0b1pre');
INSERT INTO amz_ua (ID, UA) VALUES (346, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en; rv:1.9.1b4pre) Gecko/20090419 SeaMonkey/2.0b1pre');
INSERT INTO amz_ua (ID, UA) VALUES (347, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b5pre) Gecko/20090428 SeaMonkey/2.0b1pre');
INSERT INTO amz_ua (ID, UA) VALUES (348, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.9.1b4pre) Gecko/20090419 SeaMonkey/2.0b1pre');
INSERT INTO amz_ua (ID, UA) VALUES (349, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1.1pre) Gecko/20090717 SeaMonkey/2.0b1');
INSERT INTO amz_ua (ID, UA) VALUES (350, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1b3pre) Gecko/20081208 SeaMonkey/2.0a3pre');
INSERT INTO amz_ua (ID, UA) VALUES (351, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b3pre) Gecko/20081208 SeaMonkey/2.0a3pre');
INSERT INTO amz_ua (ID, UA) VALUES (352, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.9.2a1pre) Gecko/20081228 SeaMonkey/2.0a3pre');
INSERT INTO amz_ua (ID, UA) VALUES (353, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10.4; en-US; rv:1.9.1b3pre) Gecko/20090223 SeaMonkey/2.0a3');
INSERT INTO amz_ua (ID, UA) VALUES (354, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.1b3pre) Gecko/20090223 SeaMonkey/2.0a3');
INSERT INTO amz_ua (ID, UA) VALUES (355, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1b1pre) Gecko/20080926001251 SeaMonkey/2.0a2pre');
INSERT INTO amz_ua (ID, UA) VALUES (356, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; rv:1.9.1b3pre) Gecko/20081202 SeaMonkey/2.0a2');
INSERT INTO amz_ua (ID, UA) VALUES (357, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.1b3pre) Gecko/20081202 SeaMonkey/2.0a2');
INSERT INTO amz_ua (ID, UA) VALUES (358, 'Mozilla/5.0 (X11; U; Linux i686; rv:1.9.1a2pre) Gecko/20080824052448 SeaMonkey/2.0a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (359, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9pre) Gecko/2008061501 SeaMonkey/2.0a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (360, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; rv:1.9b3pre) Gecko/2008010602 SeaMonkey/2.0a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (361, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9a6pre) Gecko/20070625 SeaMonkey/2.0a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (362, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9a5pre) Gecko/20070529 SeaMonkey/2.0a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (363, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; fr; rv:1.9b4pre) Gecko/2008022502 SeaMonkey/2.0a1pre');
INSERT INTO amz_ua (ID, UA) VALUES (364, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.1b1pre) Gecko/20080925121544 SeaMonkey/2.0a1');
INSERT INTO amz_ua (ID, UA) VALUES (365, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.14) Gecko/20100930 SeaMonkey/2.0.9');
INSERT INTO amz_ua (ID, UA) VALUES (366, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.1.14) Gecko/20100930 SeaMonkey/2.0.9');
INSERT INTO amz_ua (ID, UA) VALUES (367, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.14) Gecko/20100930 SeaMonkey/2.0.9');
INSERT INTO amz_ua (ID, UA) VALUES (368, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.9.1.13) Gecko/20100914 Lightning/1.0b1 SeaMonkey/2.0.8');
INSERT INTO amz_ua (ID, UA) VALUES (369, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.13) Gecko/20100914 Mnenhy/0.8.3 SeaMonkey/2.0.8');
INSERT INTO amz_ua (ID, UA) VALUES (370, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.9.1.12) Gecko/20100825 SeaMonkey/2.0.7');
INSERT INTO amz_ua (ID, UA) VALUES (371, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-CA; rv:1.9.1.11pre) Gecko/20100630 SeaMonkey/2.0.6pre');
INSERT INTO amz_ua (ID, UA) VALUES (372, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-CA; rv:1.9.1.11pre) Gecko/20100629 SeaMonkey/2.0.6pre');
INSERT INTO amz_ua (ID, UA) VALUES (373, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-CA; rv:1.9.1.11pre) Gecko/20100627 SeaMonkey/2.0.6pre');
INSERT INTO amz_ua (ID, UA) VALUES (374, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-CA; rv:1.9.1.11pre) Gecko/20100625 SeaMonkey/2.0.6pre');
INSERT INTO amz_ua (ID, UA) VALUES (375, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-CA; rv:1.9.1.11pre) Gecko/20100623 SeaMonkey/2.0.6pre');
INSERT INTO amz_ua (ID, UA) VALUES (376, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-CA; rv:1.9.1.11pre) Gecko/20100622 SeaMonkey/2.0.6pre');
INSERT INTO amz_ua (ID, UA) VALUES (377, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-CA; rv:1.9.1.11pre) Gecko/20100617 SeaMonkey/2.0.6pre');
INSERT INTO amz_ua (ID, UA) VALUES (378, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-CA; rv:1.9.1.11pre) Gecko/20100605 SeaMonkey/2.0.6pre');
INSERT INTO amz_ua (ID, UA) VALUES (379, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.11pre) Gecko/20100515 SeaMonkey/2.0.6pre');
INSERT INTO amz_ua (ID, UA) VALUES (380, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.11pre) Gecko/20100508 SeaMonkey/2.0.6pre');
INSERT INTO amz_ua (ID, UA) VALUES (381, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.11) Gecko/20100721 SeaMonkey/2.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (382, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.11) Gecko/20100720 Fedora/2.0.6-1.fc12 SeaMonkey/2.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (383, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.11) Gecko/20100714 SUSE/2.0.6-2.1 SeaMonkey/2.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (384, 'Mozilla/5.0 (X11; U; Linux ia64; de; rv:1.9.1.11) Gecko/20100820 Lightning/1.0b2pre SeaMonkey/2.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (385, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.11) Gecko/20100722 SeaMonkey/2.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (386, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.11) Gecko/20100701 SeaMonkey/2.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (387, 'Mozilla/5.0 (Windows; U; Windows NT 9.0; en-US; rv:1.9.1.11) Gecko/20100701 SeaMonkey/2.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (388, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1.11) Gecko/20100701 SeaMonkey/2.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (389, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.11) Gecko/20100722 SeaMonkey/2.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (390, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.11) Gecko/20100701 SeaMonkey/2.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (391, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.1.11) Gecko/20100701 SeaMonkey/2.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (392, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.9.1.11) Gecko/20100701 SeaMonkey/2.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (393, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.10) Gecko/20100623 Fedora/2.0.5-1.fc12 SeaMonkey/2.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (394, 'Mozilla/5.0 (X11; U; Linux i686; de; rv:1.9.1.10) Gecko/20100504 Lightning/1.0b1 Mnenhy/0.8.2 SeaMonkey/2.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (395, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; ru; rv:1.9.1.10) Gecko/20100504 Lightning/1.0b1 SeaMonkey/2.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (396, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US; rv:1.9.1.10) Gecko/20100504 Lightning/1.0b1 SeaMonkey/2.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (397, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; de; rv:1.9.1.10) Gecko/20100504 SeaMonkey/2.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (398, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.9pre) Gecko/20100212 SeaMonkey/2.0.4pre');
INSERT INTO amz_ua (ID, UA) VALUES (399, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-CA; rv:1.9.1.9pre) Gecko/20100305 SeaMonkey/2.0.4pre');
INSERT INTO amz_ua (ID, UA) VALUES (400, 'Mozilla/5.0 (X11; U; Linux x86_64; fr; rv:1.9.1.9) Gecko/20100428 Lightning/1.0b1 SeaMonkey/2.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (401, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.9) Gecko/20100317 SUSE/2.0.4-3.2 Lightning/1.0b1 SeaMonkey/2.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (402, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.9) Gecko/20100318 Mandriva/2.0.4-69.1mib2010.0 SeaMonkey/2.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (403, 'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.9.1.9) Gecko/20100317 Firefox/3.5.9 Seamonkey/2.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (404, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 SeaMonkey/2.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (405, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.8) Gecko/20100206 SUSE/2.0.3-0.1.1 SeaMonkey/2.0.3');
INSERT INTO amz_ua (ID, UA) VALUES (406, 'Mozilla/5.0 (X11; U; Linux i686; nb-NO; rv:1.9.1.10) Gecko/20100623 Fedora/2.0.5-1.fc12 Fedora SeaMonkey/2.0.3');
INSERT INTO amz_ua (ID, UA) VALUES (407, 'Mozilla/5.0 (X11; U; Fedora 12 i686; nb-NO; rv:1.9.1.8) Gecko/20100205 SeaMonkey/2.0.3');
INSERT INTO amz_ua (ID, UA) VALUES (408, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; de; rv:1.9.1.8) Gecko/20100205 SeaMonkey/2.0.3');
INSERT INTO amz_ua (ID, UA) VALUES (409, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; de; rv:1.9.1.8) Gecko/20100205 SeaMonkey/2.0.3');
INSERT INTO amz_ua (ID, UA) VALUES (410, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US; rv:1.9.1.7) Gecko/20100104 SeaMonkey/2.0.2');
INSERT INTO amz_ua (ID, UA) VALUES (411, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.1.7) Gecko/20100104 SeaMonkey/2.0.2');
INSERT INTO amz_ua (ID, UA) VALUES (412, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.1.7) Gecko/20100104 Firefox/3.5.8 (SeaMonkey/2.0.2)');
INSERT INTO amz_ua (ID, UA) VALUES (413, 'Mozilla/5.0 (X11; U; Linux ia64; de; rv:1.9.1.19) Gecko/20110429 Lightning/1.0b2pre SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (414, 'Mozilla/5.0 (X11; U; Linux i686; nb-NO; rv:1.9.1.16) Gecko/20110420 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (415, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.19) Gecko/20110518 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (416, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.19) Gecko/20110429 Gentoo/2.0.14 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (417, 'Mozilla/5.0 (X11; U; Linux i686; de; rv:1.9.1.19) Gecko/20110420 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (418, 'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.9.1.19) Gecko/20110420 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (419, 'Mozilla/5.0 (X11; U; Fedora i686; en-US; rv:1.9.1.19) Gecko/20110429 Fedora/2.0.14-1.fc14 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (420, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; de; rv:1.9.1.19) Gecko/20110420 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (421, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1.19) Gecko/20110420 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (422, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.1.19) Gecko/20110420 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (423, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; es-AR; rv:1.9.1.19) Gecko/20110420 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (424, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.19) Gecko/20110420 Firefox/3.5.19 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (425, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.1.19) Gecko/20110420 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (426, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.9.1.19) Gecko/20110420 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (427, 'Mozilla/5.0 (Windows NT 5.0; rv:1.9.1.19) Gecko/20110420 Firefox/3.6 SeaMonkey/2.0.14');
INSERT INTO amz_ua (ID, UA) VALUES (428, 'Mozilla/5.0 (X11; U; Linux x86_64; fr; rv:1.9.1.18) Gecko/20110412 Lightning/1.0b1 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (429, 'Mozilla/5.0 (X11; U; Linux ia64; de; rv:1.9.1.18) Gecko/20110331 Lightning/1.0b2pre SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (430, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.18) Gecko/20110320 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (431, 'Mozilla/5.0 (X11; U; Linux i686; de; rv:1.9.1.18) Gecko/20110320 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (432, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; nl; rv:1.9.1.18) Gecko/20110320 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (433, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; hu; rv:1.9.1.18) Gecko/20110320 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (434, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.18) Gecko/20110320 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (435, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; de; rv:1.9.1.18) Gecko/20110320 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (436, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US; rv:1.9.1.18) Gecko/20110320 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (437, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.1.18) Gecko/20110320 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (438, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.18) Gecko/20110320 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (439, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.18) Gecko/20110320 Lightning/1.0b1 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (440, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.1.18) Gecko/20110320 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (441, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.1.18) Gecko/20110320 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (442, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.1.18) Gecko/20110320 SeaMonkey/2.0.13');
INSERT INTO amz_ua (ID, UA) VALUES (443, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.17pre) Gecko/20101211 SeaMonkey/2.0.12pre');
INSERT INTO amz_ua (ID, UA) VALUES (444, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.17) Gecko/20110303 SeaMonkey/2.0.12');
INSERT INTO amz_ua (ID, UA) VALUES (445, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.17) Gecko/20110121 SUSE/2.0.12-0.2.1 SeaMonkey/2.0.12');
INSERT INTO amz_ua (ID, UA) VALUES (446, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.17) Gecko/20110309 Lightning/1.0b2pre SeaMonkey/2.0.12');
INSERT INTO amz_ua (ID, UA) VALUES (447, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.17) Gecko/20110303 SeaMonkey/2.0.12');
INSERT INTO amz_ua (ID, UA) VALUES (448, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.17) Gecko/20110123 SeaMonkey/2.0.12');
INSERT INTO amz_ua (ID, UA) VALUES (449, 'Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.17) Gecko/20110123 SeaMonkey/2.0.12');
INSERT INTO amz_ua (ID, UA) VALUES (450, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB; rv:1.9.1.17) Gecko/20110123 SeaMonkey/2.0.12');
INSERT INTO amz_ua (ID, UA) VALUES (451, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; fr; rv:1.9.1.17) Gecko/20110123 SeaMonkey/2.0.12');
INSERT INTO amz_ua (ID, UA) VALUES (452, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ja; rv:1.9.1.17) Gecko/20110123 SeaMonkey/2.0.12');
INSERT INTO amz_ua (ID, UA) VALUES (453, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.1.17) Gecko/20110123 SeaMonkey/2.0.12');
INSERT INTO amz_ua (ID, UA) VALUES (454, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.9.1.17) Gecko/20110123 SeaMonkey/2.0.12');
INSERT INTO amz_ua (ID, UA) VALUES (455, 'Mozilla/5.0 (X11; U; Linux x86_64; fr; rv:1.9.1.16) Gecko/20101206 Lightning/1.0b1 SeaMonkey/2.0.11');
INSERT INTO amz_ua (ID, UA) VALUES (456, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.16) Gecko/20101123 SeaMonkey/2.0.11');
INSERT INTO amz_ua (ID, UA) VALUES (457, 'Mozilla/5.0 (X11; U; Linux i686; de-DE; rv:1.9.1.16) Gecko/20101124 SUSE/2.0.11-2.2 SeaMonkey/2.0.11');
INSERT INTO amz_ua (ID, UA) VALUES (458, 'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.9.1.16) Gecko/20101123 SeaMonkey/2.0.11');
INSERT INTO amz_ua (ID, UA) VALUES (459, 'Mozilla/5.0 (X11; U; FreeBSD i386; en-US; rv:1.9.1.16) Gecko/20110227 SeaMonkey/2.0.11');
INSERT INTO amz_ua (ID, UA) VALUES (460, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1.16) Gecko/20101123 SeaMonkey/2.0.11');
INSERT INTO amz_ua (ID, UA) VALUES (461, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; de; rv:1.9.1.16) Gecko/20101123 SeaMonkey/2.0.11');
INSERT INTO amz_ua (ID, UA) VALUES (462, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; de; rv:1.9.1.16) Gecko/20101123 SeaMonkey/2.0.11');
INSERT INTO amz_ua (ID, UA) VALUES (463, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.1.16) Gecko/20101123 SeaMonkey/2.0.11');
INSERT INTO amz_ua (ID, UA) VALUES (464, 'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.9.1.15) Gecko/20101027 SeaMonkey/2.0.10');
INSERT INTO amz_ua (ID, UA) VALUES (465, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; de; rv:1.9.1.15) Gecko/20101027 SeaMonkey/2.0.10');
INSERT INTO amz_ua (ID, UA) VALUES (466, 'Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.6) Gecko/20091210 SUSE/2.0.1-1.1.1 SeaMonkey/2.0.1');
INSERT INTO amz_ua (ID, UA) VALUES (467, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.6) Gecko/20091206 Firefox/2.0.0.20 SeaMonkey/2.0.1');
INSERT INTO amz_ua (ID, UA) VALUES (468, 'Mozilla/5.0 (Windows; U; Windows NT 6.2; en-US; rv:1.9.1.4) Gecko/20091104 SeaMonkey/2.0');
INSERT INTO amz_ua (ID, UA) VALUES (469, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1b3pre) Gecko/20081208 SeaMonkey/2.0');
INSERT INTO amz_ua (ID, UA) VALUES (470, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; pl-PL; rv:1.9a1) Gecko/20060812 SeaMonkey/1.5a');
INSERT INTO amz_ua (ID, UA) VALUES (471, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9a5pre) Gecko/20070527 SeaMonkey/1.5a');
INSERT INTO amz_ua (ID, UA) VALUES (472, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9a4pre) Gecko/20070404 SeaMonkey/1.5a');
INSERT INTO amz_ua (ID, UA) VALUES (473, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9a3pre) Gecko/20070317 SeaMonkey/1.5a');
INSERT INTO amz_ua (ID, UA) VALUES (474, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9a2pre) Gecko/20070130 SeaMonkey/1.5a');
INSERT INTO amz_ua (ID, UA) VALUES (475, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9a2pre) Gecko/20070109 SeaMonkey/1.5a');
INSERT INTO amz_ua (ID, UA) VALUES (476, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9a1) Gecko/20060906 SeaMonkey/1.5a');
INSERT INTO amz_ua (ID, UA) VALUES (477, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9a1) Gecko/20060520 SeaMonkey/1.5a');
INSERT INTO amz_ua (ID, UA) VALUES (478, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.9a1) Gecko/20060206 SeaMonkey/1.5a');
INSERT INTO amz_ua (ID, UA) VALUES (479, 'Mozilla/5.0 (OS/2; U; Warp 4.5; en-US; rv:1.9a1) Gecko/20051119 MultiZilla/1.8.1.0s SeaMonkey/1.5a');
INSERT INTO amz_ua (ID, UA) VALUES (480, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.9a1) Gecko/20060707 SeaMonkey/1.5a');
INSERT INTO amz_ua (ID, UA) VALUES (481, 'Mozilla/5.0 (BeOS; U; BeOS BePC; en-US; rv:1.9a1) Gecko/20060702 SeaMonkey/1.5a');
INSERT INTO amz_ua (ID, UA) VALUES (482, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1) Gecko/20061101 SeaMonkey/1.1b');
INSERT INTO amz_ua (ID, UA) VALUES (483, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8) Gecko/20060301 SeaMonkey/1.1a Mnenhy/0.7.3.0');
INSERT INTO amz_ua (ID, UA) VALUES (484, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1b2) Gecko/20060821 SeaMonkey/1.1a');
INSERT INTO amz_ua (ID, UA) VALUES (485, 'Mozilla/5.0 (X11; U; Linux x86_64; fr-FR; rv:1.8.1.13) Gecko/20080313 SeaMonkey/1.1.9 (Ubuntu-1.1.9+nobinonly-0ubuntu1)');
INSERT INTO amz_ua (ID, UA) VALUES (486, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.13) Gecko/20080313 SeaMonkey/1.1.9 (Ubuntu-1.1.9+nobinonly-0ubuntu1)');
INSERT INTO amz_ua (ID, UA) VALUES (487, 'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.8.1.13) Gecko/20080313 SeaMonkey/1.1.9');
INSERT INTO amz_ua (ID, UA) VALUES (488, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; PL; rv:1.8.1.13) Gecko/20080313 SeaMonkey/1.1.9');
INSERT INTO amz_ua (ID, UA) VALUES (489, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; pl-PL; rv:1.8.1.13) Gecko/20080313 SeaMonkey/1.1.9');
INSERT INTO amz_ua (ID, UA) VALUES (490, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.8.1.13) Gecko/20080313 SeaMonkey/1.1.9');
INSERT INTO amz_ua (ID, UA) VALUES (491, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.13) Gecko/20080313 SeaMonkey/1.1.9');
INSERT INTO amz_ua (ID, UA) VALUES (492, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.13) Gecko/20080313 SeaMonkey/1.1.9');
INSERT INTO amz_ua (ID, UA) VALUES (493, 'Mozilla/5.0 (X11; U; Linux x86_64; fr-FR; rv:1.8.1.12) Gecko/20080209 SeaMonkey/1.1.8');
INSERT INTO amz_ua (ID, UA) VALUES (494, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.8.1.12) Gecko/20080209 SeaMonkey/1.1.8');
INSERT INTO amz_ua (ID, UA) VALUES (495, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.12) Gecko/20080208 SeaMonkey/1.1.8');
INSERT INTO amz_ua (ID, UA) VALUES (496, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.12) Gecko/20080201 SeaMonkey/1.1.8');
INSERT INTO amz_ua (ID, UA) VALUES (497, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070802 Firefox/2.0.0.11 SeaMonkey/1.1.8');
INSERT INTO amz_ua (ID, UA) VALUES (498, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070802 Firefox/2.0.0.11 SeaMonkey/1.1.8');
INSERT INTO amz_ua (ID, UA) VALUES (499, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.12) Gecko/20080201 SeaMonkey/1.1.8');
INSERT INTO amz_ua (ID, UA) VALUES (500, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.12) Gecko/20080201 MultiZilla/1.8.3.4e SeaMonkey/1.1.8');
INSERT INTO amz_ua (ID, UA) VALUES (501, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; fr-FR; rv:1.8.1.12) Gecko/20080201 SeaMonkey/1.1.8');
INSERT INTO amz_ua (ID, UA) VALUES (502, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.12) Gecko/20080201 SeaMonkey/1.1.8');
INSERT INTO amz_ua (ID, UA) VALUES (503, 'Mozilla/5.0 (BeOS; U; Haiku BePC; en-US; rv:1.8.1.10pre) Gecko/20080112 SeaMonkey/1.1.7pre');
INSERT INTO amz_ua (ID, UA) VALUES (504, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.1.11) Gecko/20071128 SeaMonkey/1.1.7');
INSERT INTO amz_ua (ID, UA) VALUES (505, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.12) Gecko/20080201 SeaMonkey/1.1.7');
INSERT INTO amz_ua (ID, UA) VALUES (506, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.11) Gecko/20071128 SeaMonkey/1.1.7 Mnenhy/0.7.5.666');
INSERT INTO amz_ua (ID, UA) VALUES (507, 'Mozilla/5.0 (X11; U; Linux i686; de-AT; rv:1.8.1.9) Gecko/20071030 SeaMonkey/1.1.6');
INSERT INTO amz_ua (ID, UA) VALUES (508, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; pl-PL; rv:1.8.1.9) Gecko/20071030 SeaMonkey/1.1.6 Mnenhy/0.7.5.666');
INSERT INTO amz_ua (ID, UA) VALUES (509, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8.1.9) Gecko/20071030 SeaMonkey/1.1.6');
INSERT INTO amz_ua (ID, UA) VALUES (510, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.9) Gecko/20071030 SeaMonkey/1.1.6');
INSERT INTO amz_ua (ID, UA) VALUES (511, 'Mozilla/5.0 (Windows; U; WinNT3.51; en-US; rv:1.8.1.8) Gecko/20071009 SeaMonkey/1.1.5');
INSERT INTO amz_ua (ID, UA) VALUES (512, 'Mozilla/5.0 (X11; U; Linux x86_64; fr-FR; rv:1.8.1.6) Gecko/20070803 SeaMonkey/1.1.4');
INSERT INTO amz_ua (ID, UA) VALUES (513, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.6) Gecko/20070802 SeaMonkey/1.1.4 Mnenhy/0.7.5.666');
INSERT INTO amz_ua (ID, UA) VALUES (514, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070802 SeaMonkey/1.1.4');
INSERT INTO amz_ua (ID, UA) VALUES (515, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.8.1.6) Gecko/20070802 SeaMonkey/1.1.4');
INSERT INTO amz_ua (ID, UA) VALUES (516, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.6) Gecko/20070802 SeaMonkey/1.1.4');
INSERT INTO amz_ua (ID, UA) VALUES (517, 'Mozilla/5.0 (Windows; U; Win98; de-AT; rv:1.8.1.6) Gecko/20070802 SeaMonkey/1.1.4');
INSERT INTO amz_ua (ID, UA) VALUES (518, 'Mozilla/5.0 (Windows; U; Win 9x 4.90; en-GB; rv:1.8.1.6) Gecko/20070802 SeaMonkey/1.1.4');
INSERT INTO amz_ua (ID, UA) VALUES (519, 'Mozilla/5.0 (X11; U; Linux i686; de-AT; rv:1.8.1.5) Gecko/20070716 SeaMonkey/1.1.3');
INSERT INTO amz_ua (ID, UA) VALUES (520, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; es-ES; rv:1.8.1.5) Gecko/20070716 SeaMonkey/1.1.3');
INSERT INTO amz_ua (ID, UA) VALUES (521, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.5) Gecko/20070716 SeaMonkey/1.1.3');
INSERT INTO amz_ua (ID, UA) VALUES (522, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.8.1.5) Gecko/20070716 SeaMonkey/1.1.3');
INSERT INTO amz_ua (ID, UA) VALUES (523, 'Mozilla/5.0 (X11; U; Linux x86_64; fr-FR; rv:1.8.1.4) Gecko/20070528 SeaMonkey/1.1.2');
INSERT INTO amz_ua (ID, UA) VALUES (524, 'Mozilla/5.0 (X11; U; Linux i686; pt-BR; rv:1.8.1.4) Gecko/20070509 SeaMonkey/1.1.2');
INSERT INTO amz_ua (ID, UA) VALUES (525, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.4) Gecko/20070509 SeaMonkey/1.1.2');
INSERT INTO amz_ua (ID, UA) VALUES (526, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.8.1.4) Gecko/20070509 SeaMonkey/1.1.2');
INSERT INTO amz_ua (ID, UA) VALUES (527, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8.1.4) Gecko/20070509 SeaMonkey/1.1.2');
INSERT INTO amz_ua (ID, UA) VALUES (528, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; de-AT; rv:1.8.1.4) Gecko/20070509 SeaMonkey/1.1.2');
INSERT INTO amz_ua (ID, UA) VALUES (529, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.4) Gecko/20070509 SeaMonkey/1.1.2');
INSERT INTO amz_ua (ID, UA) VALUES (530, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.24) Gecko/20100228 SeaMonkey/1.1.19');
INSERT INTO amz_ua (ID, UA) VALUES (531, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.24) Gecko/20100301 SeaMonkey/1.1.19');
INSERT INTO amz_ua (ID, UA) VALUES (532, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.23) Gecko/20090908 Fedora/1.1.18-1.fc10 SeaMonkey/1.1.18');
INSERT INTO amz_ua (ID, UA) VALUES (533, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.23) Gecko/20090907 SeaMonkey/1.1.18');
INSERT INTO amz_ua (ID, UA) VALUES (534, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-DE; rv:1.8.1.23) Gecko/20090825 SeaMonkey/1.1.18');
INSERT INTO amz_ua (ID, UA) VALUES (535, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.23) Gecko/20090825 MultiZilla/1.8.3.4e SeaMonkey/1.1.18');
INSERT INTO amz_ua (ID, UA) VALUES (536, 'Mozilla/5.0 (Windows; U; Win 9x 4.90; de-AT; rv:1.8.1.23) Gecko/20090825 SeaMonkey/1.1.18');
INSERT INTO amz_ua (ID, UA) VALUES (537, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.23) Gecko/20090823 SeaMonkey/1.1.18');
INSERT INTO amz_ua (ID, UA) VALUES (538, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.22) Gecko/20090708 SeaMonkey/1.1.17');
INSERT INTO amz_ua (ID, UA) VALUES (539, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.22) Gecko/20090624 SeaMonkey/1.1.17');
INSERT INTO amz_ua (ID, UA) VALUES (540, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17 (Ubuntu-1.1.17+nobinonly-0ubuntu1)');
INSERT INTO amz_ua (ID, UA) VALUES (541, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; it-IT; rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17');
INSERT INTO amz_ua (ID, UA) VALUES (542, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17 Mnenhy/0.7.6.0');
INSERT INTO amz_ua (ID, UA) VALUES (543, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17 Firefox/3.0.10');
INSERT INTO amz_ua (ID, UA) VALUES (544, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; de-AT; rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17');
INSERT INTO amz_ua (ID, UA) VALUES (545, 'Mozilla/5.0 (Windows; U; Win 9x 4.90; en-US; rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17');
INSERT INTO amz_ua (ID, UA) VALUES (546, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17');
INSERT INTO amz_ua (ID, UA) VALUES (547, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.8.1.21) Gecko/20090413 SeaMonkey/1.1.16');
INSERT INTO amz_ua (ID, UA) VALUES (548, 'Mozilla/5.0 (X11; U; FreeBSD amd64; en-US; rv:1.8.1.21) Gecko/20090424 SeaMonkey/1.1.16');
INSERT INTO amz_ua (ID, UA) VALUES (549, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.1.21) Gecko/20090403 SeaMonkey/1.1.16');
INSERT INTO amz_ua (ID, UA) VALUES (550, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; de-AT; rv:1.8.1.21) Gecko/20090403 SeaMonkey/1.1.16');
INSERT INTO amz_ua (ID, UA) VALUES (551, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr-FR; rv:1.8.1.21) Gecko/20090403 SeaMonkey/1.1.16');
INSERT INTO amz_ua (ID, UA) VALUES (552, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20090403 SeaMonkey/1.1.16 Mnenhy/0.7.5.666');
INSERT INTO amz_ua (ID, UA) VALUES (553, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20090403 SeaMonkey/1.1.16 Mnenhy/0.7.5.0');
INSERT INTO amz_ua (ID, UA) VALUES (554, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20090403 SeaMonkey/1.1.16');
INSERT INTO amz_ua (ID, UA) VALUES (555, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20090403 MultiZilla/1.8.3.4e SeaMonkey/1.1.16');
INSERT INTO amz_ua (ID, UA) VALUES (556, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8.1.21) Gecko/20090403 SeaMonkey/1.1.16');
INSERT INTO amz_ua (ID, UA) VALUES (557, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.8.1.21) Gecko/20090328 Fedora/1.1.15-3.fc10 SeaMonkey/1.1.15');
INSERT INTO amz_ua (ID, UA) VALUES (558, 'Mozilla/5.0 (X11; U; Linux i686; ja-JP; rv:1.8.1.21) Gecko/20090322 SeaMonkey/1.1.15');
INSERT INTO amz_ua (ID, UA) VALUES (559, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.21) Gecko/20090322 SeaMonkey/1.1.15');
INSERT INTO amz_ua (ID, UA) VALUES (560, 'Mozilla/5.0 (X11; U; Linux i686; de-DE; rv:1.8.1.21) Gecko/20090322 SeaMonkey/1.1.15');
INSERT INTO amz_ua (ID, UA) VALUES (561, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.15');
INSERT INTO amz_ua (ID, UA) VALUES (562, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.15 Mnenhy/0.7.6.0');
INSERT INTO amz_ua (ID, UA) VALUES (563, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.15 Mnenhy/0.7.5.666');
INSERT INTO amz_ua (ID, UA) VALUES (564, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.15');
INSERT INTO amz_ua (ID, UA) VALUES (565, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; de-AT; rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.15 Mnenhy/0.7.6.0');
INSERT INTO amz_ua (ID, UA) VALUES (566, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; de-AT; rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.15');
INSERT INTO amz_ua (ID, UA) VALUES (567, 'Mozilla/5.0 (AmigaOS; U; AmigaOS 1.3; en-US; rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.15');
INSERT INTO amz_ua (ID, UA) VALUES (568, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.19) Gecko/20081221 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (569, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.19) Gecko/20081218 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (570, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.19) Gecko/20081216 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (571, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (572, 'Mozilla/5.0 (X11; U; Linux i686; de-AT; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14 Mnenhy/0.7.6.0');
INSERT INTO amz_ua (ID, UA) VALUES (573, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (574, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (575, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; es-ES; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (576, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (577, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14 Mnenhy/0.7.6.0');
INSERT INTO amz_ua (ID, UA) VALUES (578, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14 Mnenhy/0.7.5.666');
INSERT INTO amz_ua (ID, UA) VALUES (579, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (580, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.19) Gecko/20081204 MultiZilla/1.8.3.5c SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (581, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (582, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (583, 'Mozilla/5.0 (Windows; U; Win 9x 4.90; en-US; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (584, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (585, 'Mozilla/5.0 (AmigaOS; U; AmigaOS 1.3; en; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (586, 'Mozilla/5.0 (Amiga; U; AmigaOS 1.3; en; rv:1.8.1.19) Gecko/20081204 SeaMonkey/1.1.14');
INSERT INTO amz_ua (ID, UA) VALUES (587, 'Mozilla/5.0 (X11; U; Linux x86_64; es-ES; rv:1.8.1.18) Gecko/20081112 Fedora/1.1.13-1.fc10 SeaMonkey/1.1.13');
INSERT INTO amz_ua (ID, UA) VALUES (588, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.8.1.18) Gecko/20081110 SUSE/1.1.13-1.10 SeaMonkey/1.1.13');
INSERT INTO amz_ua (ID, UA) VALUES (589, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.18) Gecko/20081113 SeaMonkey/1.1.13');
INSERT INTO amz_ua (ID, UA) VALUES (590, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.18) Gecko/20081113 Fedora/1.1.13-1.fc8 SeaMonkey/1.1.13');
INSERT INTO amz_ua (ID, UA) VALUES (591, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.18) Gecko/20081030 SeaMonkey/1.1.13 (Ubuntu-1.1.13+nobinonly-0ubuntu1)');
INSERT INTO amz_ua (ID, UA) VALUES (592, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.1.18) Gecko/20081031 SeaMonkey/1.1.13');
INSERT INTO amz_ua (ID, UA) VALUES (593, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; de-AT; rv:1.8.1.18) Gecko/20081031 SeaMonkey/1.1.13');
INSERT INTO amz_ua (ID, UA) VALUES (594, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; PL; rv:1.8.1.18) Gecko/20081031 SeaMonkey/1.1.13');
INSERT INTO amz_ua (ID, UA) VALUES (595, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; es-ES; rv:1.8.1.18) Gecko/20081031 SeaMonkey/1.1.13');
INSERT INTO amz_ua (ID, UA) VALUES (596, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.18) Gecko/20081031 SeaMonkey/1.1.13');
INSERT INTO amz_ua (ID, UA) VALUES (597, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.8.1.18) Gecko/20081031 SeaMonkey/1.1.13');
INSERT INTO amz_ua (ID, UA) VALUES (598, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; es-ES; rv:1.8.1.18) Gecko/20081031 SeaMonkey/1.1.13');
INSERT INTO amz_ua (ID, UA) VALUES (599, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.8.1.17) Gecko/20080922 SUSE/1.1.12-0.1 SeaMonkey/1.1.12');
INSERT INTO amz_ua (ID, UA) VALUES (600, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.8.1.17) Gecko/20080829 SeaMonkey/1.1.12 (Ubuntu-1.1.12+nobinonly-0ubuntu1)');
INSERT INTO amz_ua (ID, UA) VALUES (601, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.17) Gecko/20080829 SeaMonkey/1.1.12 (Ubuntu-1.1.12+nobinonly-0ubuntu1)');
INSERT INTO amz_ua (ID, UA) VALUES (602, 'Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.8.1.17) Gecko/20080925 Fedora/1.1.12-1.fc9 SeaMonkey/1.1.12');
INSERT INTO amz_ua (ID, UA) VALUES (603, 'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.8.1.17) Gecko/20080829 SeaMonkey/1.1.12');
INSERT INTO amz_ua (ID, UA) VALUES (604, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.17) Gecko/20090224 SeaMonkey/1.1.12');
INSERT INTO amz_ua (ID, UA) VALUES (605, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.17) Gecko/20080829 SeaMonkey/1.1.12 Mnenhy/0.7.5.666');
INSERT INTO amz_ua (ID, UA) VALUES (606, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.8.1.17) Gecko/20080829 SeaMonkey/1.1.12');
INSERT INTO amz_ua (ID, UA) VALUES (607, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8.1.17) Gecko/20080829 SeaMonkey/1.1.12');
INSERT INTO amz_ua (ID, UA) VALUES (608, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.17) Gecko/20080829 SeaMonkey/1.1.12');
INSERT INTO amz_ua (ID, UA) VALUES (609, 'Mozilla/5.0 (X11; U; Linux x86_64; ru-RU; rv:1.8.1.16) Gecko/20080716 Fedora/1.1.11-1.fc9 SeaMonkey/1.1.11');
INSERT INTO amz_ua (ID, UA) VALUES (610, 'Mozilla/5.0 (X11; U; Linux i686; fr; rv:1.8.1.16) Gecko/20080716 SeaMonkey/1.1.11');
INSERT INTO amz_ua (ID, UA) VALUES (611, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.16) Gecko/20080716 SeaMonkey/1.1.11');
INSERT INTO amz_ua (ID, UA) VALUES (612, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.16) Gecko/20080716 Fedora/1.1.11-1.fc8 SeaMonkey/1.1.11');
INSERT INTO amz_ua (ID, UA) VALUES (613, 'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.8.1.16) Gecko/20080702 SeaMonkey/1.1.11');
INSERT INTO amz_ua (ID, UA) VALUES (614, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; de-AT; rv:1.8.1.16) Gecko/20080702 SeaMonkey/1.1.11');
INSERT INTO amz_ua (ID, UA) VALUES (615, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; pl-PL; rv:1.8.1.16) Gecko/20080702 SeaMonkey/1.1.11 Mnenhy/0.7.5.0');
INSERT INTO amz_ua (ID, UA) VALUES (616, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.16) Gecko/20080702 SeaMonkey/1.1.11');
INSERT INTO amz_ua (ID, UA) VALUES (617, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.16) Gecko/20080702 MultiZilla/1.8.3.4e SeaMonkey/1.1.11');
INSERT INTO amz_ua (ID, UA) VALUES (618, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; de-AT; rv:1.8.1.16) Gecko/20080702 SeaMonkey/1.1.11 Mnenhy/0.7.5.0');
INSERT INTO amz_ua (ID, UA) VALUES (619, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; de-AT; rv:1.8.1.16) Gecko/20080702 SeaMonkey/1.1.11');
INSERT INTO amz_ua (ID, UA) VALUES (620, 'Mozilla/5.0 (Windows; U; Win 9x 4.90; en-US; rv:1.8.1.16) Gecko/20080702 SeaMonkey/1.1.11');
INSERT INTO amz_ua (ID, UA) VALUES (621, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.16) Gecko/20080703 SeaMonkey/1.1.11');
INSERT INTO amz_ua (ID, UA) VALUES (622, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; PL; rv:1.8.1.15) Gecko/20080621 SeaMonkey/1.1.10');
INSERT INTO amz_ua (ID, UA) VALUES (623, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.15) Gecko/20080621 SeaMonkey/1.1.10 Mnenhy/0.7.5.0');
INSERT INTO amz_ua (ID, UA) VALUES (624, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.15) Gecko/20080621 SeaMonkey/1.1.10');
INSERT INTO amz_ua (ID, UA) VALUES (625, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.8.1.15) Gecko/20080621 SeaMonkey/1.1.10');
INSERT INTO amz_ua (ID, UA) VALUES (626, 'Mozilla/5.0 (OS/2; U; Warp 4.5; en-US; rv:1.8.1.3pre) Gecko/20070307 SeaMonkey/1.1.1+');
INSERT INTO amz_ua (ID, UA) VALUES (627, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.8.1.2) Gecko/20070224 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (628, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.2) Gecko/20070309 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (629, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.2) Gecko/20070221 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (630, 'Mozilla/5.0 (X11; U; Linux i686 (x86_64); fr; rv:1.8.1.2) Gecko/20070221 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (631, 'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.8.1.2) Gecko/20070221 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (632, 'Mozilla/5.0 (X11; U; Linux i586; en-US; rv:1.8.1.2) Gecko/20070227 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (633, 'Mozilla/5.0 (X11; U; FreeBSD i386; en-US; rv:1.8.1.2) Gecko/20070303 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (634, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; PL; rv:1.8.1.2) Gecko/20070222 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (635, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.8.1.2) Gecko/20070222 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (636, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.2) Gecko/20070222 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (637, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.8.1.2) Gecko/20070222 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (638, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; fr-FR; rv:1.8.1.2) Gecko/20070222 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (639, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8.1.2) Gecko/20070222 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (640, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.2) Gecko/20070222 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (641, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.1.2) Gecko/20070221 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (642, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.2) Gecko/20070221 SeaMonkey/1.1.1');
INSERT INTO amz_ua (ID, UA) VALUES (643, 'Firefox/2.0b1 SeaMonkey/1.1.1 Mozilla/5.0 Gecko/20061101');
INSERT INTO amz_ua (ID, UA) VALUES (644, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.8.1.2pre) Gecko/20070111 SeaMonkey/1.1');
INSERT INTO amz_ua (ID, UA) VALUES (645, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr-FR; rv:1.8.1.2pre) Gecko/20070111 SeaMonkey/1.1');
INSERT INTO amz_ua (ID, UA) VALUES (646, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.2pre) Gecko/20070111 SeaMonkey/1.1 Mnenhy/0.7.4.10005');
INSERT INTO amz_ua (ID, UA) VALUES (647, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.2pre) Gecko/20070111 SeaMonkey/1.1');
INSERT INTO amz_ua (ID, UA) VALUES (648, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; fr-FR; rv:1.8.1.2pre) Gecko/20070111 SeaMonkey/1.1');
INSERT INTO amz_ua (ID, UA) VALUES (649, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8.1.2pre) Gecko/20070111 SeaMonkey/1.1');
INSERT INTO amz_ua (ID, UA) VALUES (650, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.2pre) Gecko/20070111 SeaMonkey/1.1');
INSERT INTO amz_ua (ID, UA) VALUES (651, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8) Gecko/20051219 SeaMonkey/1.0b');
INSERT INTO amz_ua (ID, UA) VALUES (652, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20060102 SeaMonkey/1.0b');
INSERT INTO amz_ua (ID, UA) VALUES (653, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20051219 SeaMonkey/1.0b');
INSERT INTO amz_ua (ID, UA) VALUES (654, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.8) Gecko/20051219 SeaMonkey/1.0b');
INSERT INTO amz_ua (ID, UA) VALUES (655, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; de-AT; rv:1.8) Gecko/20051219 SeaMonkey/1.0b');
INSERT INTO amz_ua (ID, UA) VALUES (656, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8b4) Gecko/20050910 SeaMonkey/1.0a');
INSERT INTO amz_ua (ID, UA) VALUES (657, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8b4) Gecko/20050910 SeaMonkey/1.0a');
INSERT INTO amz_ua (ID, UA) VALUES (658, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.8.0.14eol) Gecko/20120628 CentOS/1.0.9-40.el4.centos SeaMonkey/1.0.9');
INSERT INTO amz_ua (ID, UA) VALUES (659, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.14eol) Gecko/20101004 Red Hat/1.0.9-64.el4 SeaMonkey/1.0.9');
INSERT INTO amz_ua (ID, UA) VALUES (660, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.14eol) Gecko/20090422 CentOS/1.0.9-0.37.el3.centos3 SeaMonkey/1.0.9');
INSERT INTO amz_ua (ID, UA) VALUES (661, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.13pre) Gecko/20070717 Red Hat/1.0.9-4.el4 SeaMonkey/1.0.9');
INSERT INTO amz_ua (ID, UA) VALUES (662, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.10) Gecko/20070306 SeaMonkey/1.0.8');
INSERT INTO amz_ua (ID, UA) VALUES (663, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.10) Gecko/20070301 SUSE/1.8_seamonkey_1.0.8-0.1 SeaMonkey/1.0.8');
INSERT INTO amz_ua (ID, UA) VALUES (664, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.10) Gecko/20070223 Fedora/1.0.8-0.5.1.fc5 SeaMonkey/1.0.8');
INSERT INTO amz_ua (ID, UA) VALUES (665, 'Mozilla/5.0 (X11; U; Linux i686; de-AT; rv:1.8.0.10) Gecko/20070306 SeaMonkey/1.0.8');
INSERT INTO amz_ua (ID, UA) VALUES (666, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.10) Gecko/20070306 SeaMonkey/1.0.8');
INSERT INTO amz_ua (ID, UA) VALUES (667, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.9) Gecko/20070104 Red Hat/1.0.7-0.6.fc5 SeaMonkey/1.0.7');
INSERT INTO amz_ua (ID, UA) VALUES (668, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.9) Gecko/20061211 SeaMonkey/1.0.7');
INSERT INTO amz_ua (ID, UA) VALUES (669, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.9) Gecko/20061211 SeaMonkey/1.0.7');
INSERT INTO amz_ua (ID, UA) VALUES (670, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.9) Gecko/20061211 SeaMonkey/1.0.7');
INSERT INTO amz_ua (ID, UA) VALUES (671, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.0.9) Gecko/20061211 SeaMonkey/1.0.7');
INSERT INTO amz_ua (ID, UA) VALUES (672, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.8.0.8) Gecko/20061109 SeaMonkey/1.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (673, 'Mozilla/5.0 (X11; U; Linux i686; fr-FR; rv:1.8.0.8) Gecko/20061029 SeaMonkey/1.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (674, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.8) Gecko/20061105 Red Hat/1.0.6-0.1.el3 SeaMonkey/1.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (675, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.8) Gecko/20061030 SeaMonkey/1.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (676, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.8) Gecko/20061030 MultiZilla/1.8.3.0a SeaMonkey/1.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (677, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8.0.8) Gecko/20061030 SeaMonkey/1.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (678, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; de-AT; rv:1.8.0.8) Gecko/20061030 SeaMonkey/1.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (679, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.8) Gecko/20061030 SeaMonkey/1.0.6');
INSERT INTO amz_ua (ID, UA) VALUES (680, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.7) Gecko/20060914 SeaMonkey/1.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (681, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.7) Gecko/20060910 SeaMonkey/1.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (682, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.8.0.7) Gecko/20060910 SeaMonkey/1.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (683, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; pl-PL; rv:1.8.0.7) Gecko/20060910 SeaMonkey/1.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (684, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.7) Gecko/20060910 SeaMonkey/1.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (685, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.7) Gecko/20060910 MultiZilla/1.7.9.0a SeaMonkey/1.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (686, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.7) Gecko/20060910 SeaMonkey/1.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (687, 'Mozilla/5.0 (OS/2; U; Warp 4.5; en-US; rv:1.8.0.7) Gecko/20060910 MultiZilla/1.8.2.0i SeaMonkey/1.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (688, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.0.7) Gecko/20060910 SeaMonkey/1.0.5');
INSERT INTO amz_ua (ID, UA) VALUES (689, 'Mozilla/5.0 (X11; U; Linux ppc; en-US; rv:1.8.0.6) Gecko/20060815 SeaMonkey/1.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (690, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.6) Gecko/20060803 SeaMonkey/1.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (691, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.6) Gecko/20060730 SeaMonkey/1.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (692, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.6) Gecko/20060729 SeaMonkey/1.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (693, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8.0.6) Gecko/20060729 SeaMonkey/1.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (694, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.6) Gecko/20060729 SeaMonkey/1.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (695, 'Mozilla/5.0 (OS/2; U; Warp 4.5; en-US; rv:1.8.0.6) Gecko/20060730 MultiZilla/1.8.2.0i SeaMonkey/1.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (696, 'Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.8.0.5) Gecko/20060805 CentOS/1.0.3-0.el4.1.centos4 SeaMonkey/1.0.3');
INSERT INTO amz_ua (ID, UA) VALUES (697, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.8.0.5) Gecko/20060721 SeaMonkey/1.0.3');
INSERT INTO amz_ua (ID, UA) VALUES (698, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.4) Gecko/20060619 SeaMonkey/1.0.2');
INSERT INTO amz_ua (ID, UA) VALUES (699, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.4) Gecko/20060516 SeaMonkey/1.0.2');
INSERT INTO amz_ua (ID, UA) VALUES (700, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.2) Gecko/20060630 Red Hat/1.0.1-0.1.9.EL3 SeaMonkey/1.0.1');
INSERT INTO amz_ua (ID, UA) VALUES (701, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.2) Gecko/20060404 SeaMonkey/1.0.1');
INSERT INTO amz_ua (ID, UA) VALUES (702, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.2) Gecko/20060404 SeaMonkey/1.0.1');
INSERT INTO amz_ua (ID, UA) VALUES (703, 'Mozilla/5.0 (X11; U; Linux i686; pl-PL; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0');
INSERT INTO amz_ua (ID, UA) VALUES (704, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.1) Gecko/20060316 SUSE/1.0-27 SeaMonkey/1.0');
INSERT INTO amz_ua (ID, UA) VALUES (705, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ru-RU; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0');
INSERT INTO amz_ua (ID, UA) VALUES (706, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0');
INSERT INTO amz_ua (ID, UA) VALUES (707, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0');
INSERT INTO amz_ua (ID, UA) VALUES (708, 'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0');
INSERT INTO amz_ua (ID, UA) VALUES (709, 'Mozilla/5.0 (Windows; U; Win 9x 4.90; en-US; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0');
INSERT INTO amz_ua (ID, UA) VALUES (710, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.8.1.8) Gecko/20071008 SeaMonkey');
INSERT INTO amz_ua (ID, UA) VALUES (711, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; ja-jp) AppleWebKit/419 (KHTML, like Gecko) Shiira/1.2.3 Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (712, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en_CA) AppleWebKit/522+ (KHTML, like Gecko) Shiira/1.2.3 Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (713, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Shiira/1.2.3 Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (714, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/522.10.1 (KHTML, like Gecko) Shiira/1.2.2 Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (715, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Shiira/1.2.2 Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (716, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/418.9 (KHTML, like Gecko) Shiira/1.2.2 Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (717, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; de-de) AppleWebKit/312.8 (KHTML, like Gecko) Shiira/1.2.2 Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (718, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/418.9.1 (KHTML, like Gecko) Shiira/1.2.2 Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (719, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/418.9 (KHTML, like Gecko) Shiira/1.2.2 Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (720, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; pl-pl) AppleWebKit/312.8 (KHTML, like Gecko) Shiira/1.2.1 Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (721, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/417.9 (KHTML, like Gecko, Safari) Shiira/1.1');
INSERT INTO amz_ua (ID, UA) VALUES (722, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/523.15.1 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (723, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/419 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (724, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/522.11.1 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (725, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/522.10.1 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (726, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/419.3 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (727, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/419.2.1 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (728, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (729, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; fr) AppleWebKit/418.9.1 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (730, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-au) AppleWebKit/523.10.3 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (731, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (732, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2; en-us) AppleWebKit/531.21.8 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (733, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_4_11; en) AppleWebKit/528.16 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (734, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_4_11; en) AppleWebKit/525.18 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (735, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_4_11; en) AppleWebKit/525.13 (KHTML, like Gecko) Shiira Safari/125');
INSERT INTO amz_ua (ID, UA) VALUES (736, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1b5pre) Gecko/20090424 Shiretoko/3.5b5pre');
INSERT INTO amz_ua (ID, UA) VALUES (737, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1b5pre) Gecko/20090519 Shiretoko/3.5b5pre');
INSERT INTO amz_ua (ID, UA) VALUES (738, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1b4pre) Gecko/20090404 Shiretoko/3.5b4pre');
INSERT INTO amz_ua (ID, UA) VALUES (739, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1b4pre) Gecko/20090401 Ubuntu/9.04 (jaunty) Shiretoko/3.5b4pre');
INSERT INTO amz_ua (ID, UA) VALUES (740, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1b4pre) Gecko/20090405 Shiretoko/3.5b4pre');
INSERT INTO amz_ua (ID, UA) VALUES (741, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1b4pre) Gecko/20090420 Shiretoko/3.5b4pre (.NET CLR 3.5.30729)');
INSERT INTO amz_ua (ID, UA) VALUES (742, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b4pre) Gecko/20090413 Shiretoko/3.5b4pre');
INSERT INTO amz_ua (ID, UA) VALUES (743, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b4pre) Gecko/20090411 Shiretoko/3.5b4pre');
INSERT INTO amz_ua (ID, UA) VALUES (744, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b4pre) Gecko/20090323 Shiretoko/3.5b4pre (.NET CLR 3.5.30729)');
INSERT INTO amz_ua (ID, UA) VALUES (745, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.8pre) Gecko/20100112 Shiretoko/3.5.8pre');
INSERT INTO amz_ua (ID, UA) VALUES (746, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.8pre) Gecko/20100110 Shiretoko/3.5.8pre');
INSERT INTO amz_ua (ID, UA) VALUES (747, 'Mozilla/5.0 (X11; U; Linux i686; ja; rv:1.9.1.6) Gecko/20091216 Shiretoko/3.5.6');
INSERT INTO amz_ua (ID, UA) VALUES (748, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US; rv:1.9.1.6) Gecko/20091222 Shiretoko/3.5.6 ( .NET CLR 3.5.30729)');
INSERT INTO amz_ua (ID, UA) VALUES (749, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.5pre) Gecko/20091016 Shiretoko/3.5.5pre GTB6');
INSERT INTO amz_ua (ID, UA) VALUES (750, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.5) Gecko/20100309 Ubuntu/9.04 (jaunty) Shiretoko/3.5.5');
INSERT INTO amz_ua (ID, UA) VALUES (751, 'Mozilla/5.0 (X11; U; Darwin i386; en-US; rv:1.9.1.4) Gecko/20100311 Shiretoko/3.5.5');
INSERT INTO amz_ua (ID, UA) VALUES (752, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; zh-TW; rv:1.9.1.5) Gecko/20091106 Shiretoko/3.5.5 (.NET CLR 3.5.30729)');
INSERT INTO amz_ua (ID, UA) VALUES (753, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.4pre) Gecko/20090921 Ubuntu/9.04 (jaunty) Shiretoko/3.5.4pre');
INSERT INTO amz_ua (ID, UA) VALUES (754, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.4pre) Gecko/20090921 Ubuntu/8.10 (intrepid) Shiretoko/3.5.4pre');
INSERT INTO amz_ua (ID, UA) VALUES (755, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.3pre) Gecko/20090803 Ubuntu/9.04 (jaunty) Shiretoko/3.5.3pre (.NET CLR 3.5.30729)');
INSERT INTO amz_ua (ID, UA) VALUES (756, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.3pre) Gecko/20090730 Ubuntu/9.04 (jaunty) Shiretoko/3.5.2');
INSERT INTO amz_ua (ID, UA) VALUES (757, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.2) Gecko/20090803 Ubuntu/9.04 (jaunty) Shiretoko/3.5.2 FirePHP/0.3');
INSERT INTO amz_ua (ID, UA) VALUES (758, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.2) Gecko/20090805 Shiretoko/3.5.2');
INSERT INTO amz_ua (ID, UA) VALUES (759, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.1) Gecko/20090716 Ubuntu/9.04 (jaunty) Shiretoko/3.5.1');
INSERT INTO amz_ua (ID, UA) VALUES (760, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.1pre) Gecko/20090701 Ubuntu/9.04 (jaunty) Shiretoko/3.5');
INSERT INTO amz_ua (ID, UA) VALUES (761, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1) Gecko/20090701 Ubuntu/9.10 (karmic) Shiretoko/3.5');
INSERT INTO amz_ua (ID, UA) VALUES (762, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1) Gecko/20090701 Linux Mint/7 (Gloria) Shiretoko/3.5');
INSERT INTO amz_ua (ID, UA) VALUES (763, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1) Gecko/20090630 Ubuntu/9.04 (jaunty) Shiretoko/3.5');
INSERT INTO amz_ua (ID, UA) VALUES (764, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1b4pre) Gecko/20090311 Ubuntu/9.04 (jaunty) Shiretoko/3.1b4pre');
INSERT INTO amz_ua (ID, UA) VALUES (765, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1b4pre) Gecko/20090311 Shiretoko/3.1b4pre');
INSERT INTO amz_ua (ID, UA) VALUES (766, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1b4pre) Gecko/20090307 Shiretoko/3.1b4pre (.NET CLR 3.5.30729)');
INSERT INTO amz_ua (ID, UA) VALUES (767, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-TW; rv:1.9.1b4pre) Gecko/20090308 Shiretoko/3.1b4pre (.NET CLR 3.5.30729)');
INSERT INTO amz_ua (ID, UA) VALUES (768, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; bg-BG; rv:1.9.1b4pre) Gecko/20090307 Shiretoko/3.1b4pre');
INSERT INTO amz_ua (ID, UA) VALUES (769, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1b3pre) Gecko/20090109 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (770, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1b3pre) Gecko/20081223 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (771, 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1b3pre) Gecko/20081222 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (772, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1b3pre) Gecko/20090106 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (773, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1b3pre) Gecko/20090105 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (774, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1b3pre) Gecko/20081203 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (775, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; pt-BR; rv:1.9.1b3pre) Gecko/20090103 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (776, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1b3pre) Gecko/20081207 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (777, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1b3pre) Gecko/20081204 Shiretoko/3.1b3pre (.NET CLR 3.5.30729)');
INSERT INTO amz_ua (ID, UA) VALUES (778, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US; rv:1.9.1b3pre) Gecko/20090105 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (779, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US; rv:1.9.1b3pre) Gecko/20090104 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (780, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; pl; rv:1.9.1b3pre) Gecko/20090205 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (781, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b3pre) Gecko/20090207 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (782, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b3pre) Gecko/20090121 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (783, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b3pre) Gecko/20090113 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (784, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b3pre) Gecko/20090102 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (785, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b3pre) Gecko/20081228 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (786, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b3pre) Gecko/20081221 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (787, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b3pre) Gecko/20081218 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (788, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1b3pre) Gecko/20081212 Shiretoko/3.1b3pre');
INSERT INTO amz_ua (ID, UA) VALUES (789, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0; Sleipnir/2.9.7)');
INSERT INTO amz_ua (ID, UA) VALUES (790, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/528.16 (KHTML, like Gecko) Stainless/0.5.3 Safari/525.20.1');
INSERT INTO amz_ua (ID, UA) VALUES (791, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; es-es) AppleWebKit/525.27.1 (KHTML, like Gecko) Stainless/0.4.5 Safari/525.20.1');
INSERT INTO amz_ua (ID, UA) VALUES (792, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_5; zh-tw) AppleWebKit/525.27.1 (KHTML, like Gecko) Stainless/0.4.5 Safari/525.20.1');
INSERT INTO amz_ua (ID, UA) VALUES (793, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_5; en-us) AppleWebKit/525.27.1 (KHTML, like Gecko) Stainless/0.4.5 Safari/525.20.1');
INSERT INTO amz_ua (ID, UA) VALUES (794, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_5; zh-tw) AppleWebKit/525.27.1 (KHTML, like Gecko) Stainless/0.4 Safari/525.20.1');
INSERT INTO amz_ua (ID, UA) VALUES (795, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_5; en-us) AppleWebKit/525.27.1 (KHTML, like Gecko) Stainless/0.4 Safari/525.20.1');
INSERT INTO amz_ua (ID, UA) VALUES (796, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_5; en-us) AppleWebKit/528.1 (KHTML, like Gecko) Stainless/0.3.5 Safari/525.20.1');
INSERT INTO amz_ua (ID, UA) VALUES (797, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_5; zh-tw) AppleWebKit/525.18 (KHTML, like Gecko) Stainless/0.3 Safari/525.20.1');
INSERT INTO amz_ua (ID, UA) VALUES (798, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_4; en-us) AppleWebKit/528.1 (KHTML, like Gecko) Version/4.0 Safari/528.1 Stainless/0.1');
INSERT INTO amz_ua (ID, UA) VALUES (799, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ) Sundance/0.9x');
INSERT INTO amz_ua (ID, UA) VALUES (800, 'Mozilla/5.0 (compatible; Sundance/0.9x)');
INSERT INTO amz_ua (ID, UA) VALUES (801, 'Mozilla/5.0(Compatible; Windows; U; en-US;) Sundance/0.9.0.33');
INSERT INTO amz_ua (ID, UA) VALUES (802, 'Mozilla/5.0(Compatible; Windows; U; en-US;) Sundance/0.9');
INSERT INTO amz_ua (ID, UA) VALUES (803, 'Mozilla/6.0 (X11; U; Linux x86_64; en-US; rv:2.9.0.3) Gecko/2009022510 FreeBSD/ Sunrise/4.0.1/like Safari');
INSERT INTO amz_ua (ID, UA) VALUES (804, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_5; ja-jp) AppleWebKit/525.18 (KHTML, like Gecko) Sunrise/1.7.5 like Safari/5525.20.1');
INSERT INTO amz_ua (ID, UA) VALUES (805, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_4_11; en) AppleWebKit/525.18 (KHTML, like Gecko) Sunrise/1.7.4 like Safari/4525.22');
INSERT INTO amz_ua (ID, UA) VALUES (806, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_2; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Sunrise/1.7.1 like Safari/5525.18');
INSERT INTO amz_ua (ID, UA) VALUES (807, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/418.9.1 (KHTML, like Gecko) Sunrise/1.6.5 like Safari/419.3');
INSERT INTO amz_ua (ID, UA) VALUES (808, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; fr) AppleWebKit/523.12.2 (KHTML, like Gecko) Sunrise/1.6.0 like Safari/523.12.2');
INSERT INTO amz_ua (ID, UA) VALUES (809, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/125.5.7 (KHTML, like Gecko) SunriseBrowser/0.895');
INSERT INTO amz_ua (ID, UA) VALUES (810, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/125.5.7 (KHTML, like Gecko) SunriseBrowser/0.853');
INSERT INTO amz_ua (ID, UA) VALUES (811, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/125.5.7 (KHTML, like Gecko) SunriseBrowser/0.84');
INSERT INTO amz_ua (ID, UA) VALUES (812, 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/125.5.7 (KHTML, like Gecko) SunriseBrowser/0.833');
INSERT INTO amz_ua (ID, UA) VALUES (813, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.8.1.9) Gecko/20071110 Sylera/3.0.20 SeaMonkey/1.1.6');
INSERT INTO amz_ua (ID, UA) VALUES (814, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.8.1.24) Gecko/20100228 Sylera/3.0.20 SeaMonkey/1.1.6');
INSERT INTO amz_ua (ID, UA) VALUES (815, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.8.1.24) Gecko/20100228 Sylera/3.0.20 SeaMonkey/1.1.19');
INSERT INTO amz_ua (ID, UA) VALUES (816, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.9) Gecko/20071110 Sylera/3.0.20 SeaMonkey/1.1.6');
INSERT INTO amz_ua (ID, UA) VALUES (817, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.24) Gecko/20100228 Sylera/3.0.20 SeaMonkey/1.1.19');
INSERT INTO amz_ua (ID, UA) VALUES (818, 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.8.1.9) Gecko/20071110 Sylera/3.0.20 SeaMonkey/1.1.6');
INSERT INTO amz_ua (ID, UA) VALUES (819, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070809 Sylera/3.0.18 SeaMonkey/1.1.4');
INSERT INTO amz_ua (ID, UA) VALUES (820, 'Mozilla/5.0 (Macintosh; PPC Mac OS X 10.5; rv:10.0.2) Gecko/20120216 Firefox/10.0.2 TenFourFox/7450');
INSERT INTO amz_ua (ID, UA) VALUES (821, 'Mozilla/5.0 (Macintosh; PPC Mac OS X 10.4; rv:10.0.2) Gecko/20120217 Firefox/10.0.2 TenFourFox/G3');
INSERT INTO amz_ua (ID, UA) VALUES (822, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0; TheWorld)');
INSERT INTO amz_ua (ID, UA) VALUES (823, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1pre) Gecko/20090629 Vonkeror/1.0');
INSERT INTO amz_ua (ID, UA) VALUES (824, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; pt-BR) AppleWebKit/534.12 (KHTML, like Gecko) WeltweitimnetzBrowser/0.25 Safari/534.12');
INSERT INTO amz_ua (ID, UA) VALUES (825, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; pt-BR) AppleWebKit/533.3 (KHTML, like Gecko) WeltweitimnetzBrowser/0.25 Safari/533.3');
INSERT INTO amz_ua (ID, UA) VALUES (826, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; pt-BR) AppleWebKit/532.4 (KHTML, like Gecko) WeltweitimnetzBrowser/0.25 Safari/532.4');
INSERT INTO amz_ua (ID, UA) VALUES (827, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20100121 Firefox/3.5.6 Wyzo/3.5.6.1');
INSERT INTO amz_ua (ID, UA) VALUES (828, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.6) Gecko/20100121 Firefox/3.5.6 Wyzo/3.5.6');
INSERT INTO amz_ua (ID, UA) VALUES (829, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.10) Gecko/2009042815 Firefox/3.0.10 Wyzo/3.0.4');
INSERT INTO amz_ua (ID, UA) VALUES (830, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.0.9) Gecko/2009042410 Firefox/3.0.9 Wyzo/3.0.3');
INSERT INTO amz_ua (ID, UA) VALUES (831, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.9) Gecko/2009042410 Firefox/3.0.9 Wyzo/3.0.3');
INSERT INTO amz_ua (ID, UA) VALUES (832, 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US; rv:1.9.0.9) Gecko/2009042410 Firefox/3.0.9 Wyzo/3.0.3');
INSERT INTO amz_ua (ID, UA) VALUES (833, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.9) Gecko/2009042410 Firefox/3.0.9 Wyzo/3.0.3');
INSERT INTO amz_ua (ID, UA) VALUES (834, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.9) Gecko/2009042318 Firefox/3.0.9 Wyzo/3.0.3');
INSERT INTO amz_ua (ID, UA) VALUES (835, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.0.9) Gecko/2009042318 Firefox/3.0.9 Wyzo/3.0.3 GTB6');
INSERT INTO amz_ua (ID, UA) VALUES (836, 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.0.9) Gecko/2009042318 Firefox/3.0.9 Wyzo/3.0.2');
INSERT INTO amz_ua (ID, UA) VALUES (837, 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.1.6) Gecko/20070801 Firefox/2.0 Wyzo/0.5.3');
INSERT INTO amz_ua (ID, UA) VALUES (838, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070801 Firefox/2.0 Wyzo/0.5.3');



