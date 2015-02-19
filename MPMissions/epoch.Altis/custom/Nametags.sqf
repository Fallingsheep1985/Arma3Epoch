Waituntil{!isNull player};

while{true} do {
sleep 0.5;
if((isPlayer cursorTarget) && (alive cursorTarget) && (side cursorTarget == side player) && (player distance cursorTarget < 8)) then {
_color = getArray (configFile/'CfgInGameUI'/'SideColors'/'colorFriendly');
if (cursorTarget != _x) then {
                _color set [3, 1 - _dist]
            };
_tag = name cursorTarget;
cutText [_tag,"PLAIN",0.1];

} else {
};
};