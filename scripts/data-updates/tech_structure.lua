-- change prerequisites of vanilla techs for IE
-- at first sort them into their respective ages
-- also add age attribute to each tech
-- take all techs with same attribute age and make them prerequisites of their dummy tech
-- more detailed structure will get added later on

local ei_data = require("lib/data")

--====================================================================================================
--FUNCTIONS
--====================================================================================================

local function set_prerequisites(tech, prerequisite)

    -- test if both in data.raw
    if not data.raw["technology"][tech] then
        log("Error: "..tech.." not found in data.raw")
        return
    end

    if not data.raw["technology"][prerequisite] then
        log("Error: "..prerequisite.." not found in data.raw")
        return
    end

    -- set prerequisites:

    -- if the only current prerequisite is "ei_temp" then simply setting is fine
    -- otherwise add the new prerequisite to the list of prerequisites
    if data.raw["technology"][tech].prerequisites[1] == "ei_temp" then
        data.raw["technology"][tech].prerequisites = {prerequisite}
    else
       table.insert(data.raw["technology"][tech].prerequisites, prerequisite)
    end

end

local function set_prerequisites_for_ages(table_in)
    -- use tech_structure table where keys correspond to "ei_KEY" tech

    for i,v in pairs(table_in) do
        local prerequisite = "ei_"..i

        -- set prerequisite for every tech in sub-table
        for x,y in ipairs(table_in[i]) do
            set_prerequisites(y, prerequisite)
        end
    end

end

local function set_packs(tech, ingredients)
    -- test if tech is in data.raw
    if not data.raw["technology"][tech] then
        log("Error: "..tech.." not found in data.raw")
        return
    end

    -- set pack for tech
    data.raw["technology"][tech].unit.ingredients = ingredients

end

local function add_age_attribute(tech, age)
    -- test if tech is in data.raw
    if not data.raw["technology"][tech] then
        log("Error: "..tech.." not found in data.raw")
        return
    end

    -- add age attribute to tech
    data.raw["technology"][tech].age = age

end

local function set_packs_for_ages(tech_structure, science_packs)
    -- use tech_structure where keys is age
    -- science packs are keyed by age

    for i,v in pairs(tech_structure) do
        local age = i

        -- loop over all techs for age and set pack to their corresponding pack
        for x,y in ipairs(tech_structure[i]) do
            set_packs(y, science_packs[i])
            add_age_attribute(y, age)
        end
    end

end

local function make_dummy_techs(ages_dummy_dict)
    -- loop over all techs in the game
    -- if they have the age attribute
    -- look up the next age in the ages_dummy_dict
    -- and set them as prerequisite for the dummy tech

    for i,v in pairs(data.raw["technology"]) do
        if data.raw["technology"][i].age then
            local next_age = "ei_"..ages_dummy_dict[data.raw["technology"][i].age]..":dummy"
            
            if next_age then
                set_prerequisites(next_age, i)
            end
        end
    end

end

local function set_new_prerequisites(table_in)
    -- table_in is idexed by ages
    -- loop over all ages

    for x,y in pairs(table_in) do

        -- table_in[age] is a table where keys are tech names and values are prerequisites to set
        -- set prerequisites for all techs in table_in

        for i,v in pairs(table_in[x]) do
            set_prerequisites(i, v)
        end
    end

end

--====================================================================================================
--DO IT
--====================================================================================================

local prerequisites_to_set = ei_data.prerequisites_to_set
local science_packs = ei_data.science
local tech_structure = ei_data.tech_structure
local ages_dummy_dict = ei_data.ages_dummy_dict
-- structure of tech_structure is:
-- tech_structure["dark-age"] ...

set_prerequisites_for_ages(tech_structure)
set_packs_for_ages(tech_structure, science_packs)
make_dummy_techs(ages_dummy_dict)
set_new_prerequisites(prerequisites_to_set)