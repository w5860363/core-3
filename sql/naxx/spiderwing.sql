-- Venom Stalker Poson charge repeats every 10-20 sec, and targets a random hostile, not current tank
UPDATE `creature_ai_scripts` SET `event_flags`=3, `event_param3`=10000, `event_param4`=20000, `action1_param2`=4 WHERE `id`=1597601;

-- Poisonous Skitterer scale reduced, increased movementspeed
UPDATE `creature_template` SET `scale`='0.5', `speed_run`='1.75', `speed_walk`='3.5' WHERE `entry`=15977;

-- naxxramas acolyte arcane explosion spell changed to one with 1.5sec cast time, and timers randomized slightly 
UPDATE `creature_ai_scripts` SET `event_param2`=3000, `event_param3`=7000, `event_param4`=9000, `action1_param1`=30096 WHERE `id`=1598101;

-- naxxramas acolyte shadowbolt timer randomized more
UPDATE `creature_ai_scripts` SET `event_param2`=5000, `event_param3`=7000, `event_param4`=9000 WHERE `id`=1598102;


-- Portal of naxxxramas to EventAI
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=16420;

-- Portal of naxxramas casts Portal of Shadow on itself on spawn, which triggers a spawn of a ghost every 10 sec
DELETE FROM `creature_ai_scripts` where id = 1642001;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1642001, 16420, 11, 0, 100, 0, 0, 0, 0, 0, 11, 28384, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast portal of naxxramas on self');


-- Spirit of Naxxramas given script and correct faction
UPDATE `creature_template` SET `AIName`='', `ScriptName`='spirit_of_naxxramas_ai', `minhealth`=150000, `maxhealth`=150000 WHERE `entry`=16449;

-- Ghost of Naxxramas 
UPDATE `creature_template` SET `minlevel`=61, `maxlevel`=61, `armor`=3200, `mindmg`=1500, `maxdmg`=2200, `attackpower`=320, `dmg_multiplier`=1, `type`=6, `MovementType`=1, `speed_walk`='0.5', `speed_run`='0.5', `AIName`='EventAI' WHERE `entry`=16419;

-- ghost of naxxramas zone combat pulse on spawn
DELETE FROM `creature_ai_scripts` where id = 1641901;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1641901, 16419, 11, 0, 100, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'ghost of naxxramas zone combat pulse on spawn');

-- ghost of naxxramas suecide if in combat for more than 30 sec
DELETE FROM `creature_ai_scripts` where id = 1641902;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1641902, 16419, 0, 0, 100, 0, 30000, 30000, 0, 0, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'ghost of naxxramas suecide');

UPDATE creature_template SET `MechanicImmuneMask`=1023383290 where entry in 
(
15981, -- naxxramas acoloyte
15980, -- naxxramas cultist
15975, -- carrion spinner
15977, -- poisonous skitter
15976, -- venom stalker
15978, -- crypt reaver
15974, -- dread creaper
16453 -- necro stalker
);

-- plagued gargoyle switch from eventAI to script. Immmune to pmuch everything
UPDATE `creature_template` SET `AIName`='', `MechanicImmuneMask`=1073725439, `ScriptName`='naxxramas_gargoyle_ai' WHERE `entry`=16446;

-- carrion spinners dmg increase
UPDATE `creature_template` SET `mindmg`='3000', `maxdmg`='3500' WHERE `entry`=15975;

-- Necro stalker poison charge now targets random person and repeats every 10-20s
UPDATE `creature_ai_scripts` SET `event_flags`=3, `event_param3`=10000, `event_param4`=20000, `action1_param2`=4 WHERE `id`=1645301;

-- Plagued Ghoul cleave
DELETE FROM `creature_ai_scripts` where id = 1644704;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1644704, 16447, 0, 0, 100, 1, 0, 0, 7000, 8000, 11, 26350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Ghoul cleave');


-- Updated timer of Necropolis Acolyte shadow bolt volley such that it happens at the same time as arcane explosion
UPDATE `creature_ai_scripts` SET `event_param1`=2000, `event_param2`=2000, `event_param3`=5000, `event_param4`=5000 WHERE `id`=1636802;

-- plagued ghoul immunities
UPDATE `creature_template` SET `MechanicImmuneMask`=13109328 WHERE `entry`=16447;

-- replace crypt reaver with tomb horror after faerlina
update creature SET id = 15979, modelid = 15942 where guid = 5061270;

REPLACE INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1644801, 16448, 0, 0, 100, 1, 6000, 8000, 8000, 10000, 11, 30121, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Deathhound forceful howl');
-- Plagued deathhound ai
UPDATE `creature_template` SET `minhealth`=93736, `maxhealth`=93736, `maxmana`=0, `scale`=2.5, `AIName`='EventAI' WHERE `entry`=16448;