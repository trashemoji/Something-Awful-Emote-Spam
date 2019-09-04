function classicEmotes_OnLoad()
end

function classicEmotes_OnUpdate(self, elapsed)
end

local function classicEmotesFilter(self, event, mesg, author, ...)
  if strfind(mesg, "\124H") then return false end
  mesg = messageReplaceFilter(":%w+:", mesg)
  return false, mesg, author, ...
end

function messageReplaceFilter(match, mesg)
  for emote in string.gmatch(mesg, match) do
    emote = emote.gsub(emote, ":", "")
    if (Emotedata[emote]) then
      mesg = mesg.gsub(mesg, ":" .. emote .. ":", showEmote(emote))
    end
  end
  return mesg
end

function showEmote(emoticon)
    local emoteMeta = Emotedata[emoticon]

    return "\124TInterface\\AddOns\\ClassicEmotes\\Textures\\" .. emoteMeta.Texture .. ":" .. emoteMeta.Height .. ":" .. emoteMeta.Width .. ":0:0\124t"
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL",             classicEmotesFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY",                 classicEmotesFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL",                classicEmotesFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER",             classicEmotesFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD",               classicEmotesFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER",             classicEmotesFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY",               classicEmotesFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID",                classicEmotesFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND",        classicEmotesFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER",         classicEmotesFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND_LEADER", classicEmotesFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER",        classicEmotesFilter)