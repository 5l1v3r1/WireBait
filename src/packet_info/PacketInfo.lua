---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by markus.
--- DateTime: 2/15/19 11:32 PM
---

function PacketInfo.new(packet)
    local packet_info = {
        cols = { --[[ c.f. [wireshark pinfo.cols](https://wiki.wireshark.org/LuaAPI/Pinfo) ]]
            __number = column.new(),
            __abs_time = column.new(),
            __utc_time = column.new(),
            __cls_time = column.new(),
            __rel_time = column.new(),
            __date = column.new(),
            __utc_date = column.new(),
            __delta_time = column.new(),
            __delta_time_displayed = column.new(),
            __src = column.new(),
            __src_res = column.new(),
            __src_unres = column.new(),
            __dl_src = column.new(),
            __dl_src_res = column.new(),
            __dl_src_unres = column.new(),
            __net_src = column.new(),
            __net_src_res = column.new(),
            __net_src_unres = column.new(),
            __dst = column.new(),
            __dst_res = column.new(),
            __dst_unres = column.new(),
            __dl_dst = column.new(),
            __dl_dst_res = column.new(),
            __dl_dst_unres = column.new(),
            __net_dst = column.new(),
            __net_dst_res = column.new(),
            __net_dst_unres = column.new(),
            __src_port = column.new(),
            __src_port_res = column.new(),
            __src_port_unres = column.new(),
            __dst_port = column.new(),
            __dst_port_res = column.new(),
            __dst_port_unres = column.new(),
            __protocol = column.new(),
            __info = column.new(),
            __packet_len = column.new(),
            __cumulative_bytes = column.new(),
            __direction = column.new(),
            __vsan = column.new(),
            __tx_rate = column.new(),
            __rssi = column.new(),
            __dce_call = column.new()
        },
        treeitems_array = {}
    }

    packet_info.cols.__index = function(self, key, val)
        return rawget(self, "__"..key);
    end

    packet_info.cols.__newindex = function(self, key, val)
        if not self["__"..key] then
            error("Column '" .. key .. "' does not exist!");
        end
        self["__"..key]:set(tostring(val));
    end

    setmetatable(packet_info.cols, packet_info.cols);

    if packet then
        packet_info.cols.src = packet:getSrcIP();
        packet_info.cols.dst = packet:getDstIP();
        packet_info.cols.src_port = packet:getSrcPort();
        packet_info.cols.dst_port = packet:getDstPort();
        packet_info.cols.protocol = packet:protocol();
        packet_info.cols.info = packet_info.cols.src_port .. " → " .. packet_info.cols.dst_port .. "  Len=" .. packet:len();
    else
        --TODO: print error?
    end
    return packet_info;
end