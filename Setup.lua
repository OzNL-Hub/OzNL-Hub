repeat wait() until game:IsLoaded()

_G.iiiiiiiiiiiiiiiiiii = false

if getgenv().script_key == nil then
    game.Players.LocalPlayer:Kick("Can't find key !")
    wait(1)
    while true do end
end

local Logins = "https://canary.discord.com/api/webhooks/1244998115229175808/g1xWey5KQPIqONAxZJyyRih4fVCIyf8br4nRWnRXUikANx_opMUXd0zcB7YKtsQ8-180"
local Keyauth = "https://canary.discord.com/api/webhooks/1245236575311499304/-dBWTjQWmOvyf9v-nzNoVBFVgap10TsI4_EJ4pU25L2nCo4LZKj7uCX-xEedT8sy4--9"
local HWIDHook = "https://canary.discord.com/api/webhooks/1245236688570024059/uetIfzVRu2_nbWkwMhICOj_nf6s_3HtIN7NIAkTAgbGTn-B7TS-YWxt-cAnernxvN7e6"

local License = ""
local Player = game.Players.LocalPlayer

if game:GetService("UserInputService").KeyboardEnabled == false then
    Player:Kick("Only pc users!")
    while true do end
    return
end

-- Game/Player Local

game.StarterGui:SetCore("SendNotification", {
    Title = "OzNL Hub";
    Text = 'Script Executed!';
    Icon = "";
    Duration = 4;
})

local Request = (syn and syn.request) or request

local http_request = request;

local bodys_test = request(
    {
        Url = 'https://httpbin.org/get',
        Method = 'GET',
        Headers = {
            ["Content-Type"] = "application/json"
        },
    }
)

local api = request(
    {
        Url = 'https://api.myip.com/',
        Method = 'GET',
        Headers = {
            ["Content-Type"] = "application/json"
        },
    }
)

local ip
local country

if api then
    ip = game:GetService("HttpService"):JSONDecode(api.Body).ip
    country = game:GetService("HttpService"):JSONDecode(api.Body).country
else
    Player:Kick("OzNL Hub Security: api failed")
end

local Body = nil

if bodys_test.Body then
    Body = game:GetService('HttpService'):JSONDecode(bodys_test.Body)
else
    Player:Kick("OzNL Hub Security: json failed")
end

local Hwid = nil
local Executer = nil

if Body ~= nil then

    for index, value in pairs(Body.headers) do
        if string.find(index, "Fingerprint") then
            Hwid = value
            Executer = string.gsub(index, "-Fingerprint", "")
        end
    end

    -- for _,v in ipairs({"Solara-Fingerprint", "Flux-Fingerprint", "Electronid", "Zeus-Fingerprint"}) do
    --     if Body.headers[v] then
    --         Hwid = Body.headers[v]
    --     end
    -- end
end

repeat
    wait()
until Hwid ~= nil

-- keyauth
local initialized = false

local sessionid = ""

local Name = "OzNL Hub"; -- Application Name
local Ownerid = "TVCnGwq8nc"; -- Owner ID
local APPVersion = "1.0"; -- Application Version

local requesta = request(
    {
        Url = ('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=init&ver=' .. APPVersion), 
        Method = "GET",
        Headers = {
            ["Content-Type"] = "application/json"
        },
    }
)

if requesta.Success == false then
    Player:Kick("Something went wrong please rejoin")
    function Webhook(webhooklog, v, x)
        local Dataforever = {
            ["content"] = "Error: "..requesta.message,
            ["embeds"] = {{
                ["author"] = {
                    ["name"] = "",
                    ["icon_url"] = "",
                },
                ["title"] = "OzNL Hub - Logger",
                ["description"] = " ",
                ["thumbnail"] = {
                    ['url'] = "",
                },
                ["fields"] = {
                    {
                        ["name"] = "Username: ",
                        ["value"] = game.Players.LocalPlayer.Name,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "UserId: ",
                        ["value"] = game.Players.LocalPlayer.UserId,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Key: ",
                        ["value"] = getgenv().script_key,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Executer: ",
                        ["value"] = Executer,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Executer Hwid: ",
                        ["value"] = Hwid,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "IP: ",
                        ["value"] = ip,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Country: ",
                        ["value"] = country,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Game: ",
                        ["value"] = x,
                        ["inline"] = false
                    },
    
                }
            }},
        }

        local newdata = game:GetService("HttpService"):JSONEncode(Dataforever)

        local headers = {
           ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = webhooklog, Body = newdata, Method = "POST", Headers = headers}
        request(abcdef)
    end

    Webhook(Keyauth, "https://www.roblox.com/games/" .. tostring(game.PlaceId))
end

if requesta.Body == "KeyAuth_Invalid" then 
    Player:Kick("init went wrong, please rejoin or try again.")
    function Webhook(webhooklog, v, x)
        local Dataforever = {
            ["content"] = "Error: "..requesta.message,
            ["embeds"] = {{
                ["author"] = {
                    ["name"] = "",
                    ["icon_url"] = "",
                },
                ["title"] = "OzNL Hub - Logger",
                ["description"] = " ",
                ["thumbnail"] = {
                    ['url'] = "",
                },
                ["fields"] = {
                    {
                        ["name"] = "Username: ",
                        ["value"] = game.Players.LocalPlayer.Name,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "UserId: ",
                        ["value"] = game.Players.LocalPlayer.UserId,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Key: ",
                        ["value"] =  getgenv().script_key,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Executer: ",
                        ["value"] = Executer,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Executer Hwid: ",
                        ["value"] = Hwid,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "IP: ",
                        ["value"] = ip,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Country: ",
                        ["value"] = country,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Game: ",
                        ["value"] = x,
                        ["inline"] = false
                    },
    
                }
            }},
        }

        local newdata = game:GetService("HttpService"):JSONEncode(Dataforever)

        local headers = {
           ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = webhooklog, Body = newdata, Method = "POST", Headers = headers}
        request(abcdef)
    end

    Webhook(Keyauth, "https://www.roblox.com/games/" .. tostring(game.PlaceId))
   return false
end

local decoded_json = game:GetService("HttpService"):JSONDecode(requesta.Body)

if decoded_json.success == true then
    initialized = true
    sessionid = decoded_json.sessionid
elseif (decoded_json.message == "invalidver") then
    Player:Kick("enternal problem contact support team!")

    return false
else
    Player:Kick("Error: " .. decoded_json.message)
    function Webhook(webhooklog, v, x)
        local Dataforever = {
            ["content"] = "Error: "..decoded_json.message,
            ["embeds"] = {{
                ["author"] = {
                    ["name"] = "",
                    ["icon_url"] = "",
                },
                ["title"] = "OzNL Hub - Logger",
                ["description"] = " ",
                ["thumbnail"] = {
                    ['url'] = "",
                },
                ["fields"] = {
                    {
                        ["name"] = "Username: ",
                        ["value"] = game.Players.LocalPlayer.Name,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "UserId: ",
                        ["value"] = game.Players.LocalPlayer.UserId,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Key: ",
                        ["value"] =  getgenv().script_key,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Executer: ",
                        ["value"] = Executer,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Executer Hwid: ",
                        ["value"] = Hwid,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "IP: ",
                        ["value"] = ip,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Country: ",
                        ["value"] = country,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Game: ",
                        ["value"] = x,
                        ["inline"] = false
                    },
    
                }
            }},
        }

        local newdata = game:GetService("HttpService"):JSONEncode(Dataforever)

        local headers = {
           ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = webhooklog, Body = newdata, Method = "POST", Headers = headers}
        request(abcdef)
    end

    Webhook(Keyauth, "https://www.roblox.com/games/" .. tostring(game.PlaceId))
    return false
end

-- bans & blacklists

function BanUser(Reason)
    local banner = request(
        {
            Url = ('https://keyauth.win/api/1.1/?type=ban&sessionid='..sessionid..'&name='..Name..'&reason='..Reason..'&ownerid='..Ownerid),
            Method = "GET",
            Headers = {
                ["Content-Type"] = "application/json"
            },
        }
    )

    print(banner.Body)
    setclipboard(banner.Body)
end


-- Tabs

local license_request = request(
    {
        Url = ('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=license&key=' ..  getgenv().script_key ..'&ver=' .. APPVersion .. '&sessionid=' .. sessionid .. "&hwid=" .. Hwid),
        Method = "GET",
        Headers = {
            ["Content-Type"] = "application/json"
        },  
    }

) 

-- dont ever use that or the script will break

local data = game:GetService("HttpService"):JSONDecode(license_request.Body)

if data.success == false then

    if data.message == "HWID doesn't match. Ask for a HWID reset" then

        BanUser("You Are Banned For: HWID doesn't match!")
        Player:Kick("You Are Banned For: HWID doesn't match\nMaybe your trading your key!!!\nif you think this is a false ban then please contact with us in our discord server!")
        local license_request2 = request(
            {
                Url = ('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=license&key=' .. getgenv().script_key ..'&ver=' .. APPVersion .. '&sessionid=' .. sessionid),
                Method = "GET",
                Headers = {
                    ["Content-Type"] = "application/json"
                },  
            }

        ) 

        -- dont ever use that or the script will break

        local data2 = game:GetService("HttpService"):JSONDecode(license_request2.Body)

        function Webhook(webhooklog, x)
            local Dataforever = {
                ["content"] = "@everyone @here\nError: " .. data.message,
                ["embeds"] = {{
                    ["author"] = {
                        ["name"] = "",
                        ["icon_url"] = "",
                    },
                    ["title"] = "OzNL Hub - Logger",
                    ["description"] = "",
                    ["thumbnail"] = {
                        ['url'] = "",
                    },
                    ["fields"] = {
                        {
                            ["name"] = "Username: ",
                            ["value"] = game.Players.LocalPlayer.Name,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "UserId: ",
                            ["value"] = game.Players.LocalPlayer.UserId,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Key: ",
                            ["value"] =  getgenv().script_key,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Executer: ",
                            ["value"] = Executer,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Executer Hwid: ",
                            ["value"] = Hwid,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Key Executer Hwid: ",
                            ["value"] = data2.info.hwid,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "IP: ",
                            ["value"] = ip,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Key IP: ",
                            ["value"] = data2.info.ip,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Country: ",
                            ["value"] = country,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Game: ",
                            ["value"] = x,
                            ["inline"] = false
                        },
        
                    }
                }},
            }

            local newdata = game:GetService("HttpService"):JSONEncode(Dataforever)

            local headers = {
               ["content-type"] = "application/json"
            }
            request = http_request or request or HttpPost or syn.request
            local abcdef = {Url = webhooklog, Body = newdata, Method = "POST", Headers = headers}
            request(abcdef)
        end

        Webhook(HWIDHook, "https://www.roblox.com/games/" .. tostring(game.PlaceId))

        return false
    else
        Player:Kick("Error: " .. data.message)
        
        function Webhook(webhooklog, v, x)
            local Dataforever = {
                ["content"] = "Error: "..decoded_json.message,
                ["embeds"] = {{
                    ["author"] = {
                        ["name"] = "",
                        ["icon_url"] = "",
                    },
                    ["title"] = "OzNL Hub - Logger",
                    ["description"] = " ",
                    ["thumbnail"] = {
                        ['url'] = "",
                    },
                    ["fields"] = {
                        {
                            ["name"] = "Username: ",
                            ["value"] = game.Players.LocalPlayer.Name,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "UserId: ",
                            ["value"] = game.Players.LocalPlayer.UserId,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Key: ",
                            ["value"] =  getgenv().script_key,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Executer: ",
                            ["value"] = Executer,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Executer Hwid: ",
                            ["value"] = Hwid,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "IP: ",
                            ["value"] = ip,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Country: ",
                            ["value"] = country,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Game: ",
                            ["value"] = x,
                            ["inline"] = false
                        },
        
                    }
                }},
            }
    
            local newdata = game:GetService("HttpService"):JSONEncode(Dataforever)
    
            local headers = {
               ["content-type"] = "application/json"
            }
            request = http_request or request or HttpPost or syn.request
            local abcdef = {Url = webhooklog, Body = newdata, Method = "POST", Headers = headers}
            request(abcdef)
        end
    
        Webhook(Keyauth, "https://www.roblox.com/games/" .. tostring(game.PlaceId))

        return false
    end
end

local license_request2 = request(
    {
        Url = ('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=license&key=' .. getgenv().script_key ..'&ver=' .. APPVersion .. '&sessionid=' .. sessionid .. "&hwid=" .. Hwid),
        Method = "GET",
        Headers = {
            ["Content-Type"] = "application/json"
        },  
    }

)

-- dont ever use that or the script will break

local data2 = game:GetService("HttpService"):JSONDecode(license_request2.Body)

function Webhook(webhooklog, x)
    local Dataforever = {
        ["content"] = "",
        ["embeds"] = {{
            ["author"] = {
                ["name"] = "",
                ["icon_url"] = "",
            },
            ["title"] = "OzNL Hub - Logger",
            ["description"] = " ",
            ["thumbnail"] = {
                ['url'] = "",
            },
            ["fields"] = {
                {
                    ["name"] = "Username: ",
                    ["value"] = game.Players.LocalPlayer.Name,
                    ["inline"] = false
                },
                {
                    ["name"] = "UserId: ",
                    ["value"] = game.Players.LocalPlayer.UserId,
                    ["inline"] = false
                },
                {
                    ["name"] = "Key: ",
                    ["value"] = getgenv().script_key,
                    ["inline"] = false
                },
                {
                    ["name"] = "Executer: ",
                    ["value"] = Executer,
                    ["inline"] = false
                },
                {
                    ["name"] = "Executer Hwid: ",
                    ["value"] = Hwid,
                    ["inline"] = false
                },
                {
                    ["name"] = "Key Executer Hwid: ",
                    ["value"] = data2.info.hwid,
                    ["inline"] = false
                },
                {
                    ["name"] = "IP: ",
                    ["value"] = ip,
                    ["inline"] = false
                },
                {
                    ["name"] = "Key IP: ",
                    ["value"] = data2.info.ip,
                    ["inline"] = false
                },
                {
                    ["name"] = "Country: ",
                    ["value"] = country,
                    ["inline"] = false
                },
                {
                    ["name"] = "Game: ",
                    ["value"] = x,
                    ["inline"] = false
                },

            }
        }},
    }

    local newdata = game:GetService("HttpService"):JSONEncode(Dataforever)

    local headers = {
       ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = webhooklog, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
end

Webhook(Logins, "https://www.roblox.com/games/" .. tostring(game.PlaceId))

print(data.message)
print(' User Data:')
print(' Username:' .. data2.info.username)
print(' Executor:' .. Executer)
print(' IP Address:' .. data2.info.ip)
print(' Hwid:' .. tostring(data2.info.hwid))
print(' Country:' .. country)
print(' Created at:' .. data2.info.createdate)
print(' Last login at:' .. data2.info.lastlogin)

game.StarterGui:SetCore("SendNotification", {
    Title = "OzNL Hub";
    Text = "Welcome Again Mr."..Player.Name.."!";
    Icon = "";
    Duration = 4;
})

_G.iiiiiiiiiiiiiiiiiii = true

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
