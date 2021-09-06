-- The screen which displays the layout of buckets
Screen = Class{
  init = function(self)
    self.canvas = love.graphics.newCanvas(canvas.w, canvas.h)
  end,
  
  draw = function(self)
    love.graphics.setCanvas(self.canvas)
    
    love.graphics.setColor(0.8,0.8,0.8)
    love.graphics.rectangle("fill", 10, 10, canvas.w - 20, canvas.h - 20)
    
    love.graphics.setColor(1,1,1)
    top:draw(canvas.w / 2, canvas.h / 4)
    
    love.graphics.setColor(1,1,1)
    love.graphics.setCanvas()
    love.graphics.draw(self.canvas, self.w, self.h, 0, canvas.scale, canvas.scale)
  end,
}

return Screen