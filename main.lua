love.window.setTitle("Buckets")

io.stdout:setvbuf('no')
love.graphics.setLineWidth(5)

require "libs.useful"
Class = require "libs.hump.class"
wf = require "libs.windfield.windfield"

local w,h = love.window.getMode()
screen = {}
screen.w, screen.h = w,h
screen.aspect = w / h
canvas = {
  w = 1280
}
canvas.scale = screen.w / canvas.w
canvas.h = canvas.w / screen.aspect

Handler = require "entities.inputHandler"

Bucket = require "entities.bucket"
BucketScreen = require "entities.bucketScreen"

fonts = {
  R = love.graphics.newFont("assets/Roboto-Regular.ttf", 24),
  L = love.graphics.newFont("assets/Roboto-Light.ttf", 24),
}

time = 0

Handler:hbind("zoomin", "up")
Handler:hbind("zoomout", "down")
Handler:hbind("right", "d")
Handler:hbind("left", "a")
Handler:hbind("up", "w")
Handler:hbind("down", "s")

function love.load()
  top = Bucket()
  top.children = {Bucket(), Bucket(), Bucket(), Bucket(), Bucket(), Bucket()}
  top.filler = true
  top.fillerMode = "Even"
  top:addIncome(500.11)
  
  Handler:pbind("restart", "r")
  Handler:pbind("quit", "escape")
  Handler:pbind("add", "v")
  Handler:pbind("child", "c")
end

function love.update(dt)
  time = time + 1
  Handler:update()
  
  if actions.quit then
    love.event.quit()
  elseif actions.restart then
    love.load()
  end
  
  if actions.add then
    top:addIncome(50.11)
  end
  
  if actions.child then
    top:addChild()
  end
end

function love.draw()
  Screen:draw()
end