pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
px = 60
py = 60
pr = 4
pc = 12
pdx = 0
pdy = 0
v = 0.7
frame_count = 0
enemies_x = {}
enemies_y = {}
enemies_dx = {}
enemies_dy = {}
enemy_lspeed = 2


function _init()
end

function boundaries(min, max, val)
    if val < min then
        return min
    end
    if val > max then
        return max
    end
    return val
end

function move()
    horiz_press = false
    vert_press = false
    if btn(0) then
        pdx = -v
        horiz_press = true
    end
    if btn(1) then
        pdx = v
        horiz_press = true
    end
    if btn(2) then
        pdy = -v
        vert_press = true
    end
    if btn(3) then
        pdy = v
        vert_press = true
    end

    if not(horiz_press) then
        pdx /= 1.2
    end
    if not(vert_press) then        
        pdy /= 1.2
    end

    new_px = px + pdx
    if new_px < 127 - pr and new_px > pr then
        px += pdx
    else
        px = boundaries(pr, 127 - pr, new_px)
    end
    new_py = py + pdy
    if new_py < 127 - pr and new_py > pr then
        py += pdy
    else
        py = boundaries(pr, 127 - pr, new_py)
    end
end

function spawn_enemy()
    frame_count += 1
    if frame_count % 30 == 0 then
        side = 0--flr(rnd(4))
        spawn_place = flr(rnd(127))
        enemy_x = 0
        enemy_y = 0
        if side == 0 then
            enemy_x = spawn_place
            add(enemies_x,enemy_x)
            add(enemies_y, enemy_y)
            angle = atan2(px-enemy_x, py - enemy_y)
            add(enemy_dx, enemy_lspeed * cos(angle))
            add(enemy_dy, enemy_lspeed * sin(angle))
        elseif side == 1 then
        elseif side == 2 then
        elseif side == 3 then
        end
    end
end

function update_enemies()
    print(count(enemies_x), 0, 60)
    if count(enemies_x) > 0 then
        for i=1,#enemies_x do
            enemies_x[i] += enemies_dx[i]
            enemies_y[i] += enemies_dy[i]
        end
    end
end

function _update60()
	move()
    --spawn_enemy()
    --update_enemies()
end



function _draw()
    cls()
    rectfill(0,0,127,127,1)
    circfill(px, py, pr, pc)
    for i=1,#enemies_x do
        circfill(enemiesx[i], enemies_y[i], pr, 10)
    end
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000bbbb0000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000b8b8b000b8b8b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000bbbbbb00bbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000bbbbbbb0bbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000b00b0000b00b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000b00b000b00bb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
