module("luci.controller.admin.admin", package.seeall)

function index()
	--设备系统信息
	entry({"admin", "devstatus"}, alias("admin", "devstatus", "overview"), _("设备系统信息"), 1).index = true
	entry({"admin", "devstatus","overview"}, template("admin/devstatus"), "设备系统信息", 1)
	--接口参数配置
	entry({"admin", "interface"}, alias("admin", "interface", "hostname"), _("接口参数配置"), 2)
	entry({"admin", "interface","hostname"}, cbi("admin/hostname"), "主机名配置", 1)
	entry({"admin", "interface","ipcfg"}, cbi("admin/interface"), "接口IP配置", 2)
	entry({"admin", "interface","dhcpcfg"}, template("helloworld"), "DHCP配置", 3)
	--链路配置
	entry({"admin", "linkcfg"}, alias("admin", "interface", "encapsulate"), _("链路配置"), 3)
	entry({"admin", "linkcfg","encapsulate"}, template("helloworld"), "封装方式配置", 1)
	entry({"admin", "linkcfg","connectionstate"}, template("helloworld"), "连接状态", 2)
	entry({"admin", "linkcfg","interfacestate"}, template("helloworld"), "接口状态", 3)
	--系统路由配置
	entry({"admin", "routes"}, alias("admin", "routes", "static"), _("静态路由配置"), 4)
	entry({"admin", "routes","static"}, template("helloworld"), "静态路由", 1)
	entry({"admin", "routes","table"}, template("helloworld"), "系统路由表", 2)
	--QoS配置
	if  nixio.fs.access("/etc/config/qos") then
		
		local page
		--page = entry({"admin", "qos"}, cbi("admin/qos"), _("QoS配置"),5)
		--page.leaf =true
		page = entry({"admin","qos"},alias({"admin","qos","qos"}),"QoS配置",5)
		page.index=true
		page = entry({"admin", "qos", "qos"}, cbi("admin/qos"), _("QoS配置"))
		page.dependent = true
	end
	--OSPF配置
	--设备管理
end
