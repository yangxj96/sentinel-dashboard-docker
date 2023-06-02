# Sentinel Dashboard V1.8.6版本

因为未指定last版本,所以在pull的时候需要指定版本

如:

```shell
docker pull yangxj96/nacos-server-pgsql:v2.2.2-2
```

---

# 一 环境变量

| 配置项                                               | 类型      | 默认值                       | 最小值    | 描述                                                                          |               
|:--------------------------------------------------|:--------|:--------------------------|:-------|:----------------------------------------------------------------------------|
| PORT                                              | Integer | 8080                      | -      | 控制面板端口                                                                      |
| SESSION_TIMEOUT                                   | Integer | 7200                      | -      | 用于指定 Spring Boot 服务端 session 的过期时间，如 7200 表示 7200 秒；60m 表示 60 分钟，默认为 30 分钟; |
| PROJECT_NAME                                      | String  | sentinel-dashboard        | -      | 自注册名称                                                                       |
| AUTH_ENABLED                                      | boolean | true                      | -      | 是否开启登录鉴权，仅用于日常测试，生产上不建议关闭                                                   |
| SENTINEL_DASHBOARD_AUTH_USERNAME                  | String  | sentinel                  | -      | 登录控制台的用户名,默认为 sentinel                                                      |
| SENTINEL_DASHBOARD_AUTH_PASSWORD                  | String  | sentinel                  | -      | 登录控制台的密码,默认为 sentinel                                                       |
| SENTINEL_DASHBOARD_APP_HIDE_APP_NO_MACHINE_MILLIS | Integer | 0                         | 60000  | 是否隐藏无健康节点的应用，距离最近一次主机心跳时间的毫秒数，默认关闭                                          |
| SENTINEL_DASHBOARD_REMOVE_APP_NO_MACHINE_MILLIS   | Integer | 0                         | 120000 | 是否自动删除无健康节点的应用，距离最近一次其下节点的心跳时间毫秒数，默认关闭                                      |
| SENTINEL_DASHBOARD_UNHEALTHY_MACHINE_MILLIS	      | Integer | 60000                     | 30000  | 主机失联判定，不可关闭                                                                 |
| SENTINEL_DASHBOARD_AUTO_REMOVE_MACHINE_MILLIS     | Integer | 0                         | 300000 | 距离最近心跳时间超过指定时间是否自动删除失联节点，默认关闭                                               |
| SENTINEL_DASHBOARD_UNHEALTHY_MACHINE_MILLIS       | Integer | 60000                     | 30000  | 主机失联判定，不可关闭                                                                 |
| SERVER_SERVLET_SESSION_COOKIE_NAME                | String  | sentinel_dashboard_cookie | -      | 控制台应用的cookie名称，可单独设置避免同一域名下cookie名冲突                                        |

# 二 暴露的端口

|  端口  |  说明   |
|:----:|:-----:|
| 8080 | 控制台端口 |

# 三 运行示例

### docker-compose 文件



```yaml
version: "3"
services:
  nacos:
    image: yangxj96/sentinel-dashboard:v1.8.6
    container_name: yangxj96-sentinel
    privileged: true
    environment:
      SENTINEL_DASHBOARD_AUTH_USERNAME: root
      SENTINEL_DASHBOARD_AUTH_PASSWORD: root
    ports: 
      - "8484:8080"
```

# 三 更新日志

