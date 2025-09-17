from odoo import models, fields

class CraftingRecipe(models.Model):
    _name = "crafting.recipe"
    _description = "Minecraft Crafting Recipe"

    name = fields.Char("Tên Công Thức", required=True)
    description = fields.Text("Mô tả")
    result_item_id = fields.Many2one("crafting.item", string="Sản phẩm tạo ra", required=True)
    grid_ids = fields.One2many("crafting.grid.cell", "recipe_id", string="Lưới chế tạo (3x3)")
