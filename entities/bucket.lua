-- Filler Modes
--   Unallocated - Don't fill
--          Even - Fill evenly
--    Percentage - Fill percentage-wise
--         Exact - Fill with exact amounts

-- The image which is the background of buckets
BucketImage = {
  w = 100,
  h = 100,
  draw = function(self,x,y)
    love.graphics.setColor(0.3, 0.3, 0.3)
    love.graphics.rectangle("fill", x - self.w / 2, y - self.w / 2, self.w, self.h)
  end
}

-- Individual bucket
Bucket = Class{
  init = function(self)
    self.parent = nil
    self.money = 0
    
    self.name = "Bucket"
    
    self.filler = false
    self.fillerMode = nil
    self.children = {}
  end,
  
  draw = function(self, x, y)
    local x = x or 0
    local y = y or 0
    
    for i, child in ipairs(self.children) do
      local childrenWidth = BucketImage.w * 2 * (#self.children - 1)
      local childX = x + (i - 1) * (childrenWidth / (#self.children - 1)) - childrenWidth / 2
      local childY = y + BucketImage.h * 2
      
      love.graphics.setColor(1,0,0)
      love.graphics.line(x, y, childX, childY)
      
      child:draw(childX, childY)
    end
    
    BucketImage:draw(x,y)
    
    love.graphics.setColor(1,1,1)
    
    love.graphics.setFont(fonts.R)
    love.graphics.printf(self.name, x - BucketImage.w, y - BucketImage.h / 3, BucketImage.w * 2, "center")
    
    local money = string.format("%.2f", self.money)
    love.graphics.setFont(fonts.L)
    love.graphics.printf(money, x - BucketImage.w, y, BucketImage.w * 2, "center")
  end,
  
  addChange = function(self, change)
    if change < 0 then
      self:addTransaction(change)
    else
      self:addIncome(change)
    end
  end,
  
  addIncome = function(self, change, fillerMode, fillerInfo)
    local fillerMode = self.fillerMode or fillerMode
    
    if self.filler and fillerMode and #self.children > 0 then
      if fillerMode == "Unallocated" then
        self.money = self.money + change
      
      elseif fillerMode == "Even" then
        local divvyBase = change / #self.children
        local divvy = round(divvyBase - 0.00499999, 0.01)
        local leftoverDiff = divvyBase - divvy
        local leftover = 0
        
        for i, child in ipairs(self.children) do
          leftover = leftover + leftoverDiff
          
          local addAmount = divvy + round(leftover - 0.00499999, 0.01)
          child:addIncome(addAmount)
          
          leftover = leftover % 0.01
        end
      end
    
    else
      self.money = self.money + change
    end
  end,
  
  addTransaction = function(self, change)
    
  end,
  
  addChild = function(self)
    table.insert(self.children, Bucket())
  end,
}

return Bucket