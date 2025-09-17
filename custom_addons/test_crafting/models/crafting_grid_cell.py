from odoo import models, fields

class CraftingGridCell(models.Model):
    _name = "crafting.grid.cell"
    _description = "Crafting Grid Cell"

    recipe_id = fields.Many2one("crafting.recipe", string="Công thức", required=True, ondelete="cascade")
    row = fields.Selection([
        ('1', "Hàng 1"),
        ('2', "Hàng 2"),
        ('3', "Hàng 3"),
    ], string="Hàng", required=True)

    col = fields.Selection([
        ('1', "Cột 1"),
        ('2', "Cột 2"),
        ('3', "Cột 3"),
    ], string="Cột", required=True)

    item_id = fields.Many2one("crafting.item", string="Nguyên liệu")
