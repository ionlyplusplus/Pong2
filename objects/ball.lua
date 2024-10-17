Ball = Class{}

function Ball:init(x, y, R)
    self.x = x
    self.y = y
    self.R = R
    self.dx = math.random(2) == 1 and -100 or 100
    self.dy =  math.random(-50, 50)


end

function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

end

function Ball:reset(dt)
    self.x = VIRTUAL_WIDTH / 2 - 4
    self.y = VIRTUAL_HEIGHT / 2 - 4
    self.dx = math.random(2) == 1 and -100 or 100
    self.dy =  math.random(-50, 50)
end

-- function Ball:colision(P)
--     -- return (
--     --     P.x > self.x + self.R or
--     --     self.x > P.x + P.width or
--     --     P.y > self.y + self.R or
--     --     self.y > P.y + P.height
--     -- )
--     return not (
--         self.x - self.R > P.x + P.width or  -- Ball is to the right of the paddle
--         self.x + self.R < P.x or            -- Ball is to the left of the paddle
--         self.y - self.R > P.y + P.height or -- Ball is below the paddle
--         self.y + self.R < P.y               -- Ball is above the paddle
--     )
-- end
function Ball:colision(P)
    return not (
        self.x - self.R > P.x + P.width or  -- Ball is to the right of the paddle
        self.x + self.R < P.x or            -- Ball is to the left of the paddle
        self.y - self.R > P.y + P.height or -- Ball is below the paddle
        self.y + self.R < P.y               -- Ball is above the paddle
    )
end

function Ball:draw()
    love.graphics.circle('fill', self.x, self.y, self.R)
end