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
local func, err = loadstring(dec("bG9jYWwgUGxheWVycyA9IGdhbWU6R2V0U2VydmljZSgiUGxheWVycyIpCmxvY2FsIE1hcmtldHBsYWNlU2VydmljZSA9IGdhbWU6R2V0U2VydmljZSgiTWFya2V0cGxhY2VTZXJ2aWNlIikKCmxvY2FsIHBsYXllciA9IFBsYXllcnMuTG9jYWxQbGF5ZXIKbG9jYWwgcHJvZHVjdElkID0gMDAwMDAwMDAwMCAtLSBCdXJheWEgRGV2ZWxvcGVyIFByb2R1Y3QgSUQgeWF6CgppZiBub3QgcGxheWVyIHRoZW4KICAgIHdhcm4oIkJ1IHNjcmlwdCBMb2NhbFNjcmlwdCBvbGFyYWsgY2xpZW50IHRhcmFmaW5kYSBjYWxpc21hbGkuIikKICAgIHJldHVybgplbmQKCmlmIHByb2R1Y3RJZCA9PSAwIHRoZW4KICAgIHdhcm4oInByb2R1Y3RJZCBraXNtaW5hIHNhdGluIGFsbWEgcGVuY2VyZXNpIGFjaWxhY2FrIERldmVsb3BlciBQcm9kdWN0IElEIHlhei4iKQogICAgcmV0dXJuCmVuZAoKTWFya2V0cGxhY2VTZXJ2aWNlOlByb21wdFByb2R1Y3RQdXJjaGFzZShwbGF5ZXIsIHByb2R1Y3RJZCkK"))
if func then func() else error(err) end
