/*
Navicat MySQL Data Transfer

Source Server         : springboot
Source Server Version : 50630
Source Host           : localhost:3306
Source Database       : springboot_blog

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2020-08-06 16:47:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES ('66');
INSERT INTO `hibernate_sequence` VALUES ('66');
INSERT INTO `hibernate_sequence` VALUES ('66');
INSERT INTO `hibernate_sequence` VALUES ('66');
INSERT INTO `hibernate_sequence` VALUES ('66');

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `id` bigint(20) NOT NULL,
  `appreciation` bit(1) NOT NULL,
  `commentabled` bit(1) NOT NULL,
  `content` longtext,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `first_picture` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK292449gwg5yf7ocdlmswv9w4j` (`type_id`),
  KEY `FK8ky5rrsxh01nkhctmo7d48p82` (`user_id`),
  CONSTRAINT `FK292449gwg5yf7ocdlmswv9w4j` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`),
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES ('37', '', '', '一、问题描述\r\n\r\n修改实体主键的设置方式为int自增模式，也就是\r\n\r\n```java\r\n\r\n@Id\r\n@GeneratedValue(strategy=GenerationType.IDENTITY)\r\nprivate int id;\r\n```\r\n\r\n\r\n\r\n本以为直接用repository.save，直接万事大吉，结果报错：\r\n\r\nField \'id\' doesn\'t have a default value```java\r\nField \'id\' doesn\'t have a default value\r\n```\r\n\r\n\r\n二、解决办法\r\n\r\n查了很多资料，有的说表结构没有勾选自增选项云云，但我这是jpa自动建表啊，也不用我手动去搞表结构。\r\n\r\n后来发现我把表结构删了重新执行代码就正常了。\r\n\r\n\r\n三、问题原因\r\n\r\n其实是这个配置搞的事情：\r\n\r\n```java\r\njpa:\r\n  hibernate:\r\n    ddl-auto: update\r\n```\r\n\r\nupdate只有在新增字段时候，才会修改表结构新加一个字段。\r\n\r\n而我之前建好的表，我改了表主键生成方式，update选项并不会更新到表结构中。所以我删除了表结构，重新生成就没有问题了。', '2020-08-01 03:49:50', '开发过程中的bug。。。。。。。。。。。。。。。。。。。。。。', 'https://img-blog.csdnimg.cn/201901121125355.png', '转载', '\0', '', '', 'JPA问题 : Field id doesnt have a default value', '2020-08-03 12:50:33', '22', '24', '1');
INSERT INTO `t_blog` VALUES ('38', '', '', '1.先将项目导入eclipse中：file->import->General->Existing Projects into Workspace\r\n[![](https://img-blog.csdnimg.cn/20200521170951426.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200521170951426.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)\r\n\r\n\r\n\r\n\r\n2.点击Browse将项目导入进去（由于之前导入了，所以这里我随便找了个项目导了进去）\r\n\r\n[![](https://img-blog.csdnimg.cn/20200521171146691.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200521171146691.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)\r\n\r\n\r\n\r\n\r\n3.重点！！！！！！由于项目在编译时开发环境的不同，所以你导入别人项目的时候很大可能会报错\r\n\r\n[![](https://img-blog.csdnimg.cn/20200521171447700.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200521171447700.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)\r\n\r\n\r\n\r\n4.右键点击项目，Properties->java Build Path->Libraries\r\n\r\n[![](https://img-blog.csdnimg.cn/20200521171750938.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200521171750938.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)\r\n\r\n\r\n5.点击jre System library,然后点击edit,再点击Alternate JRE,修改为你自己的jdk版本\r\n\r\n[![](https://img-blog.csdnimg.cn/20200521172144190.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200521172144190.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)\r\n\r\n\r\n6.若TomCat版本不匹配，则会显示unbound，需要点击它，再点击edit,修改为你自己的TomCat版本，修改成功后unbound会消失\r\n\r\n[![](https://img-blog.csdnimg.cn/2020052117233825.png)](https://img-blog.csdnimg.cn/2020052117233825.png)\r\n\r\n[![](https://img-blog.csdnimg.cn/20200521172533124.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200521172533124.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)\r\n\r\n\r\n\r\n7.点击Properties->java Compiler修改里面的compiler compliance level为你自己的版本\r\n\r\n[![](https://img-blog.csdnimg.cn/20200521172919220.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200521172919220.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)\r\n\r\n7.点击Properties->project Facets修改里面的java为你自己的版本\r\n\r\n[![](https://img-blog.csdnimg.cn/20200521173218333.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200521173218333.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)\r\n\r\n8.此时若还出现这样的错误，则右键点击项目，Properties->java Build Path->Libraries，点击Add External jars,将jsp-api.jar和servlet-api.jar导入进去，\r\n\r\n[![](https://img-blog.csdnimg.cn/20200521173455754.png)](https://img-blog.csdnimg.cn/20200521173455754.png)\r\n\r\n[![](https://img-blog.csdnimg.cn/20200521173741643.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200521173741643.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)\r\n\r\n\r\n9.根据以上步骤操作，你再运行项目时就不会出现任何错误了。哈哈哈\r\n', '2019-08-01 04:04:19', '傻瓜操作！！！！！！！！！！！！！！！！', 'https://unsplash.it/100/100?image=1005', '原创', '', '', '\0', '如何将网上下载的Javaweb项目，导入本地的eclipse并可以运行？亲测百分百有效', '2019-08-01 04:05:53', '10', '34', '1');
INSERT INTO `t_blog` VALUES ('39', '', '', '#### 1.maven引入逆向工程依赖所需要jar包\r\n[![](https://img-blog.csdnimg.cn/20200520093206682.png)](https://img-blog.csdnimg.cn/20200520093206682.png)\r\n\r\n```shell\r\n<dependency>  \r\n<groupId>mysql</groupId> \r\n <artifactId>mysql-connector-java</artifactId>  \r\n <version>8.0.18</version> </dependency>\r\n<dependency>  \r\n<groupId>org.mybatis.generator</groupId>  \r\n<artifactId>mybatis-generator-core</artifactId> \r\n <version>1.4.0</version>\r\n  </dependency>\r\n\r\n```\r\n\r\n#### 2.配置生成规则：就是描述数据库中那些表，生成对应的Java实体类，同时生成映射配置文件。这个生成规则就是一个普通的配置文件。\r\n\r\n **2.1:在主目录中创建generator.xml**\r\n```shell\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?> <!DOCTYPE generatorConfiguration        PUBLIC \"-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN\"        \"http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd\">\r\n\r\n <generatorConfiguration>\r\n   <classPathEntry location=\"该jar包的位置\\mysql\\mysql-connector-java\\8.0.15\\mysql-connector-java-8.0.15.jar\" />   \r\n   <context id=\"msqlTables\" targetRuntime=\"MyBatis3\">    \r\n   <plugin type=\"org.mybatis.generator.plugins.SerializablePlugin\"></plugin>   \r\n   \r\n    <jdbcConnection connectionURL=\"jdbc:mysql://数据库地址:端口号/数据库名?serverTimezone=GMT%2B8\"\r\n     driverClass=\"com.mysql.cj.jdbc.Driver\" password=\"密码\" userId=\"登录名\" >\r\n   <property name=\"nullCatalogMeansCurrent\" value=\"true\"/>\r\n   </jdbcConnection>\r\n   \r\n     <javaTypeResolver>    \r\n            <property name=\"forceBigDecimals\" value=\"false\" />    \r\n     </javaTypeResolver>    \r\n     \r\n    <javaModelGenerator targetPackage=\"com.springdemo.model\" targetProject=\"demo\\src\\main\\java\">    \r\n             <property name=\"enableSubPackages\" value=\"true\"/>    \r\n             <property name=\"trimStrings\" value=\"true\" />    \r\n      </javaModelGenerator>    \r\n      \r\n      <sqlMapGenerator targetPackage=\"mapping\" targetProject=\"demo\\src\\main\\resources\">    \r\n             <property name=\"enableSubPackages\" value=\"true\"/>    \r\n      </sqlMapGenerator>    \r\n      \r\n     <javaClientGenerator type=\"XMLMAPPER\" targetPackage=\"com.springdemo.dao\" targetProject=\"demo\\src\\main\\java\">    \r\n             <property name=\"enableSubPackages\" value=\"true\"/>    \r\n    </javaClientGenerator>  \r\n \r\n           <!--数据库表-->\r\n          <table tableName=\"User\" domainObjectName=\"S_User\"   \r\n                enableCountByExample=\"false\" enableUpdateByExample=\"false\" enableDeleteByExample=\"false\"  \r\n                enableSelectByExample=\"false\" selectByExampleQueryId=\"false\" >    \r\n           <property name=\"useActualColumnNames\" value=\"false\"/>    \r\n       </table>\r\n           \r\n   </context>\r\n </generatorConfiguration>\r\n\r\n```\r\n\r\n**放上我自己项目的generator.xml**\r\n[![](https://img-blog.csdnimg.cn/20200520095526618.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200520095526618.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)\r\n\r\n#### 3，逆向工程：通过逆向工程代码生成器生成Java的实体类和持久层\r\n\r\n[![](https://img-blog.csdnimg.cn/20200520101144894.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200520101144894.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)\r\n\r\n\r\n\r\n**运行后就自动生成实体类，持久层和mapper.xml**\r\n\r\n[![](https://img-blog.csdnimg.cn/20200520101317242.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200520101317242.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTA4MTgxMw==,size_16,color_FFFFFF,t_70)', '2018-08-01 04:14:54', '.。。。。。。。。。', 'https://unsplash.it/400/400?image=1005', '原创', '\0', '', '', 'SSM逆向工程：通过数据库中存在的数据表，逆向生成Java的实体类和持久层（dao层）', '2018-08-03 12:50:22', '10', '25', '1');

-- ----------------------------
-- Table structure for t_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tags`;
CREATE TABLE `t_blog_tags` (
  `blogs_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  KEY `FK5feau0gb4lq47fdb03uboswm8` (`tags_id`),
  KEY `FKh4pacwjwofrugxa9hpwaxg6mr` (`blogs_id`),
  CONSTRAINT `FK5feau0gb4lq47fdb03uboswm8` FOREIGN KEY (`tags_id`) REFERENCES `t_tag` (`id`),
  CONSTRAINT `FKh4pacwjwofrugxa9hpwaxg6mr` FOREIGN KEY (`blogs_id`) REFERENCES `t_blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blog_tags
-- ----------------------------
INSERT INTO `t_blog_tags` VALUES ('38', '23');
INSERT INTO `t_blog_tags` VALUES ('39', '5');
INSERT INTO `t_blog_tags` VALUES ('39', '16');
INSERT INTO `t_blog_tags` VALUES ('39', '17');
INSERT INTO `t_blog_tags` VALUES ('37', '10');
INSERT INTO `t_blog_tags` VALUES ('37', '13');
INSERT INTO `t_blog_tags` VALUES ('37', '16');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` bigint(20) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `blog_id` bigint(20) DEFAULT NULL,
  `parent_comment_id` bigint(20) DEFAULT NULL,
  `admin_comment` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4jj284r3pb7japogvo6h72q95` (`parent_comment_id`),
  KEY `FKke3uogd04j4jx316m1p51e05u` (`blog_id`),
  CONSTRAINT `FK4jj284r3pb7japogvo6h72q95` FOREIGN KEY (`parent_comment_id`) REFERENCES `t_comment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKke3uogd04j4jx316m1p51e05u` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('57', 'https://unsplash.it/100/100?image=1005', '真的可以，牛逼！！', '2020-08-04 13:22:50', '1335162133@qq.com', 'Tom', '38', null, '\0');
INSERT INTO `t_comment` VALUES ('58', 'https://unsplash.it/100/100?image=1005', '一样', '2020-08-04 13:23:21', '572915930@qq.com', 'John', '38', '57', '\0');
INSERT INTO `t_comment` VALUES ('59', 'https://unsplash.it/100/100?image=1005', '谢谢，嘻嘻嘻！', '2020-08-04 13:24:01', '572915930@qq.com', '张三', '38', null, '\0');
INSERT INTO `t_comment` VALUES ('60', 'https://unsplash.it/100/100?image=1005', '十分方便，减少了写各种层的代码，但得对mybatis十分熟悉', '2020-08-04 13:52:56', 'eaaaaaaaaaaaa@163.com', '李四', '39', null, '\0');
INSERT INTO `t_comment` VALUES ('61', 'https://unsplash.it/100/100?image=1005', '不错不错', '2020-08-04 13:53:17', '1335162133@qq.com', 'dessw', '39', null, '\0');
INSERT INTO `t_comment` VALUES ('62', 'https://unsplash.it/100/100?image=1005', '找了好久，终于解决这个问题了，谢谢！', '2020-08-04 13:54:24', '1335162133@qq.com', 'Apple', '37', null, '\0');
INSERT INTO `t_comment` VALUES ('63', 'https://unsplash.it/100/100?image=1005', 'very good\n', '2020-08-05 16:01:07', '572915930@QQ.COM', 'Dr.W', '37', null, '\0');
INSERT INTO `t_comment` VALUES ('64', 'https://unsplash.it/100/100?image=1005', '111', '2020-08-06 08:03:58', 'hh@163.com', '管理员', '37', null, '');
INSERT INTO `t_comment` VALUES ('65', 'https://unsplash.it/100/100?image=1005', '不用客气', '2020-08-06 08:04:30', 'hh@163.com', '管理员', '37', '62', '');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES ('4', 'CSS');
INSERT INTO `t_tag` VALUES ('5', 'spring');
INSERT INTO `t_tag` VALUES ('6', 'HTML');
INSERT INTO `t_tag` VALUES ('7', 'Python');
INSERT INTO `t_tag` VALUES ('8', 'Docker');
INSERT INTO `t_tag` VALUES ('9', 'Linux');
INSERT INTO `t_tag` VALUES ('10', 'MySQL');
INSERT INTO `t_tag` VALUES ('11', '算法');
INSERT INTO `t_tag` VALUES ('12', '计算机基础');
INSERT INTO `t_tag` VALUES ('13', 'SpringBoot');
INSERT INTO `t_tag` VALUES ('14', 'SpringCloud');
INSERT INTO `t_tag` VALUES ('15', 'Maven');
INSERT INTO `t_tag` VALUES ('16', 'Mybatis');
INSERT INTO `t_tag` VALUES ('17', 'Shiro');
INSERT INTO `t_tag` VALUES ('18', 'Redis');
INSERT INTO `t_tag` VALUES ('19', 'Jquery');
INSERT INTO `t_tag` VALUES ('20', 'Thymeleaf');
INSERT INTO `t_tag` VALUES ('21', 'Vue');
INSERT INTO `t_tag` VALUES ('22', 'Android');
INSERT INTO `t_tag` VALUES ('23', 'JavaScript');
INSERT INTO `t_tag` VALUES ('24', 'Java');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('24', '错误日志');
INSERT INTO `t_type` VALUES ('25', '软件开发');
INSERT INTO `t_type` VALUES ('26', '软件测试');
INSERT INTO `t_type` VALUES ('27', '网络工程师');
INSERT INTO `t_type` VALUES ('28', '架构师');
INSERT INTO `t_type` VALUES ('29', '前端');
INSERT INTO `t_type` VALUES ('30', '数据库');
INSERT INTO `t_type` VALUES ('31', '移动开发');
INSERT INTO `t_type` VALUES ('32', '运维');
INSERT INTO `t_type` VALUES ('33', '嵌入式开发');
INSERT INTO `t_type` VALUES ('34', '经验分享');
INSERT INTO `t_type` VALUES ('35', '技术好文');
INSERT INTO `t_type` VALUES ('36', '日常琐事');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'https://unsplash.it/100/100?image=1005', '2017-10-15 12:36:04', 'hh@163.com', '管理员', '96e79218965eb72c92a549dd5a330112', '1', '2017-10-15 12:36:23', 'admin');
