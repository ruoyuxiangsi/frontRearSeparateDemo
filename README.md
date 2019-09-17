# frontRearSeparateDemo

主要是记录如何实现读写分离的步骤


1、在EmployeeServlet.java先用servlet在后端返回对象的Json字符串
2、配置web.xml
3、在前台页面用jquery实现读写分离，后台传过来的字符串进行处理，让它展示在前台
    （1）先设置一个a标签，a标签有一个href属性和id属性
    （2）在script标签中，在页面初始化完为a标签绑定函数
    （3）设置a标签的点击函数，然它返回false，表示取消本次的href连接
    （4）请求ajax，对响应的数据，放在table标签中

