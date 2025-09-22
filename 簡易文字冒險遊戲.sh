#!/bin/bash

# 變數定義
player_name=""
game_over=false
inventory=()
health=100
guardian_defeated=false
player_title=""

# 顯示玩家狀態
function show_status() {
    echo "=========================="
    echo "玩家: $player_name"
    echo "健康: $health"
    echo "背包: ${inventory[@]}"
    echo "稱號: $player_title"
    echo "=========================="
    echo
}

# 檢查健康狀態
function check_health() {
    if [ $health -le 0 ]; then
        echo "你死了，請重新挑戰"
        health=100
        inventory=()
        sleep 2
        first_scene
    fi
}

# 遊戲開始畫面
function start_game() {
    clear
    echo "=========================="
    echo "   歡迎來到冒險遊戲   "
    echo "=========================="
    echo
    read -p "請輸入你的名字: " player_name
    echo "你好，$player_name！你的冒險即將開始..."
    sleep 2
    first_scene
}

# 第一場景
function first_scene() {
    clear
    show_status
    echo "你站在一片森林的入口。"
    echo "1. 進入森林"
    echo "2. 離開"
    read -p "請選擇: " choice
    case $choice in
        1) forest_scene ;;
        2) game_over=true ;;
        *) echo "無效的選擇"; first_scene ;;
    esac
}

# 森林場景
function forest_scene() {
    clear
    show_status
    echo "你走進了森林。四周是一片茂密的樹木。"
    echo "1. 向左走"
    echo "2. 向右走"
    echo "3. 向前走"
    echo "4. 原地休息"
    read -p "請選擇: " choice
    case $choice in
        1) left_path ;;
        2) right_path ;;
        3) forward_path ;;
        4) rest ;;
        *) echo "無效的選擇"; forest_scene ;;
    esac
}

# 向左走的路徑
function left_path() {
    clear
    show_status
    event=$((RANDOM % 5))
    case $event in
        0) wolf_scene ;;
        1) bear_scene ;;
        2) spider_scene ;;
        3) troll_scene ;;
        4) demon_scene ;;
        *) echo "無效的選擇"; forest_scene ;;
    esac
}

# 向右走的路徑
function right_path() {
    clear
    show_status
    event=$((RANDOM % 5))
    case $event in
        0) chest_scene ;;
        1) snake_scene ;;
        2) spider_scene ;;
        3) troll_scene ;;
        4) demon_scene ;;
        *) echo "無效的選擇"; forest_scene ;;
    esac
}

# 向前走的路徑
function forward_path() {
    clear
    show_status
    event=$((RANDOM % 4))
    case $event in
        0) ruins_scene ;;
        1) bear_scene ;;
        2) snake_scene ;;
        3) demon_scene ;;
        *) echo "無效的選擇"; forest_scene ;;
    esac
}

# 狼場景
function wolf_scene() {
    clear
    show_status
    echo "你遇到了一隻狼。"
    echo "1. 戰鬥"
    echo "2. 逃跑"
    echo "3. 用食物引開狼"
    read -p "請選擇: " choice
    case $choice in
        1) fight_wolf ;;
        2) forest_scene ;;
        3) distract_wolf ;;
        *) echo "無效的選擇"; wolf_scene ;;
    esac
}

# 熊場景
function bear_scene() {
    clear
    show_status
    echo "你遇到了一隻熊。"
    echo "1. 戰鬥"
    echo "2. 逃跑"
    echo "3. 用食物引開熊"
    read -p "請選擇: " choice
    case $choice in
        1) fight_bear ;;
        2) forest_scene ;;
        3) distract_bear ;;
        *) echo "無效的選擇"; bear_scene ;;
    esac
}

# 大蜘蛛場景
function spider_scene() {
    clear
    show_status
    echo "你遇到了一隻大蜘蛛。"
    echo "1. 戰鬥"
    echo "2. 逃跑"
    read -p "請選擇: " choice
    case $choice in
        1) fight_spider ;;
        2) forest_scene ;;
        *) echo "無效的選擇"; spider_scene ;;
    esac
}

# 毒蛇場景
function snake_scene() {
    clear
    show_status
    echo "你遇到了一條毒蛇。"
    echo "1. 戰鬥"
    echo "2. 逃跑"
    echo "3. 用藥草治療自己"
    read -p "請選擇: " choice
    case $choice in
        1) fight_snake ;;
        2) forest_scene ;;
        3) use_herbs ;;
        *) echo "無效的選擇"; snake_scene ;;
    esac
}

# 寶箱場景
function chest_scene() {
    clear
    show_status
    echo "你找到了一個寶箱。"
    echo "1. 打開寶箱"
    echo "2. 回去"
    echo "3. 檢查四周"
    read -p "請選擇: " choice
    case $choice in
        1) open_chest ;;
        2) forest_scene ;;
        3) check_surroundings ;;
        *) echo "無效的選擇"; chest_scene ;;
    esac
}

# 廢墟場景
function ruins_scene() {
    clear
    show_status
    echo "你發現了一個古老的廢墟。"
    echo "1. 進入廢墟"
    echo "2. 繞過廢墟"
    echo "3. 設置營地"
    read -p "請選擇: " choice
    case $choice in
        1) enter_ruins ;;
        2) forest_scene ;;
        3) set_camp ;;
        *) echo "無效的選擇"; ruins_scene ;;
    esac
}

# 巨魔場景
function troll_scene() {
    clear
    show_status
    echo "你遇到了一隻巨魔。"
    echo "1. 戰鬥"
    echo "2. 逃跑"
    echo "3. 用火把嚇退巨魔"
    read -p "請選擇: " choice
    case $choice in
        1) fight_troll ;;
        2) forest_scene ;;
        3) scare_troll ;;
        *) echo "無效的選擇"; troll_scene ;;
    esac
}

# 惡魔場景
function demon_scene() {
    clear
    show_status
    echo "你遇到了一隻惡魔。"
    echo "1. 戰鬥"
    echo "2. 逃跑"
    echo "3. 用聖水擊退惡魔"
    read -p "請選擇: " choice
    case $choice in
        1) fight_demon ;;
        2) forest_scene ;;
        3) use_holy_water ;;
        *) echo "無效的選擇"; demon_scene ;;
    esac
}

# 戰鬥狼
function fight_wolf() {
    clear
    show_status
    echo "你決定與狼戰鬥。"
    if [[ " ${inventory[@]} " =~ " 劍 " ]]; then
        echo "你用你的劍擊敗了狼！"
        echo "你獲得了狼皮。"
        inventory+=("狼皮")
    else
        echo "你被狼擊傷了。"
        health=$((health - 20))
        check_health
    fi
    sleep 2
    forest_scene
}

# 用食物引開狼
function distract_wolf() {
    clear
    show_status
    echo "你用食物引開了狼。"
    if [[ " ${inventory[@]} " =~ " 食物 " ]]; then
        echo "狼被食物吸引，離開了。"
        inventory=("${inventory[@]/食物}")
    else
        echo "你沒有食物，只能逃跑。"
    fi
    sleep 2
    forest_scene
}

# 戰鬥熊
function fight_bear() {
    clear
    show_status
    echo "你決定與熊戰鬥。"
    if [[ " ${inventory[@]} " =~ " 弓箭 " ]]; then
        echo "你用你的弓箭擊敗了熊！"
        echo "你獲得了熊皮。"
        inventory+=("熊皮")
    else
        echo "你被熊擊傷了。"
        health=$((health - 40))
        check_health
    fi
    sleep 2
    forest_scene
}

# 用食物引開熊
function distract_bear() {
    clear
    show_status
    echo "你用食物引開了熊。"
    if [[ " ${inventory[@]} " =~ " 食物 " ]]; then
        echo "熊被食物吸引，離開了。"
        inventory=("${inventory[@]/食物}")
    else
        echo "你沒有食物，只能逃跑。"
    fi
    sleep 2
    forest_scene
}

# 戰鬥大蜘蛛
function fight_spider() {
    clear
    show_status
    echo "你決定與大蜘蛛戰鬥。"
    if [[ " ${inventory[@]} " =~ " 盾牌 " ]]; then
        echo "你用你的盾牌擊敗了大蜘蛛！"
        echo "你獲得了蜘蛛絲。"
        inventory+=("蜘蛛絲")
    else
        echo "你被大蜘蛛擊傷了。"
        health=$((health - 30))
        check_health
    fi
    sleep 2
    forest_scene
}

# 戰鬥毒蛇
function fight_snake() {
    clear
    show_status
    echo "你決定與毒蛇戰鬥。"
    if [[ " ${inventory[@]} " =~ " 解毒劑 " ]]; then
        echo "你用解毒劑擊敗了毒蛇！"
        echo "你獲得了蛇毒。"
        inventory=("${inventory[@]/解毒劑}")
        inventory+=("蛇毒")
    else
        echo "你被毒蛇擊傷了。"
        health=$((health - 20))
        check_health
    fi
    sleep 2
    forest_scene
}

# 用藥草治療自己
function use_herbs() {
    clear
    show_status
    echo "你用藥草治療了自己。"
    if [[ " ${inventory[@]} " =~ " 藥草 " ]]; then
        echo "你的健康恢復了一些。"
        health=$((health + 20))
        inventory=("${inventory[@]/藥草}")
    else
        echo "你沒有藥草。"
    fi
    sleep 2
    forest_scene
}

# 戰鬥巨魔
function fight_troll() {
    clear
    show_status
    echo "你決定與巨魔戰鬥。"
    if [[ " ${inventory[@]} " =~ " 劍 " ]]; then
        echo "你用你的劍擊敗了巨魔！"
        echo "你獲得了巨魔的寶藏。"
        inventory+=("巨魔的寶藏")
    else
        echo "你被巨魔擊傷了。"
        health=$((health - 50))
        check_health
    fi
    sleep 2
    troll_treasure_scene
}

#打開巨魔寶藏
function troll_treasure_scene() {
    clear
    show_status
    if [[ " ${inventory[@]} " =~ " 巨魔的寶藏 " ]]; then
        echo "你有一個巨魔的寶藏，是否要打開？"
        echo "1. 打開寶藏"
        echo "2. 不打開，先保留"
        read -p "請選擇: " choice
        case $choice in
            1)
                echo "你打開了巨魔的寶藏！"
                inventory=("${inventory[@]/巨魔的寶藏}") 
                treasure_items=("聖劍" "黃金" "珠寶" "魔法卷軸")
                reward=$(shuf -e "${treasure_items[@]}" -n 1)
                echo "你獲得了 $reward！"
                inventory+=("$reward")
                ;;
            2)
                echo "你選擇不打開寶藏，將它保留在背包中。"
                ;;
            *)
                echo "無效的選擇"
                troll_treasure_scene
                ;;
        esac
    fi
    sleep 2
    forest_scene
}

# 用火把嚇退巨魔
function scare_troll() {
    clear
    show_status
    echo "你用火把嚇退了巨魔。"
    if [[ " ${inventory[@]} " =~ " 火把 " ]]; then
        echo "巨魔被火把嚇退，逃跑了。"
        inventory=("${inventory[@]/火把}")
    else
        echo "你沒有火把，只能逃跑。"
    fi
    sleep 2
    forest_scene
}

# 戰鬥惡魔
function fight_demon() {
    clear
    show_status
    echo "你決定與惡魔戰鬥。"
    if [[ " ${inventory[@]} " =~ " 聖劍 " ]]; then
        echo "你用聖劍擊敗了惡魔！"
        echo "你獲得了惡魔之角。"
        inventory+=("惡魔之角")
    else
        echo "你被惡魔擊傷了。"
        health=$((health - 60))
        check_health
    fi
    sleep 2
    forest_scene
}

# 用聖水擊退惡魔
function use_holy_water() {
    clear
    show_status
    if [[ " ${inventory[@]} " =~ " 聖水 " ]]; then
        echo "你用聖水擊退了惡魔。"
        inventory=("${inventory[@]/聖水}")
    else
        echo "你沒有聖水，只能逃跑。"
    fi
    sleep 2
    forest_scene
}

# 打開寶箱
function open_chest() {
    clear
    show_status
    echo "你打開了寶箱，裡面有一些物品。"
    items=("劍" "弓箭" "盾牌" "食物" "火把" "聖水")
    choices=($(shuf -e "${items[@]}" -n 4))
    echo "寶箱裡有以下物品："
    for i in "${!choices[@]}"; do
        echo "$((i + 1)). ${choices[i]}"
    done
    read -p "請選擇一個物品: " choice
    case $choice in
        1) inventory+=("${choices[0]}") ;;
        2) inventory+=("${choices[1]}") ;;
        3) inventory+=("${choices[2]}") ;;
        4) inventory+=("${choices[3]}") ;;
        *) echo "無效的選擇"; open_chest ;;
    esac
    forest_scene
}

# 檢查四周
function check_surroundings() {
    clear
    show_status
    echo "你仔細檢查了四周，發現了一些有用的物品。"
    echo "1. 解毒劑"
    echo "2. 藥草"
    read -p "請選擇一個物品: " choice
    case $choice in
        1) inventory+=("解毒劑") ;;
        2) inventory+=("藥草") ;;
        *) echo "無效的選擇"; check_surroundings ;;
    esac
    forest_scene
}

# 進入廢墟
function enter_ruins() {
    clear
    show_status
    if $guardian_defeated; then
        echo "你已經擊敗了守護者，成功地找到了寶藏。"
        player_title="勇者"
        echo "恭喜你，$player_name，你完成了冒險並成功通關！"
        game_over=true
    else
        echo "你進入了廢墟，遇到了守護者。"
        echo "1. 戰鬥"
        echo "2. 逃跑"
        read -p "請選擇: " choice
        case $choice in
            1) fight_guardian ;;
            2) forest_scene ;;
            *) echo "無效的選擇"; enter_ruins ;;
        esac
    fi
}

# 戰鬥守護者
function fight_guardian() {
    clear
    show_status
    echo "你決定與守護者戰鬥。"
    if [[ " ${inventory[@]} " =~ " 劍 " && " ${inventory[@]} " =~ " 盾牌 " ]]; then
        echo "你用你的劍和盾牌擊敗了守護者！"
        guardian_defeated=true
        player_name="勇者 $player_name"
        echo "恭喜你，$player_name，你完成了冒險並成功通關！"
        game_over=true
    else
        echo "你被守護者擊傷了。"
        health=100
        echo "你死了，請重新進入森林再次挑戰。"
        sleep 2
        first_scene
    fi
}

# 設置營地
function set_camp() {
    clear
    show_status
    echo "你設置了一個營地，恢復了健康。"
    health=$((health + 30))
    if [ $health -gt 100 ]; then
        health=100
    fi
    sleep 2
    forest_scene
}

# 休息
function rest() {
    clear
    show_status
    echo "你決定原地休息，恢復了一些健康。"
    health=$((health + 10))
    if [ $health -gt 100 ]; then
        health=100
    fi
    sleep 2
    forest_scene
}

# 遊戲主循環
while [ $game_over = false ]; do
    start_game
done

echo "遊戲結束，感謝遊玩！"