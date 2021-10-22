-- The screen which displays the layout of buckets

BucketWorld = wf.newWorld(0, 0, true)

Screen = {
  canvas = love.graphics.newCanvas(canvas.w, canvas.h),
  zoom = 1,
  x = canvas.w / 2,
  y = canvas.h / 2,
  
  move = function(self, x, y)
    self.x = self.x + x / self.zoom * 10
    self.y = self.y + y / self.zoom * 10
  end,
  
  zoomF = function(self, amnt)
    self.zoom = self.zoom + amnt * self.zoom / 25
    self.zoom = clamp(self.zoom, 0.5, 10)
  end,
  
  draw = function(self)
    local LR = bti(actions.right) - bti(actions.left)
    local UD = bti(actions.down) - bti(actions.up)
    
    self:move(LR,UD)
    
    local Z = bti(actions.zoomin) - bti(actions.zoomout)
    
    self:zoomF(Z)
    
    love.graphics.setCanvas(self.canvas)
    love.graphics.clear()
    
    love.graphics.setColor(0.8,0.8,0.8)
    love.graphics.rectangle("fill", 10, 10, canvas.w - 20, canvas.h - 20)
    
    love.graphics.setColor(1,1,1)
    
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