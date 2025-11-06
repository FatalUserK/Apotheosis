dofile("data/Apotheosis/apotheosis_utils.lua")
BubbleMaterials = {
    {
        material = "acid",
        probability = 10,
        func = function(self, entity_id) end
    }
}



function init(entity_id)
    local target = random_from_weighted_table(BubbleMaterials)
    if target.func then target:func(entity_id) end
    local material = target.material
    local amount = target.amount or 1200

    local dcomp = EntityGetFirstComponent(entity_id ,"DamageModelComponent")
    if dcomp then
        ComponentSetValue2(dcomp ,"blood_material", material)
        ComponentSetValue2(dcomp ,"blood_spray_material", material)
        ComponentSetValue2(dcomp ,"ragdoll_material", material)
    end

    AddMaterialInventoryMaterial(entity_id, material, amount)
end