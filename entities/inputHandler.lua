actions = {}

Handler = {
  -- Key press and key held
  keyh = {},
  keyp = {},
  pbindings = {},
  hbindings = {},
  
  -- Update function called every frame
  update = function(self)
    actions = {}
    
    for key, action in pairs(self.pbindings) do
      actions[action] = self.keyp[key]
    end
    
    for key, action in pairs(self.hbindings) do
      actions[action] = self.keyh[key]
    end
    
    self.keyp = {}
  end,
  
  hbind = function(self, action, inputs)
    if type(inputs) == "string" then
      inputs = {inputs}
    end
    
    for i, key in ipairs(inputs) do
      self.hbindings[key] = action
    end
  end,
  
  pbind = function(self, action, inputs)
    if type(inputs) == "string" then
      inputs = {inputs}
    end
    
    for i, key in ipairs(inputs) do
      self.pbindings[key] = action
    end
  end,
  
  unbind = function(self, inputs)
    
  end,
  
  unbindAll = function(self)
    self.pbindings = {}
    self.hbindings = {}
    
    self:unbindCallback()
  end,
  
  unbindCallback = function(self)
  end,
  
  scroll = function(self, x, y)
    self:scrollCallback(x,y)
  end,
  
  scrollCallback = function(self, x, y)
  end,
  
  dragCallback = function(self, x, y, dx, dy)
  end,
  
  keypressCallback = function(self, key)
  end,
  
  keyreleaseCallback = function(self,key)
  end,
}


function love.wheelmoved(x, y)
  Handler:scroll(x,y)
end

function love.mousepressed( x, y, button, istouch, presses )
  Handler.keyp["mb" .. button] = true
  Handler.keyh["mb" .. button] = true
end

function love.mousereleased( x, y, button, istouch, presses)
  Handler.keyh["mb" .. button] = false
end

function love.mousemoved(x,y,dx,dy)
  
end

function love.touchpressed( id, x, y, dx, dy, pressure )
  
end

function love.keypressed(key, scan, isrepeat)
  Handler.keyp[key] = true
  Handler.keyh[key] = true
end

function love.keyreleased(key, scan)
  Handler.keyh[key] = false
end

return Handler