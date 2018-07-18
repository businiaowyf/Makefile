# include makefile
# date	: 2011-03-20
# note  :
CC			= gcc
CXX			= g++
CFLAGS		= -g -Wall -DMFP_EPOLL

#makefile 搜索源码路径
VPATH 	  := $(OBJ_DIR):$(RELEASE_DIR):$(BASE_DIR)/common:$(VPATH)

#STAT_TOOL:=/usr/local/safe_svr/mk/islib.mk
#include $(STAT_TOOL)

#通用的server基础库
SVR_COMM_PATH=/usr/local/safe_svr/

#公共的库和头文件目录
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

#日志库文件
INC_LOG=-I$(SVR_COMM_PATH)/include/log
LIB_LOG=-lseclog

#日志库文件 -- 开发log， 支持 本地log、网络log和开发log，与旧版本兼容 
#INC_LOG=-I$(SVR_COMM_PATH)/include/devlog
#LIB_LOG=-lsecdevlog

#scmlb库文件
#INC_SCMLB=-I$(SVR_COMM_PATH)/include/scmlb
#LIB_SCMLB=-lscmlb_client_api

#统一存储库文件
#INC_UNIFIED_STORAGE=-I$(SVR_COMM_PATH)/include/oplog
#LIB_UNIFIED_STORAGE=-lUnifiedStorageProtocolAll


#配置文件管理库文件
INC_CONFIG=-I$(SVR_COMM_PATH)/include/config
LIB_CONFIG=-lsecconfig


#util库，包含定时器，hash表，内存池，会话管理
INC_UTIL=-I$(SVR_COMM_PATH)/include/util
LIB_UTIL=-lsecutil


#客户端使用的网络库，主要用来写工具和测试程序
INC_CLIENT_NET=-I$(SVR_COMM_PATH)/include/net
LIB_CLIENT_NET=-lsecnet


#srvframe基础库，安全中心最新版本的
INC_SRVFRAMEWORK = -I$(SVR_COMM_PATH)/include/srvframework
LIB_SRVFRAMEWORK = -lsecsrvframework

#通用的异步server上层框库，封装了会话状态机和api等基础功能
INC_APPFRAME = -I$(SVR_COMM_PATH)/include/appframe
LIB_APPFRAME = -lsecappframe

#通用的DB库
INC_DB = -I$(SVR_COMM_PATH)/include/db
LIB_DB = -lsecdb


# 编译需要的所有头文件路径
LINK_INC	= $(INC_APPFRAME) $(INC_SRVFRAMEWORK) $(INC_CONFIG) $(INC_LOG) $(INC_UTIL) $(INC_DB) \
			$(INCDIR_COMM)
LINK_LIB	= $(LIB_APPFRAME) $(LIB_SRVFRAMEWORK) ${LIB_CONFIG} ${LIB_LOG} ${LIB_UTIL} $(LIB_DB) \
			$(LIBDIR_COMM) \
			-lneocomm -lz

