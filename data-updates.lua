--if not mods["bobplates"] then
    --update barreling recipes
    for name, recipe in pairs(data.raw["recipe"]) do
        if recipe.category == "crafting-with-fluid" and recipe.ingredients and recipe.results and recipe.subgroup and (recipe.subgroup == "fill-barrel" or recipe.subgroup == "empty-barrel") then
            if string.find(name, "barrel") then
                local barrel = false
                for _, data in ipairs(recipe.ingredients) do
                    if data and data.name == "barrel" then
                        barrel = true
                    end
                end
                for _, data in ipairs(recipe.results) do
                    if data and data.name == "barrel" then
                        barrel = true
                    end
                end

                if barrel then
                    if not recipe.additional_categories then
                        recipe.additional_categories = {}
                    end
                    table.insert(recipe.additional_categories, "injection")
                end
            end
        end
    end


    --[[update assembling machines
    for name, am in pairs(data.raw["assembling-machine"]) do
        if am.crafting_categories then
            local cats = {}

            for _, category in ipairs(am.crafting_categories) do
                cats[category] = true
            end

            if cats["crafting-with-fluid"] or cats["injection"] then
                if not cats["crafting-with-fluid-or-injection"] then
                    table.insert(am.crafting_categories, "crafting-with-fluid-or-injection")
                end
            end
        end
    end--]]
--end
