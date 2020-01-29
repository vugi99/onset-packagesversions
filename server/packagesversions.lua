

AddEvent("OnPackageStart",function()
    local file = io.open("server_config.json", 'r') 
    if (file) then 
        local contents = file:read("*a")
        local server_tbl = json_decode(contents);
        io.close(file)
        print("Onset Version : " .. GetGameVersionString())
        local packages_tbl = server_tbl.packages
        for k,v in pairs(packages_tbl) do
            local package = io.open("packages/"..v.."/package.json", 'r') 
            if (package) then
                local contents = package:read("*a")
                local pack_tbl = json_decode(contents);
                io.close(package)
                if pack_tbl.onset_build then
                print("Package " .. v .. " version " .. pack_tbl.version .. " built for Onset " .. pack_tbl.onset_build .. " by " .. pack_tbl.author)
                else
                    print("Package " .. v .. " version " .. pack_tbl.version .. " by " .. pack_tbl.author)
                end
            end
        end
    end
end)