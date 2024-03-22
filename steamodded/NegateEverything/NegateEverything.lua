--- STEAMODDED HEADER
--- MOD_NAME: Negative Everything
--- MOD_ID: NegateEverything
--- MOD_AUTHOR: [WilsontheWolf]
--- MOD_DESCRIPTION: NegateEverything
----------------------------------------------
------------MOD CODE -------------------------
function SMODS.INIT.NegateEverything()
    print("NegateEverything Activated!")
end

local origDraw = Card.draw

function dump(o, depth)
    if depth == nil then
        depth = 3
    end
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. (depth == 0 and "..." or dump(v, depth - 1)) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

function Card:draw(layer)
    origDraw(self, layer)
    if self.sprite_facing == 'front' then
        self.children.center:draw_shader('negative', nil, self.ARGS.send_to_shader)
        self.children.center:draw_shader('negative_shine', nil, self.ARGS.send_to_shader)
        if self.children.front and self.ability.effect ~= 'Stone Card' then
            self.children.front:draw_shader('negative', nil, self.ARGS.send_to_shader)
        end

        -- If the card has any edition/seal, add that here
        if self.edition or self.seal or self.ability.eternal or self.sticker or self.ability.set == 'Spectral' or
            self.debuff or self.greyed or self.ability.name == 'The Soul' or self.ability.set == 'Voucher' or
            self.ability.set == 'Booster' or self.config.center.soul_pos or self.config.center.demo then
            if (self.ability.set == 'Voucher' or self.config.center.demo) and
                (self.ability.name ~= 'Antimatter' or
                    not (self.config.center.discovered or self.bypass_discovery_center)) then
                self.children.center:draw_shader('voucher', nil, self.ARGS.send_to_shader)
            end
            if self.ability.set == 'Booster' or self.ability.set == 'Spectral' then
                self.children.center:draw_shader('booster', nil, self.ARGS.send_to_shader)
            end
            if self.edition and self.edition.holo then
                self.children.center:draw_shader('holo', nil, self.ARGS.send_to_shader)
                if self.children.front and self.ability.effect ~= 'Stone Card' then
                    self.children.front:draw_shader('holo', nil, self.ARGS.send_to_shader)
                end
            end
            if self.edition and self.edition.foil then
                self.children.center:draw_shader('foil', nil, self.ARGS.send_to_shader)
                if self.children.front and self.ability.effect ~= 'Stone Card' then
                    self.children.front:draw_shader('foil', nil, self.ARGS.send_to_shader)
                end
            end
            if self.edition and self.edition.polychrome then
                self.children.center:draw_shader('polychrome', nil, self.ARGS.send_to_shader)
                if self.children.front and self.ability.effect ~= 'Stone Card' then
                    self.children.front:draw_shader('polychrome', nil, self.ARGS.send_to_shader)
                end
            end
            if self.seal then
                G.shared_seals[self.seal].role.draw_major = self
                G.shared_seals[self.seal]:draw_shader('dissolve', nil, nil, nil, self.children.center)
                if self.seal == 'Gold' then
                    G.shared_seals[self.seal]:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil,
                        self.children.center)
                end
            end
            if self.ability.eternal then
                G.shared_sticker_eternal.role.draw_major = self
                G.shared_sticker_eternal:draw_shader('dissolve', nil, nil, nil, self.children.center)
                G.shared_sticker_eternal:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center)
            end
            if self.sticker and G.shared_stickers[self.sticker] then
                G.shared_stickers[self.sticker].role.draw_major = self
                G.shared_stickers[self.sticker]:draw_shader('dissolve', nil, nil, nil, self.children.center)
                G.shared_stickers[self.sticker]:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil,
                    self.children.center)
            end

            if self.ability.name == 'The Soul' and (self.config.center.discovered or self.bypass_discovery_center) then
                local scale_mod = 0.05 + 0.05 * math.sin(1.8 * G.TIMERS.REAL) + 0.07 *
                                      math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14) *
                                      (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
                local rotate_mod = 0.1 * math.sin(1.219 * G.TIMERS.REAL) + 0.07 *
                                       math.sin((G.TIMERS.REAL) * math.pi * 5) *
                                       (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

                G.shared_soul.role.draw_major = self
                G.shared_soul:draw_shader('dissolve', 0, nil, nil, self.children.center, scale_mod, rotate_mod, nil,
                    0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL), nil, 0.6)
                G.shared_soul:draw_shader('dissolve', nil, nil, nil, self.children.center, scale_mod, rotate_mod)
            end

            if self.config.center.soul_pos and (self.config.center.discovered or self.bypass_discovery_center) then
                local scale_mod = 0.07 + 0.02 * math.sin(1.8 * G.TIMERS.REAL) + 0.00 *
                                      math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14) *
                                      (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
                local rotate_mod = 0.05 * math.sin(1.219 * G.TIMERS.REAL) + 0.00 *
                                       math.sin((G.TIMERS.REAL) * math.pi * 5) *
                                       (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

                if self.ability.name == 'Hologram' then
                    self.hover_tilt = self.hover_tilt * 1.5
                    self.children.floating_sprite:draw_shader('hologram', nil, self.ARGS.send_to_shader, nil,
                        self.children.center, 2 * scale_mod, 2 * rotate_mod)
                    self.hover_tilt = self.hover_tilt / 1.5
                else
                    self.children.floating_sprite:draw_shader('dissolve', 0, nil, nil, self.children.center, scale_mod,
                        rotate_mod, nil, 0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL), nil, 0.6)
                    self.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, self.children.center,
                        scale_mod, rotate_mod)
                end

            end
            if self.debuff then
                self.children.center:draw_shader('debuff', nil, self.ARGS.send_to_shader)
                if self.children.front and self.ability.effect ~= 'Stone Card' then
                    self.children.front:draw_shader('debuff', nil, self.ARGS.send_to_shader)
                end
            end
            if self.greyed then
                self.children.center:draw_shader('played', nil, self.ARGS.send_to_shader)
                if self.children.front and self.ability.effect ~= 'Stone Card' then
                    self.children.front:draw_shader('played', nil, self.ARGS.send_to_shader)
                end
            end
        end
    end
end
----------------------------------------------
------------MOD CODE END----------------------
