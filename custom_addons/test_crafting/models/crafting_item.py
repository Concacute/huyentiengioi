from odoo import models, fields, api

class CraftingItem(models.Model):
    _name = "crafting.item"
    _description = "Minecraft Item"
    _order = "name"

    name = fields.Char("Tên Item", required=True, index=True)
    image = fields.Binary("Ảnh Item")
    category = fields.Selection([
        ('material', "Nguyên liệu"),
        ('tool', "Công cụ"),
        ('weapon', "Binh khí"),
        ('armor', "Giáp"),
        ('food', "Đan dược"),
        ('other', "Khác")
    ], string="Loại", default='material', index=True)
    
    import_id = fields.Char("ID Import", help="ID dùng cho import từ CSV")