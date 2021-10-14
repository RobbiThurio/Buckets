-- The screen which displays the layout of buckets

BucketWorld = wf.newWorld(0, 0, true)

Screen = {
  canvas = love.graphics.newCanvas(canvas.w, canvas.h),
  zoom = 1,
  x = canvas.w / 2,
  y = canvas.h / 2,
  
  draw = function(self)
    love.graphics.setCanvas(self.canvas)
    love.graphics.clear()
    
    love.graphics.setColor(0.8,0.8,0.8)
    love.graphics.rectangle("fill", 10, 10, canvas.w - 20, canvas.h - 20)
    
    love.graphics.setColor(1,1,1)
    
    self.zoom = 1 + abs(dsin(time))
    self.x = canvas.w / 2 + 200 * dcos(time * 1.5)
    self.y = canvas.h / 2 + 200 * dsin(time)
    
    love.graphics.translate(canvas.w / 2 - self.x * self.zoom, canvas.h / 2 - self.y * self.zoom)
    love.graphics.scale(self.zoom, self.zoom)
    
    top:draw(canvas.w / 2, canvas.h / 2.5)
    
    love.graphics.setColor(1,1,1)
    love.graphics.origin()
    love.graphics.setCanvas()
    
    love.graphics.draw(self.canvas, self.w, self.h, 0, canvas.scale, canvas.scale)
  end,
}

return Screen