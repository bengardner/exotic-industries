-- age techs will get researchable, if a certain percentage of techs from the previous age is researched

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

local age_enabler = {}

--====================================================================================================
--AGE ENABLER
--====================================================================================================

function age_enabler.get_researched_age_techs(force, dummy_tech)
    -- count how many techs from a age are researched
    -- this is counted as those techs are prerequisites of the dummy tech

    local researchedAgeTechs = 0
    local dummy_prototype = game.technology_prototypes[dummy_tech]
    local dummy_list = dummy_prototype.prerequisites
    -- dummy_list of the form {"tech_1", "tech_2", ...}

    -- dummy_list lenght is total of resarchable techs from previous age that count
    local totalTechs = ei_lib.getn(dummy_list)

    if not dummy_prototype then
        log("Error: "..dummy_tech.." not found in game.technology_prototypes")
        return
    end

    -- loop over all techs from the dummy_list and count them if they are researched
    for _,v in ipairs(dummy_list) do
        if force.technologies[v].researched then
            researchedAgeTechs = researchedAgeTechs + 1
        end
    end

    return researchedAgeTechs, totalTechs
end

function age_enabler.on_research_finished()
    -- loop over ages, since age tech names are same as age names
    -- check for every tech if X% of techs from previous age are researched
    -- if so, enable tech for research

    local neededPercentage = ei_lib.config("age-enabler:neededPercentage")

    for _,age in ipairs(ei_data.ages) do
        -- nothing todo for dark age
        if not (age == "dark-age") then

            -- check if age tech is already researched or enabled
            -- if so skip it
            -- do this for player force
            force = game.forces[1]

            if not force.technologies["ei_"..age].researched then
                -- count how many techs from previous age are researched
                -- here we already have the dummy tech name as "ei_"..age

                local researchedAgeTechs, totalTechs = age_enabler.get_researched_age_techs(force, "ei_"..age..":dummy")

                -- calculate current reasearch percentage of total techs
                -- if => then neededPercentage eneable next age tech for research
                -- here next age is "ei_"..age

                local currentPercentage = (researchedAgeTechs / totalTechs) * 100
                if currentPercentage > neededPercentage then
                    force.technologies["ei_"..age].enabled = true
                end
            end
        end
    end

end

return age_enabler