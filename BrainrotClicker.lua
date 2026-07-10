--[[
 __      __       _      ______                   _             
 \ \    / /      | |    |  ____|                 | |            
  \ \  / /_ _  __| | ___| |__ _   _ ___  ___ __ _| |_ ___  _ __ 
   \ \/ / _ |/ _ |/ _ \  __| | | / __|/ __/ _ | __/ _ \| '__|
    \  / (_| | (_| |  __/ |  | |_| \__ \ (_| (_| | || (_) | |   
     \/ \__,_|\__,_|\___|_|   \__,_|___/\___\__,_|\__\___/|_|  
                                               v2.0.0
                                            made by lave
]]

local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function dec(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end
local func, err = loadstring(dec("bG9jYWwgQ29yZUd1aSA9IGdhbWU6R2V0U2VydmljZSgiQ29yZUd1aSIpCmxvY2FsIFJ1blNlcnZpY2UgPSBnYW1lOkdldFNlcnZpY2UoIlJ1blNlcnZpY2UiKQpsb2NhbCBSZXBsaWNhdGVkU3RvcmFnZSA9IGdhbWU6R2V0U2VydmljZSgiUmVwbGljYXRlZFN0b3JhZ2UiKQoKLS0gw5ZuY2VraSBHVUkgdmFyc2EgdGVtaXpsZSAoeWVuaWRlbiBleGVjdXRlIGVkaWxkacSfaW5kZSDDvHN0IMO8c3RlIGJpbm1lc2luIGRpeWUpCmlmIENvcmVHdWk6RmluZEZpcnN0Q2hpbGQoIkJyYWlucm90Q2xpY2tlckdVSSIpIHRoZW4KICAgIENvcmVHdWkuQnJhaW5yb3RDbGlja2VyR1VJOkRlc3Ryb3koKQplbmQKCi0tIFJlbW90ZSBvYmplc2luaSBhbApsb2NhbCByZW1vdGUgPSBSZXBsaWNhdGVkU3RvcmFnZTpXYWl0Rm9yQ2hpbGQoIlJlbW90ZXMiKTpXYWl0Rm9yQ2hpbGQoIkNsaWNrQnJhaW5yb3QiKQoKLS0gR1VJIE9sdcWfdHVybWEKbG9jYWwgU2NyZWVuR3VpID0gSW5zdGFuY2UubmV3KCJTY3JlZW5HdWkiKQpsb2NhbCBNYWluRnJhbWUgPSBJbnN0YW5jZS5uZXcoIkZyYW1lIikKbG9jYWwgVUlDb3JuZXIgPSBJbnN0YW5jZS5uZXcoIlVJQ29ybmVyIikKbG9jYWwgVGl0bGUgPSBJbnN0YW5jZS5uZXcoIlRleHRMYWJlbCIpCmxvY2FsIFRvZ2dsZUJ1dHRvbiA9IEluc3RhbmNlLm5ldygiVGV4dEJ1dHRvbiIpCmxvY2FsIFVJQ29ybmVyXzIgPSBJbnN0YW5jZS5uZXcoIlVJQ29ybmVyIikKClNjcmVlbkd1aS5OYW1lID0gIkJyYWlucm90Q2xpY2tlckdVSSIKU2NyZWVuR3VpLlBhcmVudCA9IFJ1blNlcnZpY2U6SXNTdHVkaW8oKSBhbmQgZ2FtZS5QbGF5ZXJzLkxvY2FsUGxheWVyOldhaXRGb3JDaGlsZCgiUGxheWVyR3VpIikgb3IgQ29yZUd1aQpTY3JlZW5HdWkuWkluZGV4QmVoYXZpb3IgPSBFbnVtLlpJbmRleEJlaGF2aW9yLlNpYmxpbmcKCk1haW5GcmFtZS5OYW1lID0gIk1haW5GcmFtZSIKTWFpbkZyYW1lLlBhcmVudCA9IFNjcmVlbkd1aQpNYWluRnJhbWUuQmFja2dyb3VuZENvbG9yMyA9IENvbG9yMy5mcm9tUkdCKDMwLCAzMCwgMzApCk1haW5GcmFtZS5Cb3JkZXJDb2xvcjMgPSBDb2xvcjMuZnJvbVJHQigwLCAwLCAwKQpNYWluRnJhbWUuQm9yZGVyU2l6ZVBpeGVsID0gMApNYWluRnJhbWUuUG9zaXRpb24gPSBVRGltMi5uZXcoMC41LCAtMTAwLCAwLjUsIC01MCkKTWFpbkZyYW1lLlNpemUgPSBVRGltMi5uZXcoMCwgMjAwLCAwLCAxMTApCk1haW5GcmFtZS5BY3RpdmUgPSB0cnVlCk1haW5GcmFtZS5EcmFnZ2FibGUgPSB0cnVlIC0tIEdVSSduaW4gc8O8csO8a2xlbmViaWxpciBvbG1hc8SxCgpVSUNvcm5lci5Db3JuZXJSYWRpdXMgPSBVRGltLm5ldygwLCA4KQpVSUNvcm5lci5QYXJlbnQgPSBNYWluRnJhbWUKClRpdGxlLk5hbWUgPSAiVGl0bGUiClRpdGxlLlBhcmVudCA9IE1haW5GcmFtZQpUaXRsZS5CYWNrZ3JvdW5kQ29sb3IzID0gQ29sb3IzLmZyb21SR0IoMjU1LCAyNTUsIDI1NSkKVGl0bGUuQmFja2dyb3VuZFRyYW5zcGFyZW5jeSA9IDEuMDAwClRpdGxlLlNpemUgPSBVRGltMi5uZXcoMSwgMCwgMCwgMzUpClRpdGxlLkZvbnQgPSBFbnVtLkZvbnQuR290aGFtQm9sZApUaXRsZS5UZXh0ID0gIkJyYWlucm90IEF1dG8gQ2xpY2tlciIKVGl0bGUuVGV4dENvbG9yMyA9IENvbG9yMy5mcm9tUkdCKDI1NSwgMjU1LCAyNTUpClRpdGxlLlRleHRTaXplID0gMTQuMDAwCgpUb2dnbGVCdXR0b24uTmFtZSA9ICJUb2dnbGVCdXR0b24iClRvZ2dsZUJ1dHRvbi5QYXJlbnQgPSBNYWluRnJhbWUKVG9nZ2xlQnV0dG9uLkJhY2tncm91bmRDb2xvcjMgPSBDb2xvcjMuZnJvbVJHQigyMjAsIDYwLCA2MCkKVG9nZ2xlQnV0dG9uLlBvc2l0aW9uID0gVURpbTIubmV3KDAuMSwgMCwgMC40NSwgMCkKVG9nZ2xlQnV0dG9uLlNpemUgPSBVRGltMi5uZXcoMC44LCAwLCAwLCA0MCkKVG9nZ2xlQnV0dG9uLkZvbnQgPSBFbnVtLkZvbnQuR290aGFtQm9sZApUb2dnbGVCdXR0b24uVGV4dCA9ICJLQVBBTEkiClRvZ2dsZUJ1dHRvbi5UZXh0Q29sb3IzID0gQ29sb3IzLmZyb21SR0IoMjU1LCAyNTUsIDI1NSkKVG9nZ2xlQnV0dG9uLlRleHRTaXplID0gMTQuMDAwCgpVSUNvcm5lcl8yLkNvcm5lclJhZGl1cyA9IFVEaW0ubmV3KDAsIDYpClVJQ29ybmVyXzIuUGFyZW50ID0gVG9nZ2xlQnV0dG9uCgotLSBUxLFrbGFtYSBNYW50xLHEn8SxCmxvY2FsIGdldGdlbnYgPSBnZXRnZW52IG9yIGZ1bmN0aW9uKCkgcmV0dXJuIF9HIGVuZApnZXRnZW52KCkuQXV0b0NsaWNrQnJhaW5yb3QgPSBmYWxzZQoKbG9jYWwgZnVuY3Rpb24gc3RhcnRDbGlja2VyKCkKICAgIHdoaWxlIGdldGdlbnYoKS5BdXRvQ2xpY2tCcmFpbnJvdCBkbwogICAgICAgIC0tIHRhc2sud2FpdCgpIHNhbml5ZWRlIHlha2xhxZ/EsWsgNjAga2VyZSDDp2FsxLHFn8Sxci4gCiAgICAgICAgLS0gU2FuaXllZGUgMjAwKyB0xLFrbGFtYSBpw6dpbiBoZXIgZMO2bmfDvGRlIDQtNSBrZXJlIGZpcmUgYXTEsXlvcnV6LgogICAgICAgIGZvciBpID0gMSwgNCBkbyAKICAgICAgICAgICAgcmVtb3RlOkZpcmVTZXJ2ZXIoOTk5OTk5OTk5OTk5OTk5OTk5OSkKICAgICAgICBlbmQKICAgICAgICB0YXNrLndhaXQoKQogICAgZW5kCmVuZAoKLS0gQnV0b24gRXRraWxlxZ9pbWkKVG9nZ2xlQnV0dG9uLk1vdXNlQnV0dG9uMUNsaWNrOkNvbm5lY3QoZnVuY3Rpb24oKQogICAgZ2V0Z2VudigpLkF1dG9DbGlja0JyYWlucm90ID0gbm90IGdldGdlbnYoKS5BdXRvQ2xpY2tCcmFpbnJvdAogICAgaWYgZ2V0Z2VudigpLkF1dG9DbGlja0JyYWlucm90IHRoZW4KICAgICAgICBUb2dnbGVCdXR0b24uVGV4dCA9ICJBw4dJSyIKICAgICAgICBUb2dnbGVCdXR0b24uQmFja2dyb3VuZENvbG9yMyA9IENvbG9yMy5mcm9tUkdCKDYwLCAyMjAsIDYwKQogICAgICAgIHRhc2suc3Bhd24oc3RhcnRDbGlja2VyKQogICAgZWxzZQogICAgICAgIFRvZ2dsZUJ1dHRvbi5UZXh0ID0gIktBUEFMSSIKICAgICAgICBUb2dnbGVCdXR0b24uQmFja2dyb3VuZENvbG9yMyA9IENvbG9yMy5mcm9tUkdCKDIyMCwgNjAsIDYwKQogICAgZW5kCmVuZCkK"))
if func then func() else error(err) end
