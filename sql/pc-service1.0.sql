
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

