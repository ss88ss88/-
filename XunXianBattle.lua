-- 寻仙任务战斗结束钩子
-- 处理击败仙门守护兽后的任务进度

Delegate.RegInit("XunXianBattle_Init");

local XunXianBattle = nil;

-- 怪物ID定义
local MONSTER_GUARDIAN = 20075  -- 仙门守护兽

-- 物品ID定义
local ITEM_SEAL_KEY = 70101     -- 封印之钥

function XunXianBattle_Initialize(_MeIndex)
    return true;
end

function XunXianBattle_Init()
    if (XunXianBattle == nil) then
        XunXianBattle = NL.CreateNpc("lua/Module/XunXianBattle.lua", "XunXianBattle_Initialize");
        NLG.UpChar(XunXianBattle);
    end
end

-- 战斗结束钩子：处理任务进度
function XunXianBattle_OnBattleOver(battle_id, result)
    -- 仅处理战斗胜利 (result 可能是 "victory" 或 1)
    if result ~= 1 and result ~= "victory" then
        return
    end

    -- 获取战斗中的所有玩家
    for i = 0, 9 do
        local player = Battle.GetPlayer(battle_id, i)
        if player and player ~= -1 then
            -- 检查玩家是否有进行中的寻仙任务第三步
            local q3Status = tonumber(Field.Get(player, "QStat_3003")) or 0
            if q3Status == 1 then
                -- 检查战斗中是否击败了仙门守护兽
                for j = 10, 19 do
                    local enemy = Battle.GetPlayer(battle_id, j)
                    if enemy and enemy ~= -1 then
                        local monsterId = Char.GetData(enemy, 100)
                        if monsterId == MONSTER_GUARDIAN then
                            -- 检查是否已获得封印之钥
                            local hasKey = Char.CheckItem(player, ITEM_SEAL_KEY)
                            if hasKey < 1 then
                                -- 给予封印之钥
                                Char.GiveItem(player, ITEM_SEAL_KEY, 1);
                                NLG.SystemMessage(player, "[任务] 你已击败仙门守护兽！");
                                NLG.SystemMessage(player, "[任务] 获得【封印之钥】x1");
                                NLG.SystemMessage(player, "[任务] 回去找寻仙老人，解开仙门封印吧！");
                            end
                        end
                    end
                end
            end
        end
    end
end

Delegate.RegDelBattleOverEvent("XunXianBattle_OnBattleOver");

print("寻仙任务战斗钩子加载成功");
