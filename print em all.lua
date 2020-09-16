concommand.Add("printallnets", function()
    for _, a in SortedPairs(net.Receivers, not 1) do
        print(_, debug.getinfo(a)["short_src"])
    end

    for b = 0, 65535 do
        local c = util.NetworkIDToString(b)

        if c and c ~= "" then
            if not net.Receivers[c] then // pizdec
                print(c, "Server")
            end
        end
    end
end)

concommand.Add("blocknet", function(_, _, _, a)
    local function block(text)
        net.Start = function(name)
            if (name == text) then
                return false
            else
                return netstart(name)
            end
        end
    end

    block(a)
    msg_c(Color(255, 255, 255), "Blocked net message: " .. a .. " \n")
end)
