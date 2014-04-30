--[[
   LuCI-app-Bras
   Maintainer: Chunyang Xu <xuchunyang56@gmail.com>
]]--

module("luci.controller.bras", package.seeall)

function index()

   if not nixio.fs.access('/etc/config/bras') then
      return
   end

   local page

   page = entry({"admin", "services", "bras"}, cbi("bras"), _("Bras"))
   page.i18n = "bras"
   page.dependent = true
end
