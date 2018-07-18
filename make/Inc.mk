# include makefile
# date	: 2011-03-20
# note  :
CC			= gcc
CXX			= g++
CFLAGS		= -g -Wall -DMFP_EPOLL

#makefile ����Դ��·��
VPATH 	  := $(OBJ_DIR):$(RELEASE_DIR):$(BASE_DIR)/common:$(VPATH)

#STAT_TOOL:=/usr/local/safe_svr/mk/islib.mk
#include $(STAT_TOOL)

#ͨ�õ�server������
SVR_COMM_PATH=/usr/local/safe_svr/

#�����Ŀ��ͷ�ļ�Ŀ¼
INCDIR_COMM=-I./ -I$(BASE_DIR)/include \
	-I$(BASE_DIR)/include/svr \
	-I$(BASE_DIR)/lib/ssdb \
	-I$(BASE_DIR)/lib/redis \
	-I$(BASE_DIR)/common \
	-I$(BASE_DIR)/include/protocol \
	-I$(BASE_DIR)/include/store \
	-I/usr/local/mysql/include \
	-I/usr/local/svrdev/include 

LIBDIR_COMM=-L/usr/local/mysql/lib  -L./ /usr/local/mysql/lib/libmysqlclient.a \
	-L$(BASE_DIR)/lib -L$(SVR_COMM_PATH)/lib -L/usr/local/svrdev/lib

#��־���ļ�
INC_LOG=-I$(SVR_COMM_PATH)/include/log
LIB_LOG=-lseclog

#��־���ļ� -- ����log�� ֧�� ����log������log�Ϳ���log����ɰ汾���� 
#INC_LOG=-I$(SVR_COMM_PATH)/include/devlog
#LIB_LOG=-lsecdevlog

#scmlb���ļ�
#INC_SCMLB=-I$(SVR_COMM_PATH)/include/scmlb
#LIB_SCMLB=-lscmlb_client_api

#ͳһ�洢���ļ�
#INC_UNIFIED_STORAGE=-I$(SVR_COMM_PATH)/include/oplog
#LIB_UNIFIED_STORAGE=-lUnifiedStorageProtocolAll


#�����ļ�������ļ�
INC_CONFIG=-I$(SVR_COMM_PATH)/include/config
LIB_CONFIG=-lsecconfig


#util�⣬������ʱ����hash���ڴ�أ��Ự����
INC_UTIL=-I$(SVR_COMM_PATH)/include/util
LIB_UTIL=-lsecutil


#�ͻ���ʹ�õ�����⣬��Ҫ����д���ߺͲ��Գ���
INC_CLIENT_NET=-I$(SVR_COMM_PATH)/include/net
LIB_CLIENT_NET=-lsecnet


#srvframe�����⣬��ȫ�������°汾��
INC_SRVFRAMEWORK = -I$(SVR_COMM_PATH)/include/srvframework
LIB_SRVFRAMEWORK = -lsecsrvframework

#ͨ�õ��첽server�ϲ��⣬��װ�˻Ự״̬����api�Ȼ�������
INC_APPFRAME = -I$(SVR_COMM_PATH)/include/appframe
LIB_APPFRAME = -lsecappframe

#ͨ�õ�DB��
INC_DB = -I$(SVR_COMM_PATH)/include/db
LIB_DB = -lsecdb


# ������Ҫ������ͷ�ļ�·��
LINK_INC	= $(INC_APPFRAME) $(INC_SRVFRAMEWORK) $(INC_CONFIG) $(INC_LOG) $(INC_UTIL) $(INC_DB) \
			$(INCDIR_COMM)
LINK_LIB	= $(LIB_APPFRAME) $(LIB_SRVFRAMEWORK) ${LIB_CONFIG} ${LIB_LOG} ${LIB_UTIL} $(LIB_DB) \
			$(LIBDIR_COMM) \
			-lneocomm -lz

