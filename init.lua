-- Window management 

hs.hotkey.bind({"cmd", "shift"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.h = max.h
  f.w = max.w / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "shift"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.h = max.h
  f.w = max.w / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "shift"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.y = max.y
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "shift"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.y = max.y + (max.h / 2)
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "shift"}, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x 
  f.y = max.y
  f.w = max.w
  f.h = max.h 
  win:setFrame(f)
end)

-- Standard apps

hs.hotkey.bind({"cmd", "shift"}, "pad7", function()
  hs.application.open("Firefox.app")
end)

hs.hotkey.bind({"cmd", "shift"}, "pad8", function()
  hs.application.open("Emacs.app")
end)

hs.hotkey.bind({"cmd", "shift"}, "pad9", function()
  hs.application.open("Finder.app")
end)

-- Custom apps

hs.hotkey.bind({"cmd", "shift"}, "pad4", function()
  hs.application.open("Sublime Text.app")
end)

hs.hotkey.bind({"cmd", "shift"}, "pad5", function()
  hs.application.open("Alacritty.app")
end)

hs.hotkey.bind({"cmd", "shift"}, "pad6", function()
  hs.application.open("Spotify.app")
end)

-- Browser actions

hs.hotkey.bind({"cmd", "shift"}, "pad1", function()
  hs.application.open("Firefox.app")
  hs.eventtap.event.newKeyEvent({"cmd"}, "t", true):post()
end)

hs.hotkey.bind({"cmd", "shift"}, "pad2", function()
  hs.application.open("Firefox.app")
  hs.eventtap.event.newKeyEvent({"cmd"}, "y", true):post()
end)

hs.hotkey.bind({"cmd", "shift"}, "pad3", function()
  hs.application.open("Firefox.app")
  hs.eventtap.event.newKeyEvent({"cmd"}, "l", true):post()
  hs.eventtap.keyStrokes("http://localhost:3000/")
  hs.eventtap.event.newKeyEvent(nil, "return", true):post()
end)

-- Hammerspoon

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()
