love.window.setTitle("Buckets")

io.stdout:setvbuf('no')
love.graphics.setLineWidth(5)

require "libs.useful"
Class = require "libs.hump.class"

local w,h = love.window.getMode()
screen = {}
screen.w, screen.h = w,h
screen.aspect = w / h
canvas = {
  w = 1280
}
canvas.scale = screen.w / canvas.w
canvas.h = canvas.w / screen.aspect

Bucket = require "entities.bucket"
BucketScreen = require "entities.bucketScreen"

keyp = {}
keyh = {}

time = 0

function love.mousepressed(x,y,b)
  if b == 1 then
    
  end
end

function love.mousereleased(x,y,b)
  if b == 1 then
    
  end
end

function love.keypressed(key)
	--fullscreen
	if key == "f11" then
		love.window.setFullscreen(not love.window.getFullscreen())
  
  elseif key == "escape" then
    love.event.quit()
  
  elseif key == "r" then
    love.load()
  
  else
    keyp[key] = true
    keyh[key] = true
  end
end

function love.load()
  top = Bucket()
  top.children = {Bucket(), Bucket(), Bucket(), Bucket(), Bucket(), Bucket()}
  top.filler = true
  top.fillerMode = "Even"
  top:addIncome(500.11)

  sc = BucketScreen()
end

function love.keyreleased(key)
  keyh[key] = false
end

function love.update(dt)
  time = time + 1
  
  
  
  keyp = {}
end

function love.draw()
  sc:draw()
end