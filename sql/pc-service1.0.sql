
/*��Ŀ��Ϣ�� amz_departments */
CREATE TABLE IF NOT EXISTS amz_departments (
ID BIGINT NOT NULL DEFAULT 0,/*��ʶID*/
DEP_ID VARCHAR(256) DEFAULT '',/*Amazon��Ŀid*/
SHOW_NAME_CN VARCHAR(512) DEFAULT '',/*ǰ����ʾ����-����*/
SHOW_NAME_EN VARCHAR(512) DEFAULT '',/*ǰ����ʾ����-Ӣ��*/
URL VARCHAR(1024) DEFAULT '',/*��Ŀurl�����·��*/
URL_DOMAIN VARCHAR(256) DEFAULT '',/*��Ŀurl��Ӧ������*/
DEP_LEVEL INT,/*��Ŀ�㼶��1Ϊ��Ŀ¼*/
PARENT_ID BIGINT,/*����Ŀ��ʶID*/
PARENT_DEP_ID VARCHAR(256) DEFAULT '',/*����Ŀ��Amazon��Ŀid*/
DEP_STATUS INT DEFAULT 0,/*��Ŀ״̬��0-������1-��ɾ��*/
DATA_SRC_URL VARCHAR(1024) DEFAULT '',/*������Դҳurl*/
CREATE_TIME DATETIME DEFAULT NOW(),
UPDATE_TIME DATETIME DEFAULT NOW(),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*ָ��� amz_cmdtask */
CREATE TABLE IF NOT EXISTS amz_cmdtask (
ID INT NOT NULL auto_increment,/*��ʶID������*/
CMD_TYPE INT DEFAULT 0,/*ָ�����͡�101��������html��Ŀ*/
CMD_TEXT VARCHAR(4096),/*ָ������*/
CMD_STATUS INT DEFAULT 0,/*ָ��״̬��0-δ����1-�����У�2-����ɹ���3-����ʧ��*/
CREATE_TIME DATETIME DEFAULT NOW(),
UPDATE_TIME DATETIME DEFAULT NOW(),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

